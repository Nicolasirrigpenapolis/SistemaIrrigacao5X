# QUICK REFERENCE - NFe 5.0 IBS/CBS

## 📌 LOCALIZAÇÃO DE DOCUMENTAÇÃO E SCHEMAS

### 📂 Pasta Principal
```
c:\Projetos\SistemaIrrigacao5X\
```

### 📄 Documentação Técnica (LEIA PRIMEIRO)
```
DOCUMENTAÇÃO/
├── RESUMO_IMPLEMENTACAO_NFE50.md         ← COMECE AQUI (executivo)
├── CORRECOES_NFE_50_IBSCBS.md            ← Análise detalhada (5 correções)
└── PROMPT_VERIFICACAO_NFE50.md           ← Checklist de verificação (30+ itens)
```

### 🔧 DLL e Schemas (VALIDE COM ESTES)
```
2Gv5.00n/
├── NFe_Util_2G.dll                       ← DLL FlexDocs v5.00n
├── alteracao.txt                          ← LEIA: Linhas 1-50 (v5.0.0m/5.0.0l crítico)
└── NFe_Util/
    ├── Schemas/                          ← XML Validation Schemas
    │   ├── *v4.0x*                       ← Schemas layout 4.0x
    │   └── *v5.0*                        ← **NOVO** Reforma Tributária
    └── Exemplos de XML/
        └── NFe_Manual_v4.0x/             ← Exemplos (v2.0, v1.10 estão desatualizados)
```

### 💻 Código Principal
```
IRRIG/
└── NOTAFISC.FRM                          ← Todas as 5 correções aqui
    ├── Linha 6481:   MontaIBSCBS (correção 1)
    ├── Linha 6534:   gIBSCBSv130 (correção 2)
    ├── Linha 10280:  Chamada Produtos (correção 3)
    ├── Linha 10330:  Totais (correção 4)
    └── Linha 10740:  SemValores (correção 5)
```

---

## 🔍 VERIFICAÇÕES RÁPIDAS

### Verificação 1: Assinatura de Função
```vb
' DEVE SER (v5.0.0m):
gIBSCBS_xml = objNFeUtil.gIBSCBSv130(vBC, gIBSUF_xml, gIBSMun_xml, vIBS, gCBS_xml, "", "")
' 7 parâmetros, com vIBS

' NÃO DEVE SER (antiga):
gIBSCBS_xml = objNFeUtil.gIBSCBS(vBC, gIBSUF_xml, gIBSMun_xml, gCBS_xml, "", "", "", "")
' 8 parâmetros, sem vIBS ❌
```

### Verificação 2: Passagem de Valores
```vb
' DEVE PASSAR valores do banco:
MontaIBSCBS objNFeUtil, baseValorRTC, det_IBSCBS, det_IS, ibscbs_vBC, ibscbs_vIBSUF, ibscbs_vIBSMun, ibscbs_vCBS, valorIBS_Item, valorCBS_Item
'                                                                                                                    ^^^^^^^^^^^^^^^ ^^^^^^^^^^^^^^^
'                                                                                                               Parâmetros opcionais do banco

' NÃO DEVE (sem valores):
MontaIBSCBS objNFeUtil, baseValorRTC, det_IBSCBS, det_IS, ibscbs_vBC, ibscbs_vIBSUF, ibscbs_vIBSMun, ibscbs_vCBS
```

### Verificação 3: Totais do Banco
```vb
' DEVE acumular do banco:
If valorIBS_Item >= 0 And valorCBS_Item >= 0 Then
   vIBSTotal = vIBSTotal + valorIBS_Item       ' ← Do BANCO
   vCBSTotal = vCBSTotal + valorCBS_Item       ' ← Do BANCO
End If

' NÃO DEVE (recalculados):
vIBSTotal = vIBSTotal + ibscbs_vIBSUF          ' ❌ Recalculado
vCBSTotal = vCBSTotal + ibscbs_vCBS            ' ❌ Recalculado
```

---

## ⚡ FÓRMULAS CRÍTICAS

