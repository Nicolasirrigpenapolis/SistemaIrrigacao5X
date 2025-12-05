# Implementação IBS/CBS no Orçamento

## Data: 02/12/2025

## Visão Geral
Implementação dos campos IBS (Imposto sobre Bens e Serviços) e CBS (Contribuição sobre Bens e Serviços) no módulo de Orçamento, seguindo o padrão já implementado no módulo de Nota Fiscal (NOTAFISC.FRM).

---

## 1. Script SQL (IBS_CBS_ORCAMENTO_2025_12.SQL) ✅ PRONTO

O script já existe e adiciona os campos:
- `[Valor Total IBS]` e `[Valor Total CBS]` na tabela `Orçamento`
- `[Valor IBS]` e `[Valor CBS]` nas tabelas:
  - `Produtos do Orçamento`
  - `Conjuntos do Orçamento`
  - `Peças do Orçamento`

---

## 2. Alterações no ORCAMENT.FRM

### 2.1 Campos Visuais (Interface)

**Novos controles txtCp a adicionar:**
- `txtCp(470)` - Valor Total IBS, DataField = "Valor Total IBS"
- `txtCp(471)` - Valor Total CBS, DataField = "Valor Total CBS"

**Labels correspondentes:**
- `lblCp(470)` - "Valor IBS:"
- `lblCp(471)` - "Valor CBS:"

**Localização sugerida:** Próximo aos campos de PIS/COFINS/Tributo existentes

### 2.2 Variáveis de Módulo

Adicionar após as variáveis de PIS/COFINS (aproximadamente linha 15520):
```vb
Dim Valor_Total_do_IBS As Double
Dim Valor_Total_do_CBS As Double
```

### 2.3 Nova Função: AtualizaValoresIBSCBS

Baseada na função do NOTAFISC.FRM (linha 6773):
```vb
Private Sub AtualizaValoresIBSCBS(ByVal SeqOrc As Long, ByRef TotalIBS As Double, ByRef TotalCBS As Double)
   Dim Tb As New GRecordSet, SQL As String
   Dim valorIBS As Double, valorCBS As Double
   On Error GoTo TrataIBS
   
   TotalIBS = 0
   TotalCBS = 0
   
   ' Produtos - soma os valores já gravados no item
   SQL = "SELECT [Seqüência do Produto Orçamento] SeqItem, [Valor IBS], [Valor CBS] " & _
         "FROM [Produtos do Orçamento] WHERE [Seqüência do Orçamento] = " & SeqOrc
   Set Tb = vgDb.OpenRecordSet(SQL)
   If Not Tb Is Nothing Then
      Do While Not Tb.EOF
         If Not IsNull(Tb![Valor IBS]) Then valorIBS = Tb![Valor IBS] Else valorIBS = 0
         If Not IsNull(Tb![Valor CBS]) Then valorCBS = Tb![Valor CBS] Else valorCBS = 0
         TotalIBS = TotalIBS + valorIBS
         TotalCBS = TotalCBS + valorCBS
         Tb.MoveNext
      Loop
   End If
   Set Tb = Nothing
   
   ' Conjuntos - soma os valores já gravados no item
   SQL = "SELECT [Seqüência Conjunto Orçamento] SeqItem, [Valor IBS], [Valor CBS] " & _
         "FROM [Conjuntos do Orçamento] WHERE [Seqüência do Orçamento] = " & SeqOrc
   Set Tb = vgDb.OpenRecordSet(SQL)
   If Not Tb Is Nothing Then
      Do While Not Tb.EOF
         If Not IsNull(Tb![Valor IBS]) Then valorIBS = Tb![Valor IBS] Else valorIBS = 0
         If Not IsNull(Tb![Valor CBS]) Then valorCBS = Tb![Valor CBS] Else valorCBS = 0
         TotalIBS = TotalIBS + valorIBS
         TotalCBS = TotalCBS + valorCBS
         Tb.MoveNext
      Loop
   End If
   Set Tb = Nothing
   
   ' Peças - soma os valores já gravados no item
   SQL = "SELECT [Seqüência Peças do Orçamento] SeqItem, [Valor IBS], [Valor CBS] " & _
         "FROM [Peças do Orçamento] WHERE [Seqüência do Orçamento] = " & SeqOrc
   Set Tb = vgDb.OpenRecordSet(SQL)
   If Not Tb Is Nothing Then
      Do While Not Tb.EOF
         If Not IsNull(Tb![Valor IBS]) Then valorIBS = Tb![Valor IBS] Else valorIBS = 0
         If Not IsNull(Tb![Valor CBS]) Then valorCBS = Tb![Valor CBS] Else valorCBS = 0
         TotalIBS = TotalIBS + valorIBS
         TotalCBS = TotalCBS + valorCBS
         Tb.MoveNext
      Loop
   End If
   
TrataIBS:
   If Err.Number <> 0 Then
      Debug.Print "DEBUG RTC ORC: Falha ao atualizar IBS/CBS -> " & Err.Description
      Err.Clear
   End If
   Set Tb = Nothing
End Sub
```

