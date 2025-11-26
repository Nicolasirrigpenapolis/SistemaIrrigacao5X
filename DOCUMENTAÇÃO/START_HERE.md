# ⚡ GUIA RÁPIDO - O QUE FAZER AGORA

**Você tem 3 arquivos prontos para enviar para outra IA verificar:**

---

## 📤 PARA ENVIAR PARA OUTRA IA:

### ✅ ARQUIVO PRINCIPAL:
```
c:\Projetos\SistemaIrrigacao5X\DOCUMENTAÇÃO\PROMPT_VERIFICACAO_NFE50.md
```

**Instruções:**
1. Copie este arquivo completamente
2. Envie para outra IA (Claude, ChatGPT, etc)
3. Peça para verificar as 5 correções conforme checklist
4. Aguarde relatório de verificação

**Tempo estimado:** 60-90 minutos para verificação completa

---

## 📖 PARA LER AGORA (ANTES DE ENVIAR):

### 1️⃣ Reference Rápida (5 min)
```
c:\Projetos\SistemaIrrigacao5X\DOCUMENTAÇÃO\QUICK_REFERENCE.md
```
**Contém:**
- Localização de tudo
- Fórmulas críticas
- Checklist rápido

### 2️⃣ Resumo Executivo (10 min)
```
c:\Projetos\SistemaIrrigacao5X\DOCUMENTAÇÃO\RESUMO_IMPLEMENTACAO_NFE50.md
```
**Contém:**
- O que foi feito
- 5 correções resumidas
- Fluxo correto
- Próximos passos

### 3️⃣ Análise Detalhada (30 min)
```
c:\Projetos\SistemaIrrigacao5X\DOCUMENTAÇÃO\CORRECOES_NFE_50_IBSCBS.md
```
**Contém:**
- Cada problema
- Antes/Depois código
- Justificativas técnicas
- Pendências

### 4️⃣ Índice Completo (5 min)
```
c:\Projetos\SistemaIrrigacao5X\DOCUMENTAÇÃO\INDICE_DOCUMENTACAO.md
```
**Contém:**
- Estrutura de tudo
- Referências cruzadas
- Próximos passos

---

## 🔧 DOCUMENTAÇÃO TÉCNICA (PARA VALIDAR):

### DLL e Changelog:
```
c:\Projetos\SistemaIrrigacao5X\2Gv5.00n\alteracao.txt
```
**Leia linhas 1-100:**
- v5.0.0m: gIBSCBSv130 assinatura (linhas 31-50)
- v5.0.0l: Criação IBSCBSv130 (linhas 51-100)

### Schemas NFe 5.0:
```
c:\Projetos\SistemaIrrigacao5X\2Gv5.00n\NFe_Util\Schemas\*v5.0*
```
**Contém:** Validadores XML para NFe 5.0

### DLL Atualizada:
```
c:\Projetos\SistemaIrrigacao5X\2Gv5.00n\NFe_Util_2G.dll
```
**Versão:** v5.00n (2025-11-08)

---

## 💻 CÓDIGO MODIFICADO:

```
c:\Projetos\SistemaIrrigacao5X\IRRIG\NOTAFISC.FRM
```

**5 correções neste arquivo:**

| # | Localização | O quê | Status |
|---|-------------|-------|--------|
| 1 | Linha 6481 | MontaIBSCBS - Parâmetros opcionais | ✅ |
| 2 | Linha 6534 | gIBSCBSv130 em vez de gIBSCBS | ✅ |
| 3 | Linha 10280 | Chamadas com valores do banco | ✅ |
| 4 | Linha 10330 | Totais acumulam do banco | ✅ |
| 5 | Linha 10740 | SemValores atualizado | ✅ |

---

## 🎯 WHAT TO DO NOW (3 STEPS):

### STEP 1: Entender (15 min)
```bash
Leia nesta ordem:
1. QUICK_REFERENCE.md
2. RESUMO_IMPLEMENTACAO_NFE50.md
3. CORRECOES_NFE_50_IBSCBS.md
```

### STEP 2: Verificar (90 min - IA Externa)
```bash
Copie e envie para outra IA:
→ PROMPT_VERIFICACAO_NFE50.md
```