### Cálculo IBS/CBS por Item
```
Base_Operacao = (Qtd × Valor_Unit) - Desconto + Frete
Valor_IBS = Base_Operacao × (RTC_PERC_IBSUF + RTC_PERC_IBSMUN) / 100
Valor_CBS = Base_Operacao × RTC_PERC_CBS / 100

Com constantes padrão:
Valor_IBS = Base_Operacao × (0.1 + 0) / 100 = Base_Operacao × 0.001
Valor_CBS = Base_Operacao × 0.9 / 100 = Base_Operacao × 0.009
```

### Totais (DEVE BATER)
```
vIBSTotal = SUM(Valor_IBS de todos os itens)
vCBSTotal = SUM(Valor_CBS de todos os itens)

VALIDAÇÃO:
SUM(Item[Valor IBS]) == total[Valor Total IBS]  ✅
SUM(Item[Valor CBS]) == total[Valor Total CBS]  ✅
```

### Distribuição IBSUF e IBSMun
```
vIBSUF = vIBS × (RTC_PERC_IBSUF / (RTC_PERC_IBSUF + RTC_PERC_IBSMUN))
vIBSMun = vIBS × (RTC_PERC_IBSMUN / (RTC_PERC_IBSUF + RTC_PERC_IBSMUN))

Com padrão (0.1 / 0.1, sem municipal):
vIBSUF = vIBS × 1.0 = vIBS
vIBSMun = vIBS × 0.0 = 0
```

---

## 🎯 CONSTANTES A VALIDAR

```vb
Private Const RTC_PERC_IBSUF As Double = 0.1     ' ← Valide: 0.1% é correto?
Private Const RTC_PERC_IBSMUN As Double = 0      ' ← Valide: 0% é correto?
Private Const RTC_PERC_CBS As Double = 0.9       ' ← Valide: 0.9% é correto?
```

**Para PENÁPOLIS-SP em 2025:**
- ✅ IBS estadual: 0.1% (conforme lei)
- ❓ IBS municipal: 0% (verificar com prefeitura)
- ❓ CBS: 0.9% (conforme lei Reforma Tributária)

---

## ❌ PROBLEMAS CONHECIDOS

### Problema 1: CST Genérico
```vb
ibscbs_CST = "90"  ' Genérico (OUTROS) - pode estar errado
```
**Solução:** Determinar CST correto conforme tipo de produto

### Problema 2: cClassTrib Vazio
```vb
ibscbs_cClassTrib = ""  ' Vazio - pode ser obrigatório
```
**Solução:** Popular com classificação correta

### Problema 3: Sem Teste SEFAZ
```
Não foi testado em ambiente real SEFAZ
```
**Solução:** Transmitir NFe de homologação para validar

---

## ✅ CHECKLIST RÁPIDO (15 min)

- [ ] Arquivo `NOTAFISC.FRM` compila sem erro
- [ ] Linha 6481: MontaIBSCBS tem 2 parâmetros opcionais
- [ ] Linha 6534: Usa `gIBSCBSv130` (não `gIBSCBS`)
- [ ] Linha 10280: Lê `Item![Valor IBS]` e `Item![Valor CBS]`
- [ ] Linha 10298: Passa valores para MontaIBSCBS
- [ ] Linha 10340-10345: Acumula do banco, não recalcul
- [ ] Linha 10740: SemValores usa `gIBSCBSv130`
- [ ] Alteracao.txt v5.0.0m menciona eliminação de gIBSCredPres ✅
- [ ] Alteracao.txt v5.0.0l menciona IBSCBSv130 com indDoacao ✅
- [ ] Schemas v5.0 existem em 2Gv5.00n\NFe_Util\Schemas ✅
- [ ] DLL v5.00n é 2025-11-08 (último) ✅

Se tudo marca ✅ → Código está correto

---

## 🚀 ORDEM DE LEITURA RECOMENDADA