### 2.4 Modificar TotalizaOrcamento

**Localização:** Linha ~11595

**Adicionar na declaração de variáveis:**
```vb
Dim ValorTotalIBS As Double, ValorTotalCBS As Double
```

**Adicionar após a linha 11609 (após `If vgSituacao = ACAO_EXCLUINDO Then Exit Sub`):**
```vb
AtualizaValoresIBSCBS Sequencia_do_Orcamento, ValorTotalIBS, ValorTotalCBS
```

**Adicionar após a linha 11741 (após gravar Tributo):**
```vb
vgDb.Execute "Update Orçamento Set [Valor Total IBS] = " & Substitui(CStr(ValorTotalIBS), ",", ".", SO_UM) & " WHERE [Seqüência do Orçamento] = " & Sequencia_do_Orcamento 'Valor Total IBS
vgDb.Execute "Update Orçamento Set [Valor Total CBS] = " & Substitui(CStr(ValorTotalCBS), ",", ".", SO_UM) & " WHERE [Seqüência do Orçamento] = " & Sequencia_do_Orcamento 'Valor Total CBS
```

### 2.5 Modificar ProcessaProduto (linha ~10738)

**Adicionar após o cálculo de Tributos e ICMS ST (após linha ~10900):**
```vb
' Calcula IBS e CBS (RTC sempre habilitado)
Dim vrAdicionalIBS_Prod As Double
Dim ValorOperacional_Prod As Double
Dim Valor_IBS As Double, Valor_CBS As Double
ValorOperacional_Prod = Round(Quantidade * Valor_Unitario + Valor_do_Frete - Valor_do_Desconto, 2)
Valor_IBS = CalculaImposto(Sequencia_do_Produto, Orcamento![Seqüência Do Geral], 16, 1, ValorOperacional_Prod, vrAdicionalIBS_Prod, Orcamento![Seqüência da Propriedade])
Valor_CBS = CalculaImposto(Sequencia_do_Produto, Orcamento![Seqüência Do Geral], 17, 1, ValorOperacional_Prod, vrAdicionalIBS_Prod, Orcamento![Seqüência da Propriedade])

' Gravar IBS e CBS
vgDb.Execute "UPDATE [Produtos do Orçamento] SET [Valor IBS] = " & Substitui(CStr(Valor_IBS), ",", ".", SO_UM) & ", [Valor CBS] = " & Substitui(CStr(Valor_CBS), ",", ".", SO_UM) & " WHERE [Seqüência do Orçamento] = " & Sequencia_do_Orcamento & " AND [Seqüência do Produto Orçamento] = " & Sequencia_do_Produto_Orcamento
```

### 2.6 Modificar ProcessaConjunto (linha ~10913)

**Adicionar após o cálculo de Tributos (após linha ~11128):**
```vb
' Calcula IBS e CBS (RTC sempre habilitado)
Dim vrAdicionalIBS_Conj As Double
Dim ValorOperacional_Conj As Double
Dim Valor_IBS_Conj As Double, Valor_CBS_Conj As Double
ValorOperacional_Conj = Round(Quantidade * Valor_Unitario + Valor_do_Frete - Valor_do_Desconto, 2)
Valor_IBS_Conj = CalculaImposto(Sequencia_do_Conjunto, Orcamento![Seqüência Do Geral], 16, 2, ValorOperacional_Conj, vrAdicionalIBS_Conj, Orcamento![Seqüência da Propriedade], PegaNCMPadrao())
Valor_CBS_Conj = CalculaImposto(Sequencia_do_Conjunto, Orcamento![Seqüência Do Geral], 17, 2, ValorOperacional_Conj, vrAdicionalIBS_Conj, Orcamento![Seqüência da Propriedade], PegaNCMPadrao())

' Gravar IBS e CBS
vgDb.Execute "UPDATE [Conjuntos do Orçamento] SET [Valor IBS] = " & Substitui(CStr(Valor_IBS_Conj), ",", ".", SO_UM) & ", [Valor CBS] = " & Substitui(CStr(Valor_CBS_Conj), ",", ".", SO_UM) & " WHERE [Seqüência do Orçamento] = " & Sequencia_do_Orcamento & " AND [Seqüência Conjunto Orçamento] = " & Sequencia_Conjunto_Orcamento
```

### 2.7 Modificar ProcessaPeca (linha ~11153)

