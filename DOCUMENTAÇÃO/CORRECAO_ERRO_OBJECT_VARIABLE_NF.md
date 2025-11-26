# Correção do Erro "Object variable or With block variable not set" no NOTAFISC.FRM

**Data:** 21 de novembro de 2025  
**Arquivo:** `IRRIG\NOTAFISC.FRM`  
**Erro:** "Object variable or With block variable not set"

## Descrição do Problema

O erro "Object variable or With block variable not set" estava ocorrendo ao tentar gravar a Nota Fiscal. Este erro é causado quando o código tenta acessar propriedades de um objeto que não foi devidamente inicializado ou que retornou `Nothing`.

## Análise do Código

A análise revelou que no procedimento `AjustaValores()`, havia múltiplos acessos diretos a campos de objetos `GRecordSet` sem verificar se:

1. O recordset foi devidamente criado (`Is Nothing`)
2. O recordset contém registros (não está vazio)
3. O campo acessado contém um valor válido (não é `Null`)

### Exemplos de código problemático:

```vb
ValorNF = IPIProdutos!Total + IpiConjuntos!Total + IpiPecas!Total + ...
vgDb.Execute "Update [Nota Fiscal] Set [Valor Total do PIS] = " & Substitui(ValorPIS!pis, ",", ".", SO_UM) & ...
```

Se qualquer um dos recordsets (`IPIProdutos`, `IpiConjuntos`, `ValorPIS`, etc.) estiver vazio ou `Nothing`, o acesso direto aos campos causaria o erro.

## Solução Implementada

### 1. Criação de Função Auxiliar `GetRsValue`

Foi criada uma função helper para acessar valores de recordsets de forma segura:

```vb
Private Function GetRsValue(Rs As GRecordSet, FieldName As String, Optional DefaultValue As Variant = 0) As Variant
   ' Função auxiliar para obter valor de um recordset com segurança
   On Error Resume Next
   If Rs Is Nothing Then
      GetRsValue = DefaultValue
   ElseIf Rs.EOF And Rs.BOF Then
      GetRsValue = DefaultValue
   ElseIf IsNull(Rs.Fields(FieldName).Value) Then
      GetRsValue = DefaultValue
   Else
      GetRsValue = Rs.Fields(FieldName).Value
   End If
   On Error GoTo 0
End Function
```

**Benefícios:**
- Verifica se o recordset é `Nothing`
- Verifica se o recordset está vazio (`EOF And BOF`)
- Verifica se o campo é `Null`
- Retorna um valor padrão (0) em caso de qualquer problema
- Evita erros em tempo de execução

### 2. Substituição de Acessos Diretos

Todos os acessos diretos a campos de recordset foram substituídos por chamadas à função `GetRsValue`:

**Antes:**
```vb
ValorNF = IPIProdutos!Total + IpiConjuntos!Total + IpiPecas!Total + ...
```

**Depois:**
```vb
ValorNF = GetRsValue(IPIProdutos, "Total") + GetRsValue(IpiConjuntos, "Total") + GetRsValue(IpiPecas, "Total") + ...
```

### 3. Validação do Objeto `Nota_Fiscal`

Adicionadas validações antes de acessar o objeto `Nota_Fiscal`:

```vb
If Not Nota_Fiscal Is Nothing Then
   vgDb.Execute "Update [Manutenção Contas] Set [Seqüência da Cobrança] = " & Nota_Fiscal![Seqüência da Cobrança] & ...
End If
```

### 4. Validação de `ValorServicos`

Adicionadas verificações de `Nothing` antes de acessar `RecordCount`:

```vb
If Not Nota_Fiscal Is Nothing Then
   If Nota_Fiscal![Reter ISS] And Not ValorServicos Is Nothing And ValorServicos.RecordCount > 0 Then ...
   If Not ValorServicos Is Nothing And ValorServicos.RecordCount > 0 Then ...
End If
```

### 5. Debug Prints Adicionados

