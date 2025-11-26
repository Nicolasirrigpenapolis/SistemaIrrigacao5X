# PROMPT DE VERIFICAÇÃO - IMPLEMENTAÇÃO NFe 5.0 COM IBS/CBS (REFORMA TRIBUTÁRIA)

**Projeto:** Sistema de Irrigação - Emissão de Nota Fiscal Eletrônica  
**Versão:** 5X com Reforma Tributária (IBS/CBS)  
**Data:** 24 de novembro de 2025  
**DLL Utilizada:** NFe_Util_2G v5.00n (FlexDocs)  

---

## 📋 OBJETIVO DA VERIFICAÇÃO

Verificar se a implementação das correções para IBS/CBS na emissão de Notas Fiscais está **completa, consistente e compatível** com a NFe 5.0 (Reforma Tributária), garantindo que:

1. ✅ Valores IBS/CBS são calculados corretamente e salvos no banco
2. ✅ XML gerado inclui tags obrigatórias com valores corretos
3. ✅ Totais batem com soma dos itens
4. ✅ Funções usam assinatura correta (v5.0.0m)
5. ✅ Não há divergências entre banco de dados e XML

---

## 🔍 ARQUIVO PRINCIPAL A VERIFICAR

**Caminho:** `c:\Projetos\SistemaIrrigacao5X\IRRIG\NOTAFISC.FRM`  
**Tipo:** VB6 Form (16.299 linhas)  
**Modificações:** 5 correções implementadas (ver seção abaixo)

### 📄 Arquivo de Documentação Técnica

**Caminho:** `c:\Projetos\SistemaIrrigacao5X\DOCUMENTAÇÃO\CORRECOES_NFE_50_IBSCBS.md`  
- Lista completa de problemas identificados
- Antes/Depois de cada correção
- Justificativas técnicas
- Validações pendentes

---

## 📚 DOCUMENTAÇÃO E SCHEMAS DISPONÍVEIS

### DLL e Changelog

```
c:\Projetos\SistemaIrrigacao5X\2Gv5.00n\
├── NFe_Util_2G.dll                    ← DLL v5.00n (2025-11-08)
├── alteracao.txt                       ← Changelog completo (391 linhas)
└── NFe_Util\
    ├── Schemas\                        ← XML Schemas NFe 5.0
    │   ├── *v4.0x*                     ← Schemas versão 4.0x
    │   └── *v5.0*                      ← Schemas versão 5.0 (Reforma Tributária)
    └── Exemplos de XML\
        ├── NFe_S200_N000001_v200.xml   ← Exemplo v2.00 (antigo)
        ├── NFe.xml                      ← Exemplo v1.10 (antigo)
        └── NFe_Manual_v4.0x\           ← Exemplos layout 4.0x
```

### Referências no alteracao.txt

**Linhas críticas com informações sobre IBS/CBS:**

- **Linha 1-30**: Versão 5.0.0n (2025-11-08) - última versão
- **Linha 31-50**: Versão 5.0.0m (2025-11-04) - **CRÍTICO**
  - Assinatura correta de `IBSCBSv130`
  - Eliminação de `gIBSCredPres` e `gCBSCredPres`
  
- **Linha 51-100**: Versão 5.0.0l (2025-10-28) - **MUITO IMPORTANTE**
  - Criação de `IBSCBSv130` com `indDoacao`
  - Funções `gAjusteCompet`, `gEstornoCred`, `gCredPresOper`
  - `gCredPresIBSZFMv130` para regimes especiais
  - `IBSCBSTotv130` para totais

- **Linha 100-150**: Versão 5.0.0h (2025-08-10)
  - Acréscimo de tag `vIBS` em `gIBSCBS`

---

## ✅ CORREÇÕES IMPLEMENTADAS

### 1. Função MontaIBSCBS - Parâmetros Opcionais

**Arquivo:** NOTAFISC.FRM, Linha 6481