**Adicionar após o cálculo de Tributos (após linha ~11383):**
```vb
' Calcula IBS e CBS (RTC sempre habilitado)
Dim vrAdicionalIBS_Peca As Double
Dim ValorOperacional_Peca As Double
Dim Valor_IBS_Peca As Double, Valor_CBS_Peca As Double
ValorOperacional_Peca = Round(Quantidade * Valor_Unitario + Valor_do_Frete - Valor_do_Desconto, 2)
Valor_IBS_Peca = CalculaImposto(Sequencia_do_Produto, Orcamento![Seqüência Do Geral], 16, 3, ValorOperacional_Peca, vrAdicionalIBS_Peca, Orcamento![Seqüência da Propriedade], PegaNCMPadrao())
Valor_CBS_Peca = CalculaImposto(Sequencia_do_Produto, Orcamento![Seqüência Do Geral], 17, 3, ValorOperacional_Peca, vrAdicionalIBS_Peca, Orcamento![Seqüência da Propriedade], PegaNCMPadrao())

' Gravar IBS e CBS
vgDb.Execute "UPDATE [Peças do Orçamento] SET [Valor IBS] = " & Substitui(CStr(Valor_IBS_Peca), ",", ".", SO_UM) & ", [Valor CBS] = " & Substitui(CStr(Valor_CBS_Peca), ",", ".", SO_UM) & " WHERE [Seqüência do Orçamento] = " & Sequencia_do_Orcamento & " AND [Seqüência Peças do Orçamento] = " & Sequencia_Pecas_do_Orcamento
```

---

## 3. Cálculo IBS/CBS

Conforme a função `CalculaImposto` no IRRIG.BAS:
- **Tipo 16** = IBS (Imposto sobre Bens e Serviços)
- **Tipo 17** = CBS (Contribuição sobre Bens e Serviços)

Alíquotas padrão (conforme NOTAFISC.FRM):
- IBS UF: 0.1% (10%)
- IBS Municipal: 0%
- CBS: 0.9% (90%)

---

## 4. Ordem de Implementação

1. ✅ Executar script SQL `IBS_CBS_ORCAMENTO_2025_12.SQL`
2. ✅ Adicionar função `AtualizaValoresIBSCBS` no ORCAMENT.FRM
3. ✅ Modificar `TotalizaOrcamento` para chamar a nova função e gravar totais
4. ✅ Modificar `ProcessaProduto` para calcular e gravar IBS/CBS
5. ✅ Modificar `ProcessaConjunto` para calcular e gravar IBS/CBS
6. ✅ Modificar `ProcessaPeca` para calcular e gravar IBS/CBS
7. ✅ Modificar `AjustaValoresProforma` para IBS/CBS
8. (Opcional) Adicionar campos visuais no formulário

---

## 5. Status da Implementação

**Data de Conclusão:** 02/12/2025

### Funções Modificadas:
- `ProcessaProduto` - Calcula e grava [Valor IBS], [Valor CBS] para cada produto
- `ProcessaConjunto` - Calcula e grava [Valor IBS], [Valor CBS] para cada conjunto
- `ProcessaPeca` - Calcula e grava [Valor IBS], [Valor CBS] para cada peça
- `TotalizaOrcamento` - Totaliza IBS/CBS e grava [Valor Total IBS], [Valor Total CBS]
- `AjustaValoresProforma` - Totaliza IBS/CBS para Pro-forma

### Nova Função Adicionada:
- `AtualizaValoresIBSCBS` - Soma valores IBS/CBS de produtos, conjuntos e peças

### Grids com Colunas IBS/CBS:
- ✅ **Grid(0)** - Conjuntos do Orçamento: colunas "Vr. IBS" e "Vr. CBS" adicionadas
- ✅ **Grid(1)** - Peças do Orçamento: colunas "Vr. IBS" e "Vr. CBS" adicionadas
- ✅ **Grid(3)** - Produtos do Orçamento: colunas "Vr. IBS" e "Vr. CBS" adicionadas

### Campos Visuais (Aba Financeiro):
- ✅ **txtCp(162)** - Valor Total IBS (DataField = "Valor Total IBS")
- ✅ **txtCp(163)** - Valor Total CBS (DataField = "Valor Total CBS")
- ✅ **Label(189)** - "Valor IBS:"
- ✅ **Label(190)** - "Valor CBS:"

### Variáveis de Módulo:
- ✅ `Valor_Total_do_IBS As Double` - adicionado
- ✅ `Valor_Total_do_CBS As Double` - adicionado
- ✅ Leitura dos valores do banco de dados implementada

### Observações:
- A implementação segue o mesmo padrão da Nota Fiscal (NOTAFISC.FRM)
- Utiliza CalculaImposto tipo 16 (IBS) e tipo 17 (CBS)
- Campos visuais adicionados na aba Financeiro

---

## 6. Testes

- Criar novo orçamento e adicionar produtos/conjuntos/peças
- Verificar se valores IBS/CBS são calculados corretamente
- Verificar se totalização está correta
- Comparar valores com Nota Fiscal gerada a partir do orçamento
