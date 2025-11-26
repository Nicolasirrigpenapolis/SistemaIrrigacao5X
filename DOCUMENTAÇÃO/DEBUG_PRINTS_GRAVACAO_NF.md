# Debug Prints Adicionados para Rastrear Erro na Gravação da Nota Fiscal

**Data:** 24 de novembro de 2025  
**Arquivo:** `IRRIG\NOTAFISC.FRM`  
**Objetivo:** Rastrear o erro "Object variable or With block variable not set" (Erro 91) durante a gravação

## Erro Identificado

O log mostrou que o erro ocorre especificamente em:
```
>>> EXECUTAR INICIO: vgOq=13 vgSituacao=3
>>> EXECUTAR: POE_NO_ARQUIVO
>>> EXECUTAR ERRO: Err=91 Desc=Object variable or With block variable not set
```

- **vgOq=13** = `POE_NO_ARQUIVO` (gravação dos dados no arquivo/banco)
- **vgSituacao=3** = `ACAO_GRAVANDO` (estado de gravação)
- **Erro 91** = "Object variable or With block variable not set"

## Debug Prints Adicionados

### 1. Função `Executar` - Início
**Linha ~11735:**
```vb
Debug.Print ">>> EXECUTAR INICIO: vgOq=" & vgOq & " vgSituacao=" & vgSituacao
```

**Objetivo:** Rastrear todas as chamadas à função Executar e identificar qual operação está sendo executada.

### 2. Seção VALIDACOES
**Linha ~11743:**
```vb
Debug.Print ">>> EXECUTAR: VALIDACOES - vgSituacao=" & vgSituacao
```

**Objetivo:** Confirmar quando a validação está sendo executada.

### 3. Seção APOS_EDICAO
**Linhas ~12031-12044:**
```vb
Debug.Print ">>> EXECUTAR: APOS_EDICAO - vgSituacao=" & vgSituacao & " Abs(vgSituacao)=" & Abs(vgSituacao)
Debug.Print ">>> EXECUTAR: InicializaApelidos OK"
Debug.Print ">>> EXECUTAR: Chamando AjustaValores para INCLUSAO/EDICAO"
Debug.Print ">>> EXECUTAR: AjustaValores INCLUSAO/EDICAO concluido"
Debug.Print ">>> EXECUTAR: APOS_EDICAO concluido"
```

**Objetivo:** Rastrear quando `AjustaValores` é chamado após edição.

### 4. Seção POE_NO_ARQUIVO - DETALHADO! ⭐
**Linhas ~11915-11992:**

Esta é a seção MAIS CRÍTICA onde o erro está ocorrendo!