**O que foi mudado:**
```vb
' ANTES (sem parâmetros do banco)
Private Sub MontaIBSCBS(ByRef objNFeUtil As Object, ByVal baseOperacao As Double, _
   ByRef det_IBSCBS As String, ByRef det_IS As String, _
   ByRef vBC As Double, ByRef vIBSUF As Double, ByRef vIBSMun As Double, ByRef vCBS As Double)

' DEPOIS (com parâmetros opcionais do banco)
Private Sub MontaIBSCBS(ByRef objNFeUtil As Object, ByVal baseOperacao As Double, _
   ByRef det_IBSCBS As String, ByRef det_IS As String, _
   ByRef vBC As Double, ByRef vIBSUF As Double, ByRef vIBSMun As Double, ByRef vCBS As Double, _
   Optional ByVal valorIBS_DB As Double = -1, Optional ByVal valorCBS_DB As Double = -1)
```

**Lógica Implementada:**
- Se `valorIBS_DB >= 0 AND valorCBS_DB >= 0`: **USAR VALORES DO BANCO** (prioritário)
- Senão: **Recalcular com constantes** (fallback)

**Verificações Necessárias:**
- [ ] Validar se lógica de escolha (banco vs. constantes) está correta
- [ ] Verificar cálculo proporcional de IBSUF e IBSMun quando usa banco
- [ ] Confirmar se recálculo de percentuais (lines 6517-6520) está matematicamente correto

---

### 2. Correção de gIBSCBSv130 - Assinatura Correta

**Arquivo:** NOTAFISC.FRM, Linha 6534

**O que foi mudado:**
```vb
' ANTES (8 parâmetros, assinatura antiga)
gIBSCBS_xml = objNFeUtil.gIBSCBS(vBC, gIBSUF_xml, gIBSMun_xml, gCBS_xml, "", "", "", "")

' DEPOIS (7 parâmetros, assinatura v5.0.0m)
gIBSCBS_xml = objNFeUtil.gIBSCBSv130(vBC, gIBSUF_xml, gIBSMun_xml, vIBS, gCBS_xml, "", "")
```

**Verificações Necessárias:**
- [ ] Confirmar que `gIBSCBSv130` é método correto da DLL v5.00n
- [ ] Validar assinatura: `gIBSCBSv130(double vBC, string gIBSUF, string gIBSMun, double vIBS, string gCBS, string gTribRegular_Opc, string gTribCompraGov_Opc)`
- [ ] Verificar se ordem dos parâmetros bate com documentação
- [ ] Confirmar que `vIBS = vIBSUF + vIBSMun` está correto
- [ ] Validar se `gTribRegular_Opc` e `gTribCompraGov_Opc` devem ser vazios ou populados

---

### 3. Chamadas MontaIBSCBS - Passando Valores do Banco

**Arquivo:** NOTAFISC.FRM, Linhas 10280, 10410, 11024

**Produtos (Linha 10280):**
```vb
' Ler valores IBS/CBS já calculados e salvos no banco
On Error Resume Next
valorIBS_Item = 0
valorCBS_Item = 0
valorIBS_Item = Item![Valor IBS]
If Err.Number <> 0 Then Err.Clear: valorIBS_Item = 0
valorCBS_Item = Item![Valor CBS]
If Err.Number <> 0 Then Err.Clear: valorCBS_Item = 0
On Error GoTo 0

MontaIBSCBS objNFeUtil, baseValorRTC, det_IBSCBS, det_IS, ibscbs_vBC, ibscbs_vIBSUF, ibscbs_vIBSMun, ibscbs_vCBS, valorIBS_Item, valorCBS_Item
```

**Verificações Necessárias:**
- [ ] Confirmar que campos `Item![Valor IBS]` e `Item![Valor CBS]` existem no recordset
- [ ] Validar que tratamento de erro é suficiente para metadata cache mismatches
- [ ] Verificar se valores chegam com decimal correto (18,2)
- [ ] Confirmar que debug.print está registrando valores para rastreamento

