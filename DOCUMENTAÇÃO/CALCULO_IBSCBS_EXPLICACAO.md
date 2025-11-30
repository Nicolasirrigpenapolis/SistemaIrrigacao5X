# Cálculo IBS/CBS - Explicação Completa

## Índice
1. [Visão Geral](#visão-geral)
2. [Alíquotas Base (Transição 2026)](#alíquotas-base-transição-2026)
3. [Estrutura do IBS](#estrutura-do-ibs)
4. [Como Funciona a Redução do ClassTrib](#como-funciona-a-redução-do-classtrib)
5. [Fluxo Completo do Cálculo](#fluxo-completo-do-cálculo)
6. [Geração do XML](#geração-do-xml)
7. [Exemplos Práticos](#exemplos-práticos)
8. [Preparação para o Futuro](#preparação-para-o-futuro)
9. [Referências no Código](#referências-no-código)

---

## Visão Geral

O sistema implementa o cálculo de **IBS** (Imposto sobre Bens e Serviços) e **CBS** (Contribuição sobre Bens e Serviços) conforme a **Reforma Tributária** (LC 214/2025), utilizando a tabela **ClassTrib** para aplicar reduções de alíquotas baseadas na classificação tributária do produto.

### Tributos Envolvidos

| Tributo | Nome Completo | Esfera | Destino |
|---------|---------------|--------|---------|
| **IBS UF** | Imposto sobre Bens e Serviços - UF | Estadual | Estado |
| **IBS Mun** | Imposto sobre Bens e Serviços - Municipal | Municipal | Município |
| **CBS** | Contribuição sobre Bens e Serviços | Federal | União |

---

## Alíquotas Base (Transição 2026)

### Constantes no Sistema

```vb
' Arquivo: NOTAFISC.FRM (linhas 5447-5450)
Private Const RTC_PERC_IBSUF As Double = 0.1    ' 0.1% para IBS Estadual
Private Const RTC_PERC_IBSMUN As Double = 0     ' 0% para IBS Municipal (ZERADO em 2026)
Private Const RTC_PERC_CBS As Double = 0.9      ' 0.9% para CBS Federal
```

### Tabela de Alíquotas na Transição

| Ano | IBS UF | IBS Municipal | CBS | Total |
|-----|--------|---------------|-----|-------|
| **2026** | 0.1% | 0% | 0.9% | **1.0%** |
| 2027 | ? | ? | ? | ~2-3% |
| 2028 | ? | ? | ? | ~5-8% |
| ... | ... | ... | ... | ... |
| 2033+ | ~13% | ~13% | ~9% | ~35% |

> **Nota:** Em 2026, estamos na fase de teste. O IBS Municipal ainda não está sendo cobrado, por isso `RTC_PERC_IBSMUN = 0`.

---

## Estrutura do IBS

### Divisão UF × Municipal

O IBS é um imposto **único** que é **dividido** entre Estado (UF) e Município:

```
IBS Total = IBS UF + IBS Municipal
```

### Em 2026 (Transição)

```
IBS Total = 0.1% + 0% = 0.1%
           ↑      ↑
        UF=0.1%  Mun=0%
```

### No Futuro (Exemplo 2033)

```
IBS Total = 13% + 13% = 26%
           ↑      ↑
        UF=13%  Mun=13%
```

### Por que Municipal é ZERO em 2026?

A Lei Complementar 214/2025 definiu uma **transição gradual**:
- **2026**: Fase de teste com alíquotas mínimas
- O IBS Municipal **ainda não entrou em vigor**
- Todo o IBS (0.1%) vai para o **Estado (UF)**
- A tag `<gIBSMun>` **não é gerada** no XML quando o valor é zero

---

## Como Funciona a Redução do ClassTrib

### Origem da Redução

```
Produto
   │
   └──► Classificação Fiscal (NCM)
            │
            └──► ClassTribId (FK)
                    │
                    └──► ClassTrib
                           ├── CodigoClassTrib: "200038"
                           ├── CodigoSituacaoTributaria: "200"
                           ├── PercentualReducaoIBS: 0.60000 (60%)
                           └── PercentualReducaoCBS: 0.60000 (60%)
```

### Fórmula de Cálculo

```
IBS = Valor × Alíquota_Base × (1 - PercentualReducaoIBS)
CBS = Valor × Alíquota_Base × (1 - PercentualReducaoCBS)
```

### Importante sobre o Campo de Redução

O campo `PercentualReducaoIBS` e `PercentualReducaoCBS` no banco de dados é do tipo **DECIMAL(8,5)** e armazena o valor como **fração**:

| Redução Desejada | Valor no Banco | Fator (1 - Redução) |
|------------------|----------------|---------------------|
| 0% (sem redução) | 0.00000 | 1.00 |
| 30% | 0.30000 | 0.70 |
| 60% | 0.60000 | 0.40 |
| 100% (isento) | 1.00000 | 0.00 |

---

## Fluxo Completo do Cálculo

### Etapa 1: Cadastro

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                           CADASTRO                                          │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  PRODUTO                                                                    │
│  └── [Seqüência da Classificação] ──► CLASSIFICAÇÃO FISCAL (NCM)           │
│                                        └── [ClassTribId] ──► CLASSTRIB     │
│                                                                             │
│  CLASSTRIB:                                                                 │
│  ┌─────────────────────────────────────────────────────────────────┐       │
│  │ CodigoClassTrib.............: 200038                            │       │
│  │ CodigoSituacaoTributaria....: 200                               │       │
│  │ DescricaoClassTrib..........: Redução 60% - Produtos agrícolas  │       │
│  │ PercentualReducaoIBS........: 0.60000 (60%)                     │       │
│  │ PercentualReducaoCBS........: 0.60000 (60%)                     │       │
│  │ ValidoParaNFe...............: 1 (Sim)                           │       │
│  │ Ativo.......................: 1 (Sim)                           │       │
│  └─────────────────────────────────────────────────────────────────┘       │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### Etapa 2: Cálculo (IRRIG.BAS)

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                    CÁLCULO (IRRIG.BAS - CalculaImposto)                     │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  QUERY TB2 (busca ClassTrib junto com NCM):                                │
│  ──────────────────────────────────────────                                │
│  SELECT CF.*, CT.CodigoClassTrib, CT.CodigoSituacaoTributaria AS CST_IBSCBS,│
│         CT.PercentualReducaoIBS, CT.PercentualReducaoCBS, CT.ValidoParaNFe │
│  FROM [Classificação Fiscal] CF                                            │
│  LEFT JOIN ClassTrib CT ON CF.ClassTribId = CT.Id                          │
│  WHERE CF.[Seqüência da Classificação] = {NCM}                             │
│                                                                             │
│  CASE 16 - Valor IBS:                                                      │
│  ─────────────────────                                                     │
│  ReducaoIBS = TB2!PercentualReducaoIBS   ' 0.60                            │
│  IBS = VrTotal × 0.001 × (1 - ReducaoIBS)                                  │
│      = 1000 × 0.001 × (1 - 0.60)                                           │
│      = 1000 × 0.001 × 0.40                                                 │
│      = R$ 0,40                                                              │
│                                                                             │
│  CASE 17 - Valor CBS:                                                      │
│  ─────────────────────                                                     │
│  ReducaoCBS = TB2!PercentualReducaoCBS   ' 0.60                            │
│  CBS = VrTotal × 0.009 × (1 - ReducaoCBS)                                  │
│      = 1000 × 0.009 × (1 - 0.60)                                           │
│      = 1000 × 0.009 × 0.40                                                 │
│      = R$ 3,60                                                              │
│                                                                             │
│  CASE 18 - Código ClassTrib (para XML):                                    │
│  ───────────────────────────────────────                                   │
│  Retorna: "200038"                                                         │
│                                                                             │
│  CASE 19 - CST IBS/CBS (para XML):                                         │
│  ─────────────────────────────────                                         │
│  Retorna: "200" (ou "90" se não tiver ClassTrib)                          │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### Etapa 3: Geração XML (NOTAFISC.FRM)

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                    GERAÇÃO XML (NOTAFISC.FRM - MontaIBSCBS)                 │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  ENTRADA (valores do banco):                                               │
│  ──────────────────────────                                                │
│  vIBS = R$ 0,40 (calculado por CalculaImposto Case 16)                     │
│  vCBS = R$ 3,60 (calculado por CalculaImposto Case 17)                     │
│  cClassTrib = "200038" (CalculaImposto Case 18)                            │
│  CST = "200" (CalculaImposto Case 19)                                      │
│  vBC = R$ 1.000,00 (valor do produto)                                      │
│                                                                             │
│  DIVISÃO DO IBS (UF × Municipal):                                          │
│  ─────────────────────────────────                                         │
│  Como RTC_PERC_IBSMUN = 0:                                                 │
│    vIBSUF = vIBS × (0.1 / (0.1 + 0)) = vIBS × 1 = R$ 0,40                 │
│    vIBSMun = vIBS × (0 / (0.1 + 0)) = 0                                   │
│                                                                             │
│  CÁLCULO DAS ALÍQUOTAS EFETIVAS:                                           │
│  ─────────────────────────────────                                         │
│  pIBSUF = (vIBSUF / vBC) × 100 = (0.40 / 1000) × 100 = 0.04%              │
│  pIBSMun = 0 (não é gerado)                                                │
│  pCBS = (vCBS / vBC) × 100 = (3.60 / 1000) × 100 = 0.36%                  │
│                                                                             │
│  CHAMADAS DLL FlexDocs:                                                    │
│  ──────────────────────                                                    │
│  gIBSUF_xml = objNFeUtil.gIBSUF(0.04, 0, 0, 0, 0, 0, 0.40)                │
│  gIBSMun_xml = "" (não gera porque vIBSMun = 0)                           │
│  gCBS_xml = objNFeUtil.gCBS(0.36, 0, 0, 0, 0, 0, 3.60)                    │
│  gIBSCBS_xml = objNFeUtil.gIBSCBSv130(1000, gIBSUF_xml, "", 0.40, gCBS_xml)│
│  det_IBSCBS = objNFeUtil.IBSCBSv130("200", "200038", "", gIBSCBS_xml, "", "")│
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## Geração do XML

### Estrutura Completa do Grupo IBSCBS

```xml
<det nItem="1">
  <prod>
    <cProd>12345</cProd>
    <xProd>TUBO DE AÇO AGRÍCOLA</xProd>
    <NCM>73071920</NCM>
    <CFOP>5102</CFOP>
    <uCom>UN</uCom>
    <qCom>10.0000</qCom>
    <vUnCom>100.00</vUnCom>
    <vProd>1000.00</vProd>
    <!-- ... demais campos ... -->
  </prod>
  <imposto>
    <!-- Impostos tradicionais (ICMS, IPI, PIS, COFINS) -->
    
    <!-- GRUPO IBSCBS (NFe 5.0 RTC) -->
    <IBSCBS>
      <CST>200</CST>                        <!-- CST do ClassTrib -->
      <cClassTrib>200038</cClassTrib>       <!-- Código ClassTrib -->
      <gIBSCBS>
        <vBC>1000.00</vBC>                  <!-- Base de Cálculo -->
        <gIBSUF>
          <pIBSUF>0.04</pIBSUF>             <!-- Alíquota efetiva (0.1% × 40%) -->
          <vIBSUF>0.40</vIBSUF>             <!-- Valor IBS UF -->
        </gIBSUF>
        <!-- gIBSMun NÃO GERADO (vIBSMun = 0 em 2026) -->
        <vIBS>0.40</vIBS>                   <!-- Total IBS -->
        <gCBS>
          <pCBS>0.36</pCBS>                 <!-- Alíquota efetiva (0.9% × 40%) -->
          <vCBS>3.60</vCBS>                 <!-- Valor CBS -->
        </gCBS>
      </gIBSCBS>
    </IBSCBS>
  </imposto>
</det>
```

### Quando ClassTrib NÃO existe (produto sem vínculo)

```xml
<IBSCBS>
  <CST>90</CST>                             <!-- CST padrão "Outros" -->
  <!-- cClassTrib NÃO É GERADO -->
  <gIBSCBS>
    <vBC>1000.00</vBC>
    <gIBSUF>
      <pIBSUF>0.10</pIBSUF>                 <!-- Alíquota cheia 0.1% -->
      <vIBSUF>1.00</vIBSUF>                 <!-- Sem redução -->
    </gIBSUF>
    <vIBS>1.00</vIBS>
    <gCBS>
      <pCBS>0.90</pCBS>                     <!-- Alíquota cheia 0.9% -->
      <vCBS>9.00</vCBS>                     <!-- Sem redução -->
    </gCBS>
  </gIBSCBS>
</IBSCBS>
```

---

## Exemplos Práticos

### Exemplo 1: Produto COM ClassTrib (Redução 60%)

```
┌────────────────────────────────────────────────────────────────┐
│  PRODUTO: Tubo de Aço Agrícola                                 │
│  NCM: 73071920                                                 │
│  ClassTrib: 200038 (Redução 60%)                               │
│  Valor: R$ 1.000,00                                            │
├────────────────────────────────────────────────────────────────┤
│                                                                │
│  CÁLCULO IBS:                                                  │
│  IBS = 1000 × 0.001 × (1 - 0.60)                              │
│      = 1000 × 0.001 × 0.40                                    │
│      = R$ 0,40                                                 │
│                                                                │
│  CÁLCULO CBS:                                                  │
│  CBS = 1000 × 0.009 × (1 - 0.60)                              │
│      = 1000 × 0.009 × 0.40                                    │
│      = R$ 3,60                                                 │
│                                                                │
│  TOTAL TRIBUTOS: R$ 4,00 (economia de R$ 6,00)                │
│                                                                │
└────────────────────────────────────────────────────────────────┘
```

### Exemplo 2: Produto SEM ClassTrib (Sem Redução)

```
┌────────────────────────────────────────────────────────────────┐
│  PRODUTO: Produto Genérico                                     │
│  NCM: 84818099                                                 │
│  ClassTrib: NENHUM                                             │
│  Valor: R$ 1.000,00                                            │
├────────────────────────────────────────────────────────────────┤
│                                                                │
│  CÁLCULO IBS:                                                  │
│  IBS = 1000 × 0.001 × (1 - 0)                                 │
│      = 1000 × 0.001 × 1.00                                    │
│      = R$ 1,00                                                 │
│                                                                │
│  CÁLCULO CBS:                                                  │
│  CBS = 1000 × 0.009 × (1 - 0)                                 │
│      = 1000 × 0.009 × 1.00                                    │
│      = R$ 9,00                                                 │
│                                                                │
│  TOTAL TRIBUTOS: R$ 10,00                                     │
│                                                                │
└────────────────────────────────────────────────────────────────┘
```

### Exemplo 3: Produto ISENTO (Redução 100%)

```
┌────────────────────────────────────────────────────────────────┐
│  PRODUTO: Trator Agrícola                                      │
│  NCM: 87019490                                                 │
│  ClassTrib: 000001 (Isento - Redução 100%)                    │
│  Valor: R$ 100.000,00                                          │
├────────────────────────────────────────────────────────────────┤
│                                                                │
│  CÁLCULO IBS:                                                  │
│  IBS = 100000 × 0.001 × (1 - 1.00)                            │
│      = 100000 × 0.001 × 0.00                                  │
│      = R$ 0,00                                                 │
│                                                                │
│  CÁLCULO CBS:                                                  │
│  CBS = 100000 × 0.009 × (1 - 1.00)                            │
│      = 100000 × 0.009 × 0.00                                  │
│      = R$ 0,00                                                 │
│                                                                │
│  TOTAL TRIBUTOS: R$ 0,00 (ISENTO)                             │
│                                                                │
└────────────────────────────────────────────────────────────────┘
```

### Tabela Comparativa

| Cenário | Valor | Redução | IBS (0.1%) | CBS (0.9%) | Total | Economia |
|---------|-------|---------|------------|------------|-------|----------|
| Sem ClassTrib | R$ 1.000 | 0% | R$ 1,00 | R$ 9,00 | R$ 10,00 | - |
| ClassTrib 30% | R$ 1.000 | 30% | R$ 0,70 | R$ 6,30 | R$ 7,00 | R$ 3,00 |
| ClassTrib 60% | R$ 1.000 | 60% | R$ 0,40 | R$ 3,60 | R$ 4,00 | R$ 6,00 |
| ClassTrib 100% | R$ 1.000 | 100% | R$ 0,00 | R$ 0,00 | R$ 0,00 | R$ 10,00 |

---

## Preparação para o Futuro

### Evolução das Alíquotas

Quando as alíquotas aumentarem nos próximos anos, basta alterar as constantes:

```vb
' NOTAFISC.FRM - Constantes (atualizar conforme legislação)

' Exemplo para 2027 (hipotético):
Private Const RTC_PERC_IBSUF As Double = 0.5    ' Aumentou para 0.5%
Private Const RTC_PERC_IBSMUN As Double = 0.3   ' Municipal entrou com 0.3%
Private Const RTC_PERC_CBS As Double = 2.0      ' Aumentou para 2.0%

' Exemplo para 2033 (alíquotas finais):
Private Const RTC_PERC_IBSUF As Double = 13.0   ' 13% UF
Private Const RTC_PERC_IBSMUN As Double = 13.0  ' 13% Municipal
Private Const RTC_PERC_CBS As Double = 9.0      ' 9% Federal
```

### O código já está preparado para:

1. ✅ Dividir IBS entre UF e Municipal proporcionalmente
2. ✅ Gerar tag `<gIBSMun>` quando Municipal > 0
3. ✅ Aplicar reduções do ClassTrib em ambos (IBS e CBS)
4. ✅ Calcular alíquotas efetivas reversamente

---

## Referências no Código

### Arquivos Principais

| Arquivo | Função | Descrição |
|---------|--------|-----------|
| `IRRIG.BAS` | `CalculaImposto` | Cases 16, 17, 18, 19 - cálculos e ClassTrib |
| `NOTAFISC.FRM` | `MontaIBSCBS` | Geração do XML IBSCBS |
| `NOTAFISC.FRM` | `PreValidaNFE` | Validação de ClassTrib antes de transmitir |
| `NOTAFISC.FRM` | `RetornoNFe500` | Tratamento de rejeições IBS/CBS |

### Cases da Função CalculaImposto

| Case | Retorno | Descrição |
|------|---------|-----------|
| 16 | Double | Valor do IBS (com redução se tiver ClassTrib) |
| 17 | Double | Valor do CBS (com redução se tiver ClassTrib) |
| 18 | String | Código ClassTrib (ex: "200038") |
| 19 | String | CST do IBS/CBS (ex: "200" ou "90") |

### Query TB2 (ClassTrib)

```sql
SELECT CF.*, 
       CT.CodigoClassTrib, 
       CT.CodigoSituacaoTributaria AS CST_IBSCBS, 
       CT.PercentualReducaoIBS, 
       CT.PercentualReducaoCBS, 
       CT.ValidoParaNFe 
FROM [Classificação Fiscal] CF 
LEFT JOIN ClassTrib CT ON CF.ClassTribId = CT.Id 
WHERE CF.[Seqüência da Classificação] = {NCM}
```

---

## Checklist de Validação

### Para testar a implementação:

- [ ] Cadastrar um ClassTrib com redução (ex: 60%)
- [ ] Vincular ClassTrib a uma Classificação Fiscal (NCM)
- [ ] Criar produto com essa Classificação Fiscal
- [ ] Emitir nota fiscal com o produto
- [ ] Verificar valores calculados (IBS e CBS com redução)
- [ ] Verificar XML gerado (CST, cClassTrib, alíquotas efetivas)
- [ ] Testar produto SEM ClassTrib (deve usar alíquota cheia e CST 90)

---

*Documento criado em: 26/11/2025*  
*Versão: 1.0*  
*Sistema: Irrigação Penápolis*  
*Referência: LC 214/2025 - Reforma Tributária*
