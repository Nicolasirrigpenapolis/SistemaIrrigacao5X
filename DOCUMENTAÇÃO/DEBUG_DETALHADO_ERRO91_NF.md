# Debug Detalhado Adicionado para Rastreamento do Erro 91

**Data:** 24 de novembro de 2025  
**Arquivo:** `IRRIG\NOTAFISC.FRM`  
**Objetivo:** Rastrear a origem exata do erro "Object variable or With block variable not set" (Erro 91)

## Situação Atual

Baseado no log fornecido, identificamos que:

- **Erro 91** ocorre em `vgOq = 13`
- **vgSituacao = 3** (ACAO_GRAVANDO)
- O erro acontece **ANTES** de chegar em `APOS_EDICAO` (que chamaria `AjustaValores`)

## Log Atual
```
>>> EXECUTAR INICIO: vgOq=13 vgSituacao=3
>>> EXECUTAR ERRO: Err=91 Desc=Object variable or With block variable not set Source=IRRIG
```

## Debug.Print Adicionados

### 1. Função `Executar` - Início e Fim

**Localização:** Linha ~11735

```vb
Public Function Executar(vgOq As String, Optional ByRef vgColumn As Integer) As String
   Debug.Print ">>> EXECUTAR INICIO: vgOq=" & vgOq & " vgSituacao=" & vgSituacao
   ' ... código ...
   Debug.Print ">>> EXECUTAR FIM NORMAL: vgOq=" & vgOq & " vgMsg=" & vgMsg$
```

### 2. Seção VALIDACOES

**Localização:** Linha ~11741

```vb
If vgOq = VALIDACOES Then
   Debug.Print ">>> EXECUTAR: VALIDACOES - vgSituacao=" & vgSituacao
```

### 3. Seção POE_NO_ARQUIVO

**Localização:** Linha ~11916

```vb
ElseIf vgOq = POE_NO_ARQUIVO Then
   Debug.Print ">>> EXECUTAR: POE_NO_ARQUIVO"
```

### 4. Seção APOS_EDICAO (Principal)

**Localização:** Linha ~11996

```vb
ElseIf vgOq = APOS_EDICAO Then
   Debug.Print ">>> EXECUTAR: APOS_EDICAO - vgSituacao=" & vgSituacao
   InicializaApelidos COM_REGISTRO
   Debug.Print ">>> EXECUTAR: InicializaApelidos OK"
   If Abs(vgSituacao) = ACAO_INCLUINDO Then
      Debug.Print ">>> EXECUTAR: Chamando AjustaValores para INCLUSAO"
      AjustaValores
      Debug.Print ">>> EXECUTAR: AjustaValores INCLUSAO concluido"
   ElseIf Abs(vgSituacao) = ACAO_EDITANDO Then
      Debug.Print ">>> EXECUTAR: Chamando AjustaValores para EDICAO"
      AjustaValores
      Debug.Print ">>> EXECUTAR: AjustaValores EDICAO concluido"
   End If
   Debug.Print ">>> EXECUTAR: APOS_EDICAO concluido"
```

### 5. ELSE - Captura Casos Não Tratados ⚠️

**Localização:** Linha ~12010

```vb
Else
   Debug.Print ">>> EXECUTAR: CASO NAO TRATADO! vgOq=" & vgOq
End If
```

**IMPORTANTE:** Este ELSE vai capturar o vgOq=13 que está causando o erro!

### 6. Tratamento de Erro Detalhado

**Localização:** Linha ~12014

```vb
DeuErro:
   Debug.Print ">>> EXECUTAR ERRO: Err=" & Err.Number & " Desc=" & Err.Description & " Source=" & Err.Source & " vgOq=" & vgOq
   Debug.Print ">>> EXECUTAR ERRO: vgSituacao=" & vgSituacao & " Nota_Fiscal Is Nothing=" & (Nota_Fiscal Is Nothing) & " vgDb Is Nothing=" & (vgDb Is Nothing)
   On Error Resume Next
   Debug.Print ">>> EXECUTAR ERRO: Sequencia_da_Nota_Fiscal=" & Sequencia_da_Nota_Fiscal
   On Error GoTo 0
```

### 7. Grid 0 (Produtos) - APOS_EDICAO

**Localização:** Linha ~14570