**Serviços (Linha 10410):**
```vb
' Serviços não têm campos IBS/CBS - usar recálculo
MontaIBSCBS objNFeUtil, baseServicoRTC, det_IBSCBS, det_IS, ibscbs_vBC, ibscbs_vIBSUF, ibscbs_vIBSMun, ibscbs_vCBS
' (sem parâmetros de banco, usar fallback)
```

**Verificações Necessárias:**
- [ ] Confirmar que serviços realmente não devem ter campos IBS/CBS
- [ ] Validar que recálculo com constantes é apropriado para serviços

---

### 4. Acumulação de Totais - Usar Valores do Banco

**Arquivo:** NOTAFISC.FRM, Linha 10330

**O que foi mudado:**
```vb
' ANTES (acumulava valores recalculados)
If usaRTC Then
   vIBSUFTotal = vIBSUFTotal + ibscbs_vIBSUF   ' ❌ RECALCULADO
   vIBSMunTotal = vIBSMunTotal + ibscbs_vIBSMun
   vIBSTotal = vIBSTotal + ibscbs_vIBSUF + ibscbs_vIBSMun
   vCBSTotal = vCBSTotal + ibscbs_vCBS         ' ❌ RECALCULADO
End If

' DEPOIS (acumula valores do banco)
If usaRTC Then
   If valorIBS_Item >= 0 And valorCBS_Item >= 0 Then
      vIBSTotal = vIBSTotal + valorIBS_Item     ' ✅ DO BANCO
      vCBSTotal = vCBSTotal + valorCBS_Item     ' ✅ DO BANCO
      If RTC_PERC_IBSUF + RTC_PERC_IBSMUN > 0 Then
         vIBSUFTotal = vIBSUFTotal + (valorIBS_Item * (RTC_PERC_IBSUF / (RTC_PERC_IBSUF + RTC_PERC_IBSMUN)))
         vIBSMunTotal = vIBSMunTotal + (valorIBS_Item * (RTC_PERC_IBSMUN / (RTC_PERC_IBSUF + RTC_PERC_IBSMUN)))
      Else
         vIBSUFTotal = vIBSUFTotal + valorIBS_Item
      End If
   Else
      ' Fallback para valores recalculados
   End If
End If
```

**Verificações Necessárias:**
- [ ] Validar cálculo proporcional de IBSUF vs IBSMun quando `RTC_PERC_IBSUF + RTC_PERC_IBSMUN > 0`
- [ ] Confirmar que divisão proporcional não causa erros de arredondamento
- [ ] Verificar se fallback é acionado quando `valorIBS_Item < 0 OR valorCBS_Item < 0`
- [ ] Validar que `vBCIBSCBS` está sendo acumulado corretamente
- [ ] Confirmar que totais serão consistentes: `SUM(vIBS_items) == vIBSTotal`

---

### 5. Correção de gIBSCBS em SemValores

**Arquivo:** NOTAFISC.FRM, Linha 10740

**O que foi mudado:**
```vb
' ANTES (função antiga, 8 parâmetros)
gIBSCBS_xml = objNFeUtil.gIBSCBS(ibscbs_vBC, gIBSUF_xml, gIBSMun_xml, gCBS_xml, "", "", "", "")

' DEPOIS (função v130, 7 parâmetros, com vIBS)
Dim vIBS_Agrupado As Double
vIBS_Agrupado = ibscbs_vIBSUF + ibscbs_vIBSMun
gIBSCBS_xml = objNFeUtil.gIBSCBSv130(ibscbs_vBC, gIBSUF_xml, gIBSMun_xml, vIBS_Agrupado, gCBS_xml, "", "")
```

**Verificações Necessárias:**
- [ ] Confirmar que `vIBS_Agrupado = ibscbs_vIBSUF + ibscbs_vIBSMun` é cálculo correto
- [ ] Validar se seção "SemValores" é apenas para agrupamentos ou existe outro cenário
- [ ] Verificar fallback em caso de erro na função v130

---

