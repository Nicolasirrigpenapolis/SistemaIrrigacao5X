# 🔧 CORREÇÕES DE EMERGÊNCIA — Erro ao Salvar NF

**Data**: 18/11/2025  
**Arquivo**: `NOTAFISC.FRM`  
**Rotina**: `AjustaValores`

---

## 🚨 PROBLEMA RELATADO
Ao tentar salvar nota fiscal, sistema exibia erro:
```
Atenção!
Object variable or With block variable not set

Descrição detalhada:
Object variable or With block variable not set

Módulo: IRRIG
Formulário: Nota Fiscal[frmNotaFisc]
Erro: 91
Usuário: YGOR
Versão: 1.1.11
```

---

## ✅ CORREÇÕES APLICADAS

### Correção #1: Typo em `Err.Description`
**Linha**: ~6708 (handler de erro)

**Antes**:
```vb
DeuErro:
   If Err Then
      MsgBox Err.Descption, vbCritical + vbOKOnly, vaTitulo  ' ← ERRO: Descption
      vgDb.RollBackTrans
   End If
```

**Depois**:
```vb
DeuErro:
   If Err.Number <> 0 Then
      MsgBox Err.Description, vbCritical + vbOKOnly, vaTitulo  ' ← CORRETO: Description
      vgDb.RollBackTrans
   End If
```

**Problema**: Propriedade `Err.Descption` não existe (typo de "Description").

---

### Correção #2: Recordsets não inicializados
**Linha**: ~6687-6690 (antes do handler de erro)

**Antes**:
```vb
   vgDb.CommitTrans
      
   Produtos_da_Nota_Fiscal.Requery     ' ← ERRO 91: pode ser Nothing
   Pecas_da_Nota_Fiscal.Requery        ' ← ERRO 91: pode ser Nothing
   Servicos_da_Nota_Fiscal.Requery     ' ← ERRO 91: pode ser Nothing
   Conjuntos_da_Nota_Fiscal.Requery    ' ← ERRO 91: pode ser Nothing
   
DeuErro:
```

**Depois**:
```vb
   vgDb.CommitTrans
      
   On Error Resume Next
   If Not Produtos_da_Nota_Fiscal Is Nothing Then Produtos_da_Nota_Fiscal.Requery
   If Not Pecas_da_Nota_Fiscal Is Nothing Then Pecas_da_Nota_Fiscal.Requery
   If Not Servicos_da_Nota_Fiscal Is Nothing Then Servicos_da_Nota_Fiscal.Requery
   If Not Conjuntos_da_Nota_Fiscal Is Nothing Then Conjuntos_da_Nota_Fiscal.Requery
   On Error GoTo DeuErro
   
   Exit Sub  ' ← CRÍTICO: sair antes do handler de erro
   
DeuErro:
```

**Problema**: Os recordsets podem não estar inicializados em certas situações (ex.: nota nova sem itens). Chamada direta a `.Requery` gera erro 91.

**Solução**: Verificar `Is Nothing` antes de chamar métodos do objeto.

---

## 🔍 POR QUE O ERRO ACONTECEU

### Cenário típico:
1. Usuário cria nova nota fiscal (sem itens ainda)
2. Tenta salvar (F2 ou botão Salvar)
3. Rotina `AjustaValores` executa:
   - Atualiza totais no banco ✅
   - Tenta fazer `Requery` dos grids ❌ → ERRO 91
4. Cai no handler `DeuErro` que tem o typo `Err.Descption` ❌ → ERRO novamente

### Por que os recordsets estavam `Nothing`:
Os recordsets são declarados assim:
```vb
Dim Produtos_da_Nota_Fiscal As New GRecordSet
```

Mas podem ser destruídos (`Set ... = Nothing`) em eventos como:
- `Form_Unload`
- Cancelamento de operação
- Limpeza de memória

Se `AjustaValores` for chamado antes de reabrir os recordsets, eles estarão `Nothing`.

---

## ✅ TESTE RECOMENDADO

### Antes de colocar em produção:
1. **Nota nova sem itens**:
   - Criar nota
   - Preencher apenas dados principais (cliente, natureza)
   - Salvar (F2) → deve salvar sem erro

2. **Nota com produtos**:
   - Criar nota
   - Adicionar 1-3 produtos
   - Salvar (F2) → deve salvar e atualizar grids

3. **Nota existente (edição)**:
   - Abrir nota salva
   - Alterar cliente ou valor
   - Salvar (F2) → deve atualizar sem erro

---

## 📋 ARQUIVOS MODIFICADOS

| Arquivo | Linhas alteradas | Tipo de mudança |
|---------|------------------|-----------------|
| `IRRIG\NOTAFISC.FRM` | ~6687-6695 | Proteção de recordsets + Exit Sub |
| `IRRIG\NOTAFISC.FRM` | ~6708 | Correção de typo Err.Description |

---

## 🚀 PRÓXIMOS PASSOS

1. ✅ **Testar salvamento** (conforme cenários acima)
2. ⏳ **Verificar outros Requery** sem proteção no código
3. ⏳ **Validar campos IBS/CBS** foram salvos corretamente

---

**Status final**: ✅ **CORRIGIDO E PRONTO PARA TESTE**

---

## 📞 SUPORTE

Se o erro persistir, verificar:
- Log de debug: procurar por "DEBUG RTC" no Immediate Window
- Banco de dados: confirmar que campos `[Valor Total IBS]` e `[Valor Total CBS]` existem
- Permissões: usuário pode escrever na tabela `Nota Fiscal`

**Documentação completa**: `DOCUMENTAÇÃO/PENDENCIAS_RTC_DEFINITIVO.md`