```vb
ElseIf vgOq = APOS_EDICAO Then
   Debug.Print ">>> GRID0 (Produtos) APOS_EDICAO: vgSituacao=" & vgSituacao
   GoSub IniApDaCol
   If Abs(vgSituacao) = ACAO_INCLUINDO Then
      Debug.Print ">>> GRID0: Chamando AjustaValores INCLUSAO"
      AjustaValores
      Debug.Print ">>> GRID0: AjustaValores INCLUSAO concluido"
   ElseIf Abs(vgSituacao) = ACAO_EDITANDO Then
      Debug.Print ">>> GRID0: Chamando AjustaValores EDICAO"
      AjustaValores
      Debug.Print ">>> GRID0: AjustaValores EDICAO concluido"
   ElseIf Abs(vgSituacao) = ACAO_EXCLUINDO Then
      Debug.Print ">>> GRID0: Chamando AjustaValores EXCLUSAO"
      AjustaValores
      Debug.Print ">>> GRID0: AjustaValores EXCLUSAO concluido"
```

### 8. Grid 1 (Conjuntos) - APOS_EDICAO

**Localização:** Linha ~14815

```vb
ElseIf vgOq = APOS_EDICAO Then
   Debug.Print ">>> GRID1 (Conjuntos) APOS_EDICAO: vgSituacao=" & vgSituacao
   ' ... similar ao Grid0 ...
```

### 9. Grid 2 (Peças) - APOS_EDICAO

**Localização:** Linha ~15051

```vb
ElseIf vgOq = APOS_EDICAO Then
   Debug.Print ">>> GRID2 (Peças) APOS_EDICAO: vgSituacao=" & vgSituacao
   ' ... similar ao Grid0 ...
```

## Próximo Teste - Log Esperado

Com os novos Debug.Print, esperamos ver no próximo teste:

```
>>> EXECUTAR INICIO: vgOq=13 vgSituacao=3
>>> EXECUTAR: CASO NAO TRATADO! vgOq=13          <-- NOVO!
>>> EXECUTAR ERRO: Err=91 Desc=Object variable or With block variable not set Source=IRRIG vgOq=13
>>> EXECUTAR ERRO: vgSituacao=3 Nota_Fiscal Is Nothing=True vgDb Is Nothing=False  <-- NOVO!
>>> EXECUTAR ERRO: Sequencia_da_Nota_Fiscal=123  <-- NOVO!
```

## O Que Isso Vai Revelar

Os novos Debug.Print vão nos dizer:

1. ✅ **Confirmação:** vgOq=13 não tem tratamento específico (ELSE vai capturar)
2. ✅ **Estado dos Objetos:** Saberemos se `Nota_Fiscal` ou `vgDb` estão `Nothing`
3. ✅ **Sequência:** Qual nota fiscal está sendo processada
4. ✅ **Contexto Completo:** Todos os valores relevantes no momento do erro

## Constantes vgOq Conhecidas

Baseado no código:

- `0` = VALIDACOES
- `3` = ? (usado no log, precisa identificar)
- `12` = ? (usado no log, precisa identificar)
- `13` = **DESCONHECIDO - CAUSA DO ERRO** ⚠️
- `24` = ? (usado no log, precisa identificar)
- `27` = ? (usado no log, precisa identificar)
- INICIALIZACOES
- PEGA_DO_ARQUIVO
- TESTA_VAL_RS
- POE_NO_ARQUIVO
- INI_APELIDOS
- PODE_ALTERAR
- APOS_EDICAO

## Próximos Passos

1. **Executar novo teste** com o código atualizado
2. **Analisar novo log** para identificar:
   - Qual objeto está `Nothing`
   - Qual constante é vgOq=13
   - Onde no código o erro está ocorrendo
3. **Adicionar tratamento** para vgOq=13 se necessário
4. **Corrigir objeto** que está `Nothing`

## Arquivos Relacionados

- `CORRECAO_ERRO_OBJECT_VARIABLE_NF.md` - Primeira correção (GetRsValue)
- `CORRECAO_RECURSAO_PREVALIDACAO_NF.md` - Segunda correção (loop infinito)
- Este documento - Terceira fase (debug detalhado)

## Observações Importantes

⚠️ **O erro está acontecendo em um vgOq não tratado (13)**

Isso sugere que:
- Pode ser uma constante definida em outro módulo (BAS)
- Pode ser um valor numérico direto sem constante
- Pode estar faltando um ElseIf no código

O log do próximo teste vai revelar EXATAMENTE onde e por quê o erro está ocorrendo!