## 🔧 CAMPOS CRÍTICOS NO BANCO DE DADOS

**Tabela:** `[Produtos da Nota Fiscal]`

```sql
[Seqüência Produto Nota Fiscal]  INT PRIMARY KEY
[Seqüência da Nota Fiscal]       INT FOREIGN KEY
[Valor IBS]                      DECIMAL(18,2)     ← CRÍTICO
[Valor CBS]                      DECIMAL(18,2)     ← CRÍTICO
[Quantidade]                     DECIMAL(18,4)
[Valor Unitário]                 DECIMAL(18,2)
[Valor do Desconto]              DECIMAL(18,2)
[Valor do Frete]                 DECIMAL(18,2)
```

**Verificações Necessárias:**
- [ ] Confirmar que campos `[Valor IBS]` e `[Valor CBS]` existem e tipo é DECIMAL(18,2)
- [ ] Validar que `ProcessaProdutos` está gravando esses campos via SQL UPDATE (linhas 5920-5924)
- [ ] Confirmar o mesmo para `ProcessaConjuntos` (linhas 5998-6002) e `ProcessaPecas` (linhas 6093-6097)
- [ ] Verificar que `AtualizaValoresIBSCBS` (linha 6419) está sincronizando valores corretamente

---

## 🔐 VALIDAÇÕES DE CONSISTÊNCIA

### Fórmulas que Devem Bater

```
Para cada item de PRODUTO:
  Base_Operacao = (Quantidade × Valor_Unitário) - Desconto + Frete
  Valor_IBS = Base_Operacao × (RTC_PERC_IBSUF + RTC_PERC_IBSMUN) / 100
  Valor_CBS = Base_Operacao × RTC_PERC_CBS / 100

Totais da Nota:
  SOMA(item[Valor IBS]) == total[Valor Total IBS]
  SOMA(item[Valor CBS]) == total[Valor Total CBS]
```

**Verificações Necessárias:**
- [ ] Verificar se `CalcValorOperacaoRTC` (linha 6387) implementa fórmula correta
- [ ] Confirmar que `CalculaImposto(16, 17)` retorna valores baseados nesta fórmula
- [ ] Validar que `AtualizaValoresIBSCBS` usa mesma fórmula
- [ ] Confirmar que XML não recalcula com constantes diferentes

---

## 📊 ESTRUTURA DO XML ESPERADO

### Tags Obrigatórias (Reforma Tributária - NFe 5.0)

```xml
<!-- POR ITEM DO DETALHE -->
<det nItem="1">
  <prod>
    <!-- produtos tradicionais -->
  </prod>
  <imposto>
    <ICMS><!-- opcional --></ICMS>
    <IPI><!-- opcional --></IPI>
    <PIS><!-- opcional --></PIS>
    <COFINS><!-- opcional --></COFINS>
    <!-- *** NOVO em 5.0 *** -->
    <IBSCBS>
      <CST>90</CST>
      <cClassTrib></cClassTrib>
      <indDoacao></indDoacao>
      <gTributo>
        <vBC>1000.00</vBC>
        <gIBSUF>
          <pAliq>0.10</pAliq>
          <v>1.00</v>
        </gIBSUF>
        <gIBSMun/>
        <vIBS>1.00</vIBS>
        <gCBS>
          <pAliq>0.90</pAliq>
          <v>9.00</v>
        </gCBS>
      </gTributo>
      <gEstornoCred/>
      <gCredPresOper/>
    </IBSCBS>
    <IS/>
  </imposto>
</det>

<!-- NOS TOTAIS -->
<total>
  <ICMSTot><!-- totais tradicionais --></ICMSTot>
  <!-- *** NOVO em 5.0 *** -->
  <IBSCBSTot>
    <vBCIBSCBS>1000.00</vBCIBSCBS>
    <gIBS>
      <vBC>1000.00</vBC>
      <gIBSUF>
        <pAliq>0.10</pAliq>
        <v>1.00</v>
      </gIBSUF>
      <gIBSMun/>
      <vIBS>1.00</vIBS>
    </gIBS>
    <gCBS>
      <vBC>1000.00</vBC>
      <pAliq>0.90</pAliq>
      <v>9.00</v>
    </gCBS>
  </IBSCBSTot>
  <IS>
    <vIS>0.00</vIS>
  </IS>
</total>
```