```vb
Debug.Print ">>> EXECUTAR: POE_NO_ARQUIVO"
Debug.Print ">>> POE_NO_ARQUIVO: Iniciando loop txtCampo, UBound=" & UBound(txtCampo)

' Loop através de todos os campos de texto
For i = 0 To UBound(txtCampo)
   Debug.Print ">>> POE_NO_ARQUIVO: txtCampo(" & i & ").DataField=" & txtCampo(i).DataField
   Debug.Print ">>> POE_NO_ARQUIVO: Atualizando campo " & txtCampo(i).DataField
Next

Debug.Print ">>> POE_NO_ARQUIVO: Loop txtCampo concluido"

' Leitura de cada campo específico
Debug.Print ">>> POE_NO_ARQUIVO: Lendo Sequencia_do_Movimento"
Debug.Print ">>> POE_NO_ARQUIVO: Sequencia_do_Movimento=" & Sequencia_do_Movimento
Debug.Print ">>> POE_NO_ARQUIVO: Lendo Imprimiu"
Debug.Print ">>> POE_NO_ARQUIVO: Lendo Numero_da_Nota_Fiscal"
Debug.Print ">>> POE_NO_ARQUIVO: Lendo Numero_da_NFe"
Debug.Print ">>> POE_NO_ARQUIVO: Lendo Numero_da_NFSe"
Debug.Print ">>> POE_NO_ARQUIVO: Chamando InicializaApelidos COM_TEXTBOX"

' Gravação de campos específicos
Debug.Print ">>> POE_NO_ARQUIVO: Gravando Transportadora_Avulsa"
Debug.Print ">>> POE_NO_ARQUIVO: Gravando Fechamento"
Debug.Print ">>> POE_NO_ARQUIVO: Gravando Tipo_de_Nota"
Debug.Print ">>> POE_NO_ARQUIVO: Lendo Nota_Cancelada"
Debug.Print ">>> POE_NO_ARQUIVO: Lendo Sequencia_do_Pedido"
Debug.Print ">>> POE_NO_ARQUIVO: Gravando Nota_Fiscal_Avulsa"
Debug.Print ">>> POE_NO_ARQUIVO: Gravando Ocultar_Valor_Unitario"
Debug.Print ">>> POE_NO_ARQUIVO: Gravando Contra_Apresentacao"
Debug.Print ">>> POE_NO_ARQUIVO: Gravando NFe_Complementar"
Debug.Print ">>> POE_NO_ARQUIVO: Lendo Transmitido"
Debug.Print ">>> POE_NO_ARQUIVO: Lendo Autorizado"
Debug.Print ">>> POE_NO_ARQUIVO: Lendo Valor_Total_do_Tributo"
Debug.Print ">>> POE_NO_ARQUIVO: Lendo Valor_Total_do_PIS"
Debug.Print ">>> POE_NO_ARQUIVO: Lendo Valor_Total_do_COFINS"
Debug.Print ">>> POE_NO_ARQUIVO: Gravando Reter_ISS"
Debug.Print ">>> POE_NO_ARQUIVO: Lendo Numero_do_Contrato"
Debug.Print ">>> POE_NO_ARQUIVO: Gravando Conjunto_Avulso"
Debug.Print ">>> POE_NO_ARQUIVO: Gravando Novo_Layout"
Debug.Print ">>> POE_NO_ARQUIVO: Gravando Nota_de_Devolucao"
Debug.Print ">>> POE_NO_ARQUIVO: Lendo Cancelada_no_livro"
Debug.Print ">>> POE_NO_ARQUIVO: Lendo Refaturamento"
Debug.Print ">>> POE_NO_ARQUIVO: Lendo Nota_de_venda"
Debug.Print ">>> POE_NO_ARQUIVO: Lendo Financiamento"
Debug.Print ">>> POE_NO_ARQUIVO: Concluido com sucesso!"
```

**Objetivo:** Identificar EXATAMENTE em qual linha ocorre o erro 91. O último Debug.Print mostrado antes do erro indicará a linha problemática.

### 5. Seção Caso Não Tratado
**Linha ~12046:**
```vb
Debug.Print ">>> EXECUTAR: CASO NAO TRATADO! vgOq=" & vgOq
```

**Objetivo:** Identificar quando uma operação desconhecida é executada.

### 6. Tratamento de Erro DeuErro - AMPLIADO
**Linhas ~12053-12061:**
```vb
Debug.Print ">>> EXECUTAR ERRO: Err=" & Err.Number & " Desc=" & Err.Description & " Source=" & Err.Source & " vgOq=" & vgOq
Debug.Print ">>> EXECUTAR ERRO: vgSituacao=" & vgSituacao & " Nota_Fiscal Is Nothing=" & (Nota_Fiscal Is Nothing) & " vgDb Is Nothing=" & (vgDb Is Nothing)
Debug.Print ">>> EXECUTAR ERRO: Sequencia_da_Nota_Fiscal=" & Sequencia_da_Nota_Fiscal
Debug.Print ">>> EXECUTAR ERRO: vgTb Is Nothing=" & (vgTb Is Nothing)
If Not vgTb Is Nothing Then
   Debug.Print ">>> EXECUTAR ERRO: vgTb.EOF=" & vgTb.EOF & " vgTb.BOF=" & vgTb.BOF
End If
```

**Objetivo:** Fornecer informações detalhadas sobre o estado do sistema quando ocorre um erro.

### 7. Grids (Produtos, Conjuntos, Peças)
**Linhas ~14570, ~14820, ~15060:**
```vb
Debug.Print ">>> GRID0/1/2 (Produtos/Conjuntos/Peças) APOS_EDICAO: vgSituacao=" & vgSituacao
Debug.Print ">>> GRID0/1/2: Chamando AjustaValores INCLUSAO/EDICAO/EXCLUSAO"
Debug.Print ">>> GRID0/1/2: AjustaValores concluido"
```

