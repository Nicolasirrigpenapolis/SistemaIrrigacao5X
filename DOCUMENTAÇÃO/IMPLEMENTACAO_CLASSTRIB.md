# Implementação ClassTrib no Sistema Irrigação

## Índice
1. [Objetivo](#objetivo)
2. [Estado Atual](#estado-atual)
3. [Arquitetura Proposta](#arquitetura-proposta)
4. [Etapas de Implementação](#etapas-de-implementação)
5. [Detalhamento Técnico](#detalhamento-técnico)
6. [Testes](#testes)
7. [Checklist](#checklist)

---

## Objetivo

Implementar a integração com a tabela **ClassTrib** para:
1. Aplicar **reduções de IBS/CBS** baseadas na classificação tributária do produto
2. Incluir o código **cClassTrib** no XML da NFe
3. Usar o **CST correto** (000, 200, 300, etc.) no grupo IBSCBS

---

## Estado Atual

### CalculaImposto (IRRIG.BAS)

**Localização:** `IRRIG.BAS`, função `CalculaImposto`

**Cases 16 e 17 atuais:**
```vb
Case "16" 'Valor IBS (Imposto sobre Bens e Serviços - UF/Municipal)
   ' IBS = VrTotal * 0.1% (alíquota de transição 2026)
   CalculaImposto = Round(VrTotal * 0.001, 2)
   Exit Function
Case "17" 'Valor CBS (Contribuição sobre Bens e Serviços)
   ' CBS = VrTotal * 0.9% (alíquota de transição 2026)
   CalculaImposto = Round(VrTotal * 0.009, 2)
   Exit Function
```

**Problema:** Usa taxas fixas, não considera reduções do ClassTrib.

### Geração XML (NOTAFISC.FRM)

**Chamada atual:**
```vb
ibscbs_CST = "90"
ibscbs_cClassTrib = ""
det_IBSCBS = objNFeUtil.IBSCBSv130(ibscbs_CST, ibscbs_cClassTrib, "", gIBSCBS_xml, "", "")
```

**Problema:** CST fixo em "90" e cClassTrib vazio.

### DLL FlexDocs (v5.0.0n)

**Assinatura suportada:**
```vb
string IBSCBSv130(string CST, string cClassTrib, string indDoacao_Opc, string gTributo, string gEstornoCred_Opc, string gCredPresumido_Opc)
```

**Referência:** `2Gv5.00n\alteracao.txt` - RTC-5.0.0l-015

---

## Arquitetura Proposta

### Fluxo de Dados

```
┌─────────────────────────────────────────────────────────────────┐
│                         CADASTRO                                 │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ┌──────────┐    ┌─────────────────────┐    ┌──────────────┐   │
│  │ Produto  │───▶│ Classificação Fiscal│───▶│  ClassTrib   │   │
│  │          │    │       (NCM)         │    │              │   │
│  └──────────┘    └─────────────────────┘    └──────────────┘   │
│       │                    │                       │            │
│       │                    │                       │            │
│  Seq. Produto    [Seqüência da Classificação]  ClassTribId     │
│                                                    │            │
│                                              ┌─────▼─────┐      │
│                                              │ Reduções  │      │
│                                              │ IBS: 60%  │      │
│                                              │ CBS: 60%  │      │
│                                              │ CST: 200  │      │
│                                              │ Código:   │      │
│                                              │ 200038    │      │
│                                              └───────────┘      │
└─────────────────────────────────────────────────────────────────┘
```

### Fluxo de Cálculo

```
┌─────────────────────────────────────────────────────────────────┐
│               CalculaImposto (IRRIG.BAS)                        │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  1. Query TB2 com JOIN ClassTrib                               │
│         ↓                                                       │
│  2. Lê campos do ClassTrib:                                    │
│     - PercentualReducaoIBS                                     │
│     - PercentualReducaoCBS                                     │
│     - CodigoClassTrib                                          │
│     - CodigoSituacaoTributaria (CST)                          │
│         ↓                                                       │
│  3. Aplica fórmulas:                                           │
│     Case 16: IBS = VrTotal × 0.1% × (1 - ReducaoIBS/100)      │
│     Case 17: CBS = VrTotal × 0.9% × (1 - ReducaoCBS/100)      │
│     Case 18: Retorna CodigoClassTrib                          │
│     Case 19: Retorna CST do IBS/CBS                           │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│               Geração XML (NOTAFISC.FRM)                        │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  1. Busca valores:                                             │
│     cClassTrib = CalculaImposto(..., 18, ...)                  │
│     CST_IBSCBS = CalculaImposto(..., 19, ...)                  │
│         ↓                                                       │
│  2. Gera XML:                                                   │
│     IBSCBSv130(CST_IBSCBS, cClassTrib, "", gIBSCBS_xml, "", "")│
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## Etapas de Implementação

### Etapa 1: Verificar/Criar estrutura no banco

**Verificar se coluna existe:**
```sql
SELECT COLUMN_NAME 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'Classificação Fiscal' 
AND COLUMN_NAME = 'ClassTribId';
```

**Se não existir, criar:**
```sql
ALTER TABLE [Classificação Fiscal] 
ADD ClassTribId INT NULL;

-- Criar FK (opcional, mas recomendado)
ALTER TABLE [Classificação Fiscal]
ADD CONSTRAINT FK_ClassFiscal_ClassTrib 
FOREIGN KEY (ClassTribId) REFERENCES ClassTrib(Id);
```

### Etapa 2: Modificar CalculaImposto (IRRIG.BAS)

**2.1. Alterar query do TB2 para incluir JOIN com ClassTrib:**

```vb
' ANTES:
Set TB2 = vgDb.OpenRecordSet("SELECT * FROM [Classificação Fiscal] WHERE ...")

' DEPOIS:
Set TB2 = vgDb.OpenRecordSet( _
   "SELECT CF.*, " & _
   "CT.CodigoClassTrib, CT.CodigoSituacaoTributaria AS CST_IBSCBS, " & _
   "CT.PercentualReducaoIBS, CT.PercentualReducaoCBS, CT.ValidoParaNFe " & _
   "FROM [Classificação Fiscal] CF " & _
   "LEFT JOIN ClassTrib CT ON CF.ClassTribId = CT.Id " & _
   "WHERE CF.[Seqüência da Classificação] = " & Ncm & " ...")
```

**2.2. Modificar Cases 16 e 17:**

```vb
Case "16" 'Valor IBS (Imposto sobre Bens e Serviços)
   Dim ReducaoIBS As Double
   If Not IsNull(TB2!PercentualReducaoIBS) Then
      ReducaoIBS = TB2!PercentualReducaoIBS
   Else
      ReducaoIBS = 0 ' Sem redução se não tiver ClassTrib
   End If
   ' IBS = VrTotal × 0.1% × (1 - Redução/100)
   CalculaImposto = Round(VrTotal * 0.001 * (1 - ReducaoIBS / 100), 2)
   Exit Function

Case "17" 'Valor CBS (Contribuição sobre Bens e Serviços)
   Dim ReducaoCBS As Double
   If Not IsNull(TB2!PercentualReducaoCBS) Then
      ReducaoCBS = TB2!PercentualReducaoCBS
   Else
      ReducaoCBS = 0 ' Sem redução se não tiver ClassTrib
   End If
   ' CBS = VrTotal × 0.9% × (1 - Redução/100)
   CalculaImposto = Round(VrTotal * 0.009 * (1 - ReducaoCBS / 100), 2)
   Exit Function
```

**2.3. Adicionar Cases 18 e 19:**

```vb
Case "18" 'Código ClassTrib (para XML)
   If Not IsNull(TB2!CodigoClassTrib) Then
      CalculaImposto = TB2!CodigoClassTrib
   Else
      CalculaImposto = "" ' Vazio se não tiver ClassTrib
   End If
   Exit Function

Case "19" 'CST do IBS/CBS (para XML)
   If Not IsNull(TB2!CST_IBSCBS) Then
      CalculaImposto = TB2!CST_IBSCBS
   Else
      CalculaImposto = "90" ' CST padrão "Outros" se não tiver ClassTrib
   End If
   Exit Function
```

### Etapa 3: Modificar Geração XML (NOTAFISC.FRM)

**3.1. Na função MontaIBSCBS ou onde gera o XML do item:**

```vb
' Buscar ClassTrib e CST
Dim cClassTrib As String
Dim cstIBSCBS As String

cClassTrib = CalculaImposto(SeqProduto, SeqGeral, 18, Tabela, VrTotal, 0, SeqProp, Ncm)
cstIBSCBS = CalculaImposto(SeqProduto, SeqGeral, 19, Tabela, VrTotal, 0, SeqProp, Ncm)

' Se retornou vazio, usa padrões
If cClassTrib = "" Or IsEmpty(cClassTrib) Then cClassTrib = ""
If cstIBSCBS = "" Or IsEmpty(cstIBSCBS) Then cstIBSCBS = "90"

' Gerar XML com ClassTrib
det_IBSCBS = objNFeUtil.IBSCBSv130(cstIBSCBS, cClassTrib, "", gIBSCBS_xml, "", "")
```

### Etapa 4: Testar

1. Cadastrar um ClassTrib de teste
2. Vincular a uma Classificação Fiscal
3. Emitir nota com produto dessa classificação
4. Verificar valores calculados e XML gerado

---

## Detalhamento Técnico

### Tabelas Envolvidas

| Tabela | Campos Relevantes |
|--------|-------------------|
| **Produtos** | `[Seqüência do Produto]`, `[Seqüência da Classificação]` |
| **Conjuntos** | `[Seqüência do Conjunto]`, `[Seqüência da Classificação]` |
| **Classificação Fiscal** | `[Seqüência da Classificação]`, `NCM`, `ClassTribId` |
| **ClassTrib** | `Id`, `CodigoClassTrib`, `CodigoSituacaoTributaria`, `PercentualReducaoIBS`, `PercentualReducaoCBS`, `ValidoParaNFe` |

### Constantes de Alíquota (NOTAFISC.FRM)

```vb
' Já existentes no código:
Const RTC_PERC_IBSUF = 0.1    ' 0.1% IBS UF
Const RTC_PERC_IBSMUN = 0     ' 0% IBS Municipal (transição)
Const RTC_PERC_CBS = 0.9      ' 0.9% CBS
```

### Fórmulas de Cálculo

```
IBS Final = Valor × 0.1% × (1 - PercentualReducaoIBS)
CBS Final = Valor × 0.9% × (1 - PercentualReducaoCBS)
```

**IMPORTANTE:** Os campos `PercentualReducaoIBS` e `PercentualReducaoCBS` no banco são DECIMAL(8,5) e armazenam o valor já como fração:
- `0.60000` = 60% de redução
- `1.00000` = 100% de redução (isento)
- `0.00000` = 0% de redução (alíquota cheia)

**Exemplo:**
- Valor: R$ 1.000,00
- PercentualReducaoIBS: 0.60000 (60%)
- PercentualReducaoCBS: 0.60000 (60%)

```
IBS = 1000 × 0.001 × (1 - 0.60) = 1000 × 0.001 × 0.40 = R$ 0,40
CBS = 1000 × 0.009 × (1 - 0.60) = 1000 × 0.009 × 0.40 = R$ 3,60
```

### XML Esperado

```xml
<det nItem="1">
  <prod>
    <cProd>123</cProd>
    <xProd>TUBO DE ACO AGRICOLA</xProd>
    <NCM>73071920</NCM>
    <!-- ... -->
  </prod>
  <imposto>
    <IBSCBS>
      <CST>200</CST>
      <cClassTrib>200038</cClassTrib>
      <gIBSCBS>
        <vBC>1000.00</vBC>
        <gIBSUF>
          <pIBSUF>0.04</pIBSUF>
          <vIBSUF>0.40</vIBSUF>
        </gIBSUF>
        <vIBS>0.40</vIBS>
        <gCBS>
          <pCBS>0.36</pCBS>
          <vCBS>3.60</vCBS>
        </gCBS>
      </gIBSCBS>
    </IBSCBS>
  </imposto>
</det>
```

---

## Testes

### Cenário 1: Produto COM ClassTrib (Redução 60%)

| Item | Valor | Redução | IBS Esperado | CBS Esperado |
|------|-------|---------|--------------|--------------|
| Tubo agrícola | R$ 1.000,00 | 60% | R$ 0,40 | R$ 3,60 |

### Cenário 2: Produto SEM ClassTrib (Sem Redução)

| Item | Valor | Redução | IBS Esperado | CBS Esperado |
|------|-------|---------|--------------|--------------|
| Produto genérico | R$ 1.000,00 | 0% | R$ 1,00 | R$ 9,00 |

### Cenário 3: Produto com ClassTrib Isento (Redução 100%)

| Item | Valor | Redução | IBS Esperado | CBS Esperado |
|------|-------|---------|--------------|--------------|
| Trator agrícola | R$ 100.000,00 | 100% | R$ 0,00 | R$ 0,00 |

### Validações no XML

- [ ] Tag `<CST>` contém valor correto (000, 200, 300, etc.)
- [ ] Tag `<cClassTrib>` contém código de 6 dígitos
- [ ] Tags `<pIBSUF>` e `<pCBS>` refletem alíquota efetiva (com redução)
- [ ] Tags `<vIBSUF>` e `<vCBS>` contêm valores calculados corretamente

---

## Checklist

### Pré-requisitos
- [x] Tabela ClassTrib existe no banco
- [x] Coluna ClassTribId existe em [Classificação Fiscal]
- [ ] Pelo menos 1 ClassTrib cadastrado para teste
- [ ] Pelo menos 1 Classificação Fiscal vinculada ao ClassTrib

### Implementação
- [x] **Etapa 1:** Verificar/criar estrutura no banco
- [x] **Etapa 2.1:** Alterar query TB2 com JOIN ClassTrib
- [x] **Etapa 2.2:** Modificar Case 16 (IBS com redução)
- [x] **Etapa 2.3:** Modificar Case 17 (CBS com redução)
- [x] **Etapa 2.4:** Adicionar Case 18 (CodigoClassTrib)
- [x] **Etapa 2.5:** Adicionar Case 19 (CST IBS/CBS)
- [x] **Etapa 3:** Modificar geração XML no NOTAFISC.FRM

### Testes
- [ ] Testar produto COM ClassTrib
- [ ] Testar produto SEM ClassTrib
- [ ] Testar produto com ClassTrib isento (100% redução)
- [ ] Testar produto com ClassTrib ValidoParaNFe = 0
- [ ] Validar XML gerado
- [ ] Testar emissão em homologação

### Documentação
- [x] Atualizar CLAUDE.md com novas funcionalidades
- [x] Documentar novos Cases (18, 19) em comentários

### Melhorias v1.1 (26/11/2025)
- [x] Validação de ValidoParaNFe no Case 18
- [x] Pré-validação de ClassTrib no PreValidaNFE
- [x] Tratamento específico de rejeições IBS/CBS (cStat 700-799)
- [x] Tratamento específico de rejeições ClassTrib (cStat 800-899)
- [x] Detecção de erros IBS/CBS na mensagem de rejeição

---

## Referências

- **DLL FlexDocs:** `2Gv5.00n\alteracao.txt`
- **Documentação ClassTrib:** `DOCUMENTAÇÃO\CLASSTRIB_IBSCBS_EXPLICACAO.md`
- **Lei Complementar:** LC 214/2025 (Reforma Tributária)
- **Manual NFe 5.0:** Grupo IBSCBS

---

*Documento criado em: 26/11/2025*  
*Versão: 1.0*  
*Sistema: Irrigação Penápolis*