**Verificações Necessárias:**
- [ ] Confirmar que `det_IBSCBS` gerado em linha 6516 inclui todas as tags acima
- [ ] Validar que `gIBSTot_Total_xml` e `gCBSTot_Total_xml` (linhas 11168, 11172) geram estrutura correta
- [ ] Verificar que `IBSCBSTot_xml` (linha 11175) consolida totais adequadamente
- [ ] Confirmar que `totalRTC` (linha 11186) aceita `IBSCBSTot_xml` como parâmetro

---

## 🚨 PROBLEMAS CONHECIDOS A VERIFICAR

### ⚠️ 1. CST e cClassTrib Hardcoded

**Localização:** MontaIBSCBS, Linha 6489

```vb
ibscbs_CST = "90"              ' ← GENÉRICO (OUTROS)
ibscbs_cClassTrib = ""         ' ← VAZIO (pode ser obrigatório)
```

**Impacto:** SEFAZ pode rejeitar se CST "90" não for apropriado para o tipo de produto/operação

**Pendência:**
- [ ] VERIFICAR se CST deve vir do cadastro de produtos
- [ ] VALIDAR se cClassTrib deve ter valor (qual?)
- [ ] CONFIRMAR com documentação de Reforma Tributária os valores corretos

---

### ⚠️ 2. Constantes de Alíquotas

**Localização:** NOTAFISC.FRM, Linhas 5448-5450

```vb
Private Const RTC_PERC_IBSUF As Double = 0.1     ' 0,1% estadual
Private Const RTC_PERC_IBSMUN As Double = 0      ' 0% municipal
Private Const RTC_PERC_CBS As Double = 0.9       ' 0,9%
```

**Impacto:** Estas são as alíquotas PADRÃO. Podem variar por UF, município, tipo de operação.

**Pendência:**
- [ ] CONFIRMAR se alíquotas estão corretas para a região (PENÁPOLIS - SP)
- [ ] VALIDAR se existem exceções por tipo de produto
- [ ] VERIFICAR se deve consultar tabela de alíquotas dinâmicas

---

### ⚠️ 3. Grupos Opcionais Não Implementados

**Alternativas disponíveis em v5.0.0m:**

```vb
' Não implementados (todos vazios):
gEstornoCred_Opc        ' Estorno de créditos
gCredPresumido_Opc      ' Créditos presumidos
gAjusteCompet_Opc       ' Ajustes de competência
gCredPresOper_Opc       ' Créditos de operadora
```

**Pendência:**
- [ ] AVALIAR se empresa precisa usar estes grupos
- [ ] CONSULTAR legislação Reforma Tributária
- [ ] DECIDIR se implementar ou deixar como está

---

## ✋ PROCEDIMENTO DE VERIFICAÇÃO

### Passo 1: Validar Sintaxe VB6
```
1. Abrir NOTAFISC.FRM no VB6 IDE
2. Compilar projeto: Project → Make
3. Verificar se não há erros de compilação
4. Verificar se tipos de dados estão corretos (Double, String, etc)
```

**Verificações:**
- [ ] Sem erros de compilação
- [ ] Sem warnings críticos
- [ ] Variáveis declaradas corretamente

---