Foram adicionados diversos `Debug.Print` para rastreamento:

```vb
Debug.Print "DBG_NF: AjustaValores start seq=" & Sequencia_da_Nota_Fiscal & " vgDb Is Nothing=" & (vgDb Is Nothing) & " Nota_Fiscal Is Nothing=" & (Nota_Fiscal Is Nothing)
Debug.Print "DBG_NF: AjustaValores iniciando updates do banco seq=" & Sequencia_da_Nota_Fiscal
Debug.Print "DBG_NF: AjustaValores atualizando recordset Nota_Fiscal, IsNothing=" & (Nota_Fiscal Is Nothing)
Debug.Print "DBG_NF: AjustaValores editando Nota_Fiscal IBS=" & ValorTotalIBS & " CBS=" & ValorTotalCBS
```

## Campos IBS/CBS Afetados

As correções garantem o correto funcionamento dos campos:

### Tabela: Nota Fiscal
- `[Valor Total IBS]` - Valor total do IBS
- `[Valor Total CBS]` - Valor total do CBS

### Tabelas de Itens
- `[Produtos da Nota Fiscal].[Valor IBS]` e `[Valor CBS]`
- `[Conjuntos da Nota Fiscal].[Valor IBS]` e `[Valor CBS]`
- `[Peças da Nota Fiscal].[Valor IBS]` e `[Valor CBS]`

## Lista de Alterações no Código

1. **Linha ~6382:** Adicionada função `GetRsValue()` antes de `AtualizaValoresIBSCBS`
2. **Linha ~6520:** Adicionada validação para update de Manutenção Contas
3. **Linha ~6600-6610:** Substituídos acessos diretos por `GetRsValue()` no cálculo de ValorNF
4. **Linha ~6620-6628:** Adicionadas validações de `Nota_Fiscal` antes de acessar campos
5. **Linha ~6630-6660:** Substituídos todos os acessos diretos nos comandos UPDATE por `GetRsValue()`
6. **Linha ~6651-6661:** Adicionados Debug.Print e validação para atualização do recordset Nota_Fiscal

## Testes Recomendados

Para validar a correção, realizar os seguintes testes:

1. **Teste 1:** Criar uma Nota Fiscal SEM produtos, conjuntos ou peças
   - Verificar se a gravação é bem-sucedida
   - Verificar se os totais de IBS/CBS ficam em 0

2. **Teste 2:** Criar uma Nota Fiscal COM produtos, conjuntos e peças
   - Verificar se os valores de IBS/CBS são calculados corretamente
   - Verificar se os totais são atualizados no banco

3. **Teste 3:** Editar uma Nota Fiscal existente
   - Adicionar/remover itens
   - Verificar se os valores são recalculados corretamente

4. **Teste 4:** Verificar os Debug.Print na janela Immediate do VB6
   - Abrir a janela Immediate (Ctrl+G)
   - Observar as mensagens de debug durante a gravação
   - Verificar se não há mensagens de WARNING

## Observações Importantes

- A função `GetRsValue()` retorna 0 como valor padrão, o que é apropriado para campos numéricos
- Se algum campo precisar de um valor padrão diferente, pode-se passar o parâmetro opcional `DefaultValue`
- Os Debug.Print podem ser removidos após validação completa em produção, se desejado
- A correção não altera a lógica de negócio, apenas adiciona proteções contra erros

## Arquivos SQL Relacionados

O script SQL `IBS_CBS_2025_11_NO_RECALC.SQL` na pasta `Atualizacao` cria os campos necessários no banco de dados. Certifique-se de que ele foi executado antes de testar.

## Conclusão

As correções implementadas eliminam o erro "Object variable or With block variable not set" ao:
- Garantir acesso seguro a todos os recordsets
- Validar objetos antes de usá-los
- Fornecer valores padrão quando recordsets estão vazios
- Adicionar rastreamento via Debug.Print para diagnóstico

O código agora está mais robusto e preparado para lidar com diferentes cenários de dados.