1. **ESTE ARQUIVO** (5 min) - Você está aqui
2. **RESUMO_IMPLEMENTACAO_NFE50.md** (10 min)
3. **CORRECOES_NFE_50_IBSCBS.md** (30 min)
4. **PROMPT_VERIFICACAO_NFE50.md** (60 min verificação)
5. **alteracao.txt** linhas 1-100 (30 min)

---

## 🔗 LINKS RÁPIDOS

| O que? | Onde? | Linhas |
|--------|-------|--------|
| Função MontaIBSCBS | NOTAFISC.FRM | 6481-6549 |
| gIBSCBSv130 | NOTAFISC.FRM | 6534, 10740 |
| Leitura do banco | NOTAFISC.FRM | 10285, 10410 |
| Acumulação totais | NOTAFISC.FRM | 10330-10345 |
| Constantes IBS/CBS | NOTAFISC.FRM | 5448-5450 |
| Alteracao v5.0.0m | 2Gv5.00n/alteracao.txt | 31-50 |
| Alteracao v5.0.0l | 2Gv5.00n/alteracao.txt | 51-100 |
| Schemas NFe 5.0 | 2Gv5.00n/NFe_Util/Schemas/ | *v5.0* |

---

## 💡 DICAS IMPORTANTES

1. **Sempre use fallback** - Se valores do banco falharem, recalcula com constantes
2. **Tratamento de erro silencioso** - Não quebra fluxo se campos IBS/CBS faltarem
3. **Debug.Print** - Adicionados para rastrear valores durante transmissão
4. **Proporção IBSUF/IBSMun** - Mantém mesma distribuição em totais
5. **Parâmetros opcionais** - Compatível com chamadas antigas (sem valores do banco)

---

## 🆘 SE DER ERRO NA SEFAZ

### Erro: "Tag vIBS não informada"
```
→ Verificar linha 6534
→ Confirmar que vIBS está sendo passado a gIBSCBSv130
→ Não é gIBSCBS antiga
```

### Erro: "Total de IBS divergente"
```
→ Verificar linha 10330-10345
→ Confirmar que totais acumulam do banco
→ Verificar proporção IBSUF/IBSMun
```

### Erro: "CST inválido"
```
→ Verificar linha 6489
→ Ajustar ibscbs_CST de "90" para valor correto
→ Consultar legislação Reforma Tributária
```

### Erro: "XML schema validation failed"
```
→ Verificar contra Schemas em 2Gv5.00n\NFe_Util\Schemas\*v5.0*
→ Confirmar todas as tags IBSCBS estão presentes
→ Validar tipos de dados (numeric, string, etc)
```

---

## 📞 CONTATOS ÚTEIS

- **FlexDocs:** www.flexdocs.net/guiaNFe
- **RFB:** www.gov.br/rfb
- **SEFAZ:** www.sefazrs.gov.br (exemplo RS)
- **Documentação Reforma Tributária:** LC nº 192/2022

---

## 📝 TEMPLATE PARA RESPOSTA DA VERIFICAÇÃO

Ao enviar para outra IA, peça para retornar assim:

```
✅ VERIFICAÇÃO NFe 5.0 - RELATÓRIO FINAL

DATA: [data]
VERIFICADOR: [nome]

STATUS GERAL: [APROVADO/REJEITADO/PENDÊNCIAS]

CORREÇÕES VALIDADAS:
✅ Correção 1: MontaIBSCBS - APROVADA
✅ Correção 2: gIBSCBSv130 - APROVADA
✅ Correção 3: Chamadas com valores - APROVADA
✅ Correção 4: Totais do banco - APROVADA
✅ Correção 5: SemValores atualizado - APROVADA

PROBLEMAS ENCONTRADOS:
(nenhum / lista de problemas)

RECOMENDAÇÕES:
(próximos passos)

PRÓXIMA AÇÃO:
[ ] Testar localmente
[ ] Transmitir SEFAZ homologação
[ ] Ajustar conforme feedback SEFAZ
```

---

**PRONTO PARA VERIFICAR? Envie PROMPT_VERIFICACAO_NFE50.md para outra IA! 🚀**

---

_Último update: 24 de novembro de 2025_