### Passo 2: Validar Lógica de Fluxo
```
Traçar fluxo do item do início ao fim:

1. Insert no Grid → Grid_AfterUpdateRecord
2. Chama PROCESSOS_DIRETOS → ExecutaGridX
3. Chama ProcessaProdutos → SQL UPDATE [Valor IBS] e [Valor CBS]
4. Chama AjustaValores → AtualizaValoresIBSCBS (acumula totais)
5. User clica Transmitir → MontaNFe (gera XML)
6. Loop Produtos → Lê Item![Valor IBS] e Item![Valor CBS]
7. Chama MontaIBSCBS → Prioriza valores do banco
8. Acumula totais → vIBSTotal += Item![Valor IBS]
9. Gera gIBSTot, gCBSTot, IBSCBSTot
10. Chama totalRTC → Gera tag total com IBSCBSTot
```

**Verificações:**
- [ ] Cada passo chama a próxima função correta
- [ ] Valores são passados sem corrupção
- [ ] Não há condições que pulam etapas
- [ ] Tratamento de erro não oculta falhas críticas

---

### Passo 3: Validar Constância de Dados
```
Teste manual:
1. Criar NFe com 2-3 produtos
2. Inserir item com valor base R$ 1.000,00
3. Confirmar inserção → ProcessaProdutos calcula
4. Verificar no banco: [Valor IBS] = R$ 1,00, [Valor CBS] = R$ 9,00
5. Transmitir NFe → MontaNFe gera XML
6. Exportar XML (se possível) e verificar tags IBSCBS
7. Confirmar: vIBS (XML) == [Valor IBS] (banco)
```

**Verificações:**
- [ ] Valores no banco batem com esperado
- [ ] XML contém tags obrigatórias
- [ ] Totais batem com soma dos itens
- [ ] Sem divergências entre banco e XML

---

### Passo 4: Validar contra Documentação
```
Comparar com documentação:
- Cotejar funções v5.0.0m do alteracao.txt
- Verificar assinaturas de IBSCBSv130, gIBSCBSv130, etc
- Confirmar parâmetros e ordem
- Validar tipos de retorno
```

**Verificações:**
- [ ] Assinaturas coincidem com alteracao.txt
- [ ] Parâmetros estão na ordem correta
- [ ] Tipos de dados são compatíveis
- [ ] Não há chamadas a funções descontinuadas

---

### Passo 5: Teste de Transmissão
```
(Quando disponível ambiente de teste SEFAZ)
1. Gerar NFe com IBS/CBS
2. Assinar XML
3. Transmitir para SEFAZ homologação
4. Validar resposta:
   - Se aprovada: implementação está correta ✅
   - Se rejeitada: analisar erro específico
```

**Possíveis rejeições e soluções:**
- `"Tag vIBS não informada"` → Verificar se `vIBS` está sendo passado a `gIBSCBSv130`
- `"Total de IBS divergente"` → Verificar acumulação e proporção IBSUF/IBSMun
- `"CST inválido"` → Ajustar `ibscbs_CST` de "90" para valor correto
- `"cClassTrib obrigatório"` → Popular com valor apropriado

---

## 📞 INFORMAÇÕES DE CONTATO E DOCUMENTAÇÃO

### Schemas Disponíveis
```
c:\Projetos\SistemaIrrigacao5X\2Gv5.00n\NFe_Util\Schemas\
├── Exemplos de estruturas XML
├── Validadores de schema
└── Documentação de campos
```

### Changelog Completo
```
c:\Projetos\SistemaIrrigacao5X\2Gv5.00n\alteracao.txt
(391 linhas com todas as alterações de v5.0.0a até v5.0.0n)
```

### Documentação Técnica Gerada
```
c:\Projetos\SistemaIrrigacao5X\DOCUMENTAÇÃO\CORRECOES_NFE_50_IBSCBS.md
(Análise detalhada de cada correção implementada)
```

### Referência Official
```
FlexDocs - NFe Library
www.flexdocs.net/guiaNFe
(Documentação online da DLL)
```

---

## 🎯 CHECKLIST FINAL DE VERIFICAÇÃO

Marque ✅ quando cada item for validado:

### Correções Implementadas
- [ ] MontaIBSCBS recebe parâmetros de banco (valorIBS_DB, valorCBS_DB)
- [ ] Lógica prioriza valores do banco sobre constantes
- [ ] Fallback para recálculo funciona se valores do banco forem < 0
- [ ] Proporção IBSUF/IBSMun é calculada corretamente