**Objetivo:** Rastrear quando `AjustaValores` é chamado pelos grids de itens.

### 8. Fim Normal da Função
**Linha ~12050:**
```vb
Debug.Print ">>> EXECUTAR FIM NORMAL: vgOq=" & vgOq & " vgMsg=" & vgMsg$
```

**Objetivo:** Confirmar que a função terminou com sucesso.

## Como Interpretar os Logs

### Fluxo Normal Esperado:
```
>>> EXECUTAR INICIO: vgOq=13 vgSituacao=3
>>> EXECUTAR: POE_NO_ARQUIVO
>>> POE_NO_ARQUIVO: Iniciando loop txtCampo, UBound=69
>>> POE_NO_ARQUIVO: txtCampo(0).DataField=Seqüência da Nota Fiscal
>>> POE_NO_ARQUIVO: txtCampo(1).DataField=...
... (continua para todos os campos)
>>> POE_NO_ARQUIVO: Loop txtCampo concluido
>>> POE_NO_ARQUIVO: Lendo Sequencia_do_Movimento
>>> POE_NO_ARQUIVO: Sequencia_do_Movimento=0
... (continua lendo todos os campos)
>>> POE_NO_ARQUIVO: Concluido com sucesso!
>>> EXECUTAR FIM NORMAL: vgOq=13 vgMsg=
```

### Fluxo com Erro:
```
>>> EXECUTAR INICIO: vgOq=13 vgSituacao=3
>>> EXECUTAR: POE_NO_ARQUIVO
>>> POE_NO_ARQUIVO: Iniciando loop txtCampo, UBound=69
>>> POE_NO_ARQUIVO: txtCampo(0).DataField=Seqüência da Nota Fiscal
>>> POE_NO_ARQUIVO: txtCampo(5).DataField=Campo Problemático  <-- ÚLTIMO LOG ANTES DO ERRO
>>> EXECUTAR ERRO: Err=91 Desc=Object variable or With block variable not set
>>> EXECUTAR ERRO: vgTb Is Nothing=Falso
>>> EXECUTAR ERRO: vgTb.EOF=Falso vgTb.BOF=Falso
```

**O ÚLTIMO Debug.Print ANTES DO ERRO indica EXATAMENTE onde o problema ocorre!**

## Próximos Passos

1. **Executar o sistema** e tentar gravar uma Nota Fiscal
2. **Abrir a janela Immediate** no VB6 (Ctrl+G)
3. **Observar os logs** em tempo real
4. **Identificar o último Debug.Print** antes do erro
5. **Analisar o campo/variável** que causou o erro

## Campos Potencialmente Problemáticos

Baseado na análise, os campos mais prováveis de causar erro são:

### Campos de IBS/CBS (Adicionados Recentemente):
- `Valor Total IBS`
- `Valor Total CBS`

### Campos que Acessam vgTb Diretamente:
- `vgTb![Seqüência do Movimento]`
- `vgTb!Imprimiu`
- `vgTb![Número da Nota Fiscal]`
- `vgTb![Número da NFe]`
- `vgTb![Número da NFSe]`
- `vgTb![Transportadora Avulsa]`
- E todos os outros campos acessados em POE_NO_ARQUIVO

### Possíveis Causas:

1. **Campo não existe no banco** - O campo `Valor Total IBS` ou `Valor Total CBS` não foi criado
2. **vgTb está em estado inválido** - O recordset vgTb não está posicionado corretamente
3. **Objeto auxiliar é Nothing** - Algum objeto auxiliar usado internamente é Nothing
4. **Array txtCampo com problema** - Algum índice do array txtCampo está desconfigurado

## Correções Anteriores Relacionadas

Este debug complementa as correções anteriores:

1. **CORRECAO_ERRO_OBJECT_VARIABLE_NF.md** - Proteção em `AjustaValores`
2. **CORRECAO_RECURSAO_PREVALIDACAO_NF.md** - Proteção contra recursão infinita

Agora estamos rastreando o erro na **gravação real dos dados** (POE_NO_ARQUIVO).

## Conclusão

Com estes Debug.Print detalhados, será possível identificar EXATAMENTE qual linha/campo está causando o erro 91. Uma vez identificado, a correção pode ser aplicada especificamente naquele ponto.

**Status:** Pronto para teste - execute e observe os logs! 🎯