**Diga para IA:**
```
"Por favor, execute a verificação completa conforme o checklist 
no arquivo acima. Validar as 5 correções em NOTAFISC.FRM 
comparando com alteracao.txt v5.0.0m e v5.0.0l. 
Retorne um relatório de status."
```

### STEP 3: Próximos Passos (Depende do Resultado)
```bash
Se APROVADO ✅:
→ Testar localmente (inserir item, verificar BD)
→ Transmitir NFe em SEFAZ homologação

Se REJEIÇÕES ❌:
→ Analisar feedback
→ Fazer ajustes
→ Reverificar
```

---

## 📋 DECISÕES PENDENTES (Seu Time)

Antes de testar, defina:

- [ ] CST correto (substituir "90")
- [ ] Valor de cClassTrib
- [ ] Alíquotas IBS/CBS para sua região
- [ ] Se usar grupos opcionais (gEstornoCred, gCredPresOper, etc)

---

## ✅ TUDO PRONTO PARA ENVIAR?

Checklist antes de enviar para verificação:

- [x] 5 correções implementadas em NOTAFISC.FRM
- [x] Código compila sem erros
- [x] Documentação técnica criada (4 arquivos)
- [x] Prompt de verificação pronto (PROMPT_VERIFICACAO_NFE50.md)
- [x] Schemas NFe 5.0 disponíveis
- [x] DLL v5.00n instalada
- [x] alteracao.txt disponível para validação
- [x] Relatório de referências cruzadas feito

**STATUS: 🟢 PRONTO PARA VERIFICAÇÃO EXTERNA**

---

## 🚀 COPIE E COLE:

### Para enviar para outra IA:

```
=== INSTRUÇÃO PARA IA VERIFICADORA ===

Projeto: Sistema NFe 5.0 com IBS/CBS (Reforma Tributária)

TAREFA: Verificar implementação de 5 correções conforme checklist

ARQUIVO A VERIFICAR:
c:\Projetos\SistemaIrrigacao5X\IRRIG\NOTAFISC.FRM

DOCUMENTAÇÃO DE REFERÊNCIA:
- alteracao.txt linhas 1-100 (v5.0.0m e v5.0.0l)
- 2Gv5.00n\NFe_Util\Schemas\*v5.0*

O QUE FAZER:
1. Ler PROMPT_VERIFICACAO_NFE50.md (incluso)
2. Executar checklist de 30+ itens
3. Validar assinaturas de funções contra alteracao.txt
4. Retornar relatório conforme template em anexo

TEMPO ESTIMADO: 60-90 minutos

ENTREGAR: Relatório de verificação com status APROVADO/REJEITADO/PENDÊNCIAS

=== FIM INSTRUÇÃO ===
```

---

## 📞 AJUDA RÁPIDA

**Pergunta:** Onde estão os schemas v5.0?  
**Resposta:** `2Gv5.00n\NFe_Util\Schemas\*v5.0*`

**Pergunta:** Qual é o changelog com informações críticas?  
**Resposta:** `2Gv5.00n\alteracao.txt` linhas 1-100

**Pergunta:** Qual é a função correta a usar?  
**Resposta:** `gIBSCBSv130` (não `gIBSCBS`)

**Pergunta:** Qual é a assinatura da função?  
**Resposta:** `gIBSCBSv130(vBC, gIBSUF, gIBSMun, vIBS, gCBS, "", "")`

**Pergunta:** Quanto tempo para verificar?  
**Resposta:** 60-90 minutos com checklist completo

**Pergunta:** Qual arquivo enviar para IA?  
**Resposta:** `PROMPT_VERIFICACAO_NFE50.md`

---

## 🎓 RESUMO EM 1 MINUTO

✅ **5 correções implementadas** em NOTAFISC.FRM  
✅ **Documentação técnica completa** (4 arquivos)  
✅ **Prompt de verificação pronto** para outra IA  
✅ **Schemas e DLL atualizada** disponível  
⏳ **Pendente:** Verificação externa + Ajustes + Testes SEFAZ  

**PRÓXIMA AÇÃO:** Envie `PROMPT_VERIFICACAO_NFE50.md` para outra IA

---

_Última atualização: 24 de novembro de 2025_  
_Status: ✅ PRONTO PARA VERIFICAÇÃO_