### Assinaturas Atualizadas
- [ ] `gIBSCBSv130` substitui `gIBSCBS` em MontaIBSCBS (linha 6534)
- [ ] `gIBSCBSv130` substitui `gIBSCBS` em SemValores (linha 10740)
- [ ] Parâmetro `vIBS` é informado em ambas as chamadas
- [ ] Parâmetros `gTribRegular_Opc` e `gTribCompraGov_Opc` são vazios (correto)

### Valores do Banco
- [ ] Produtos leem `Item![Valor IBS]` e `Item![Valor CBS]` (linha 10285)
- [ ] Valores são passados para MontaIBSCBS (linha 10298)
- [ ] Erros de leitura são tratados silenciosamente
- [ ] Valores chegam com decimal correto (18,2)

### Totais Consistentes
- [ ] vIBSTotal acumula valores do banco (linha 10340)
- [ ] vCBSTotal acumula valores do banco (linha 10341)
- [ ] Proporção IBSUF/IBSMun mantida em totais (linha 10342-10345)
- [ ] Fallback para recálculo se banco falhar

### XML Gerado
- [ ] gIBSTot_Total_xml incluído em IBSCBSTot (linha 11168)
- [ ] gCBSTot_Total_xml incluído em IBSCBSTot (linha 11172)
- [ ] IBSCBSTot_xml gerado com IBSCBSTotv130 (linha 11175)
- [ ] totalRTC recebe IBSCBSTot_xml como parâmetro (linha 11186)

### Documentação
- [ ] CORRECOES_NFE_50_IBSCBS.md foi criado
- [ ] Alteracao.txt está disponível em 2Gv5.00n
- [ ] Schemas estão em 2Gv5.00n\NFe_Util\Schemas
- [ ] Todas as linhas de código estão documentadas

### Validações Pendentes
- [ ] CST "90" apropriado? (verificar com Reforma Tributária)
- [ ] cClassTrib deve ter valor? (verificar com Reforma Tributária)
- [ ] Alíquotas estão corretas? (0.1% IBSUF, 0% IBSMun, 0.9% CBS)
- [ ] Grupos opcionais precisam ser implementados?

---

## 📝 FORMATO DE RESPOSTA ESPERADO

Ao terminar a verificação, por favor retorne:

```
RESUMO DE VERIFICAÇÃO - NFe 5.0 com IBS/CBS

STATUS GERAL: ✅ APROVADO / ❌ REJEITADO / ⚠️ PENDÊNCIAS

CORREÇÕES IMPLEMENTADAS:
✅ Cada correção validada com status
❌ Itens que falharam na validação
⚠️ Itens que precisam ajustes

PROBLEMAS ENCONTRADOS:
(Se houver)

RECOMENDAÇÕES:
(Próximos passos)

ASSINATURA:
Data: [data]
Verificador: [nome]
```

---

## 🔗 RESUMO EXECUTIVO

**Objetivo:** Garantir que NFe 5.0 com Reforma Tributária (IBS/CBS) funcione corretamente

**Mudanças Principais:**
1. MontaIBSCBS prioriza valores do banco
2. gIBSCBSv130 atualizado com assinatura v5.0.0m
3. Totais acumulam valores corretos
4. XML gerado com tags obrigatórias

**Pendências Críticas:**
- Validar CST e cClassTrib com legislação Reforma Tributária
- Testar em ambiente SEFAZ homologação
- Validar alíquotas por região/operação

**Próximos Passos:**
1. Executar verificação conforme checklist
2. Testar em ambiente DEV
3. Transmitir NFe de teste para SEFAZ
4. Documentar feedbacks e ajustes necessários

---

**FIM DO PROMPT**

Este prompt foi elaborado para orientar outra IA na verificação técnica completa da implementação.
Inclui todos os detalhes, referências, e possibilidades de erro.

