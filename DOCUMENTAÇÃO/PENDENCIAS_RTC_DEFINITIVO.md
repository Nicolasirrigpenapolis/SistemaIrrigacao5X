# Pendências RTC — FlexDocs 5.00n (Atualizado)

## ✅ CORREÇÃO IMPLEMENTADA: Erro ao salvar NF
**RESOLVIDO**: O erro "object" ao salvar a nota fiscal foi causado por um typo na rotina `AjustaValores` (linha ~6708 de `NOTAFISC.FRM`):
- **Antes**: `If Err Then MsgBox Err.Descption` ← propriedade errada + teste de erro incorreto
- **Depois**: `If Err.Number <> 0 Then MsgBox Err.Description` ← correto
- **Status**: ✅ CORRIGIDO

## 🚫 Serviços — NUNCA MAIS SERÃO USADOS
**Decisão de negócio**: o sistema **NÃO emitirá notas de serviço**. 

### O que existe hoje (legacy):
- Aba "Serviços" no formulário
- Recordset `Servicos_da_Nota_Fiscal`
- Campos ISS, NFSe, Alíquota do ISS
- Função `InfoServicos()`
- Cálculos de totais ISS/PIS/COFINS sobre serviços

### O que faremos:
1. **Manter o código legacy** (não deletar) para histórico e compatibilidade com notas antigas.
2. **Desabilitar para RTC**: quando `usaRTC = True` (FinNFe 5/6), os totais de serviços são zerados:
   ```vb
   If Not permiteTributosLegados Then
      totServ = 0
      totBCISS = 0
      totISS = 0
      ISSQNTot = ""
   End If
   ```
3. **IBS/CBS**: a rotina `AtualizaValoresIBSCBS` **NÃO** processa serviços, apenas produtos/conjuntos/peças.
4. **Totais RTC**: `gIBSTot`, `gCBSTot`, `IBSCBSTotv130` somam apenas produtos físicos.

### Por que serviços aparecem no código:
Eram usados para NFSe (nota fiscal de serviço eletrônica) municipal. Com a RTC, focamos 100% em produtos.

---

## 💳 Crédito Presumido — NÃO APLICÁVEL (somos LUCRO REAL)

### O que é "crédito presumido" na RTC?
Na reforma tributária, **crédito presumido** permite ao adquirente compensar parte do IBS/CBS pago em operações específicas:
- **Zona Franca de Manaus (ZFM)** e Áreas de Livre Comércio (ALC)
- **Combustíveis** para uso em atividades produtivas
- **Bens de capital** (imobilizado)
- **Operações com entes governamentais**
- **Importações convertidas em isenção**

### Grupos FlexDocs envolvidos:
| Grupo | Uso | Quando preencher |
|-------|-----|------------------|
| `gCredPres` | Crédito presumido por item | Evento 211110 (Solicitação de Apropriação) |
| `gCredPresOper` | Crédito presumido da operação | Totais da nota (quando aplicável) |
| `gCredPresIBSZFM` / `gCredPresCBS` | Crédito específico ZFM/ALC | Itens com benefício ZFM |
| `gEstornoCred` | Estorno de crédito | Devolução/cancelamento de NF com crédito |
| `gAjusteCompet` | Ajuste de competência | Correções de período de apuração |

### Eventos RTC de crédito (que NÃO usamos):
- **211110**: Solicitação de Apropriação de Crédito Presumido
- **211120**: Destinação para Consumo Pessoal
- **211124**: Perda/Roubo/Furto em transporte FOB
- **211130**: Imobilização de Item
- **211140**: Crédito de Combustível
- **211150**: Crédito para Bens/Serviços dependentes de atividade
- **112110**: Informação de Pagamento Integral (libera crédito do adquirente)

### Por que NÃO usamos crédito presumido:
1. **Somos LUCRO REAL**: regime não-cumulativo, calculamos crédito sobre compras reais, não presumido.
2. **Não operamos em ZFM/ALC**: nossos clientes são em SP e outras UFs, sem benefícios de zona franca.
3. **Não emitimos eventos fiscais**: não usamos os 211XXX/112XXX do FlexDocs.

### O que fazer no código:
✅ **Já está correto**: as chamadas a `IBSCBSv130` passam `""` (strings vazias) nos parâmetros de crédito:
```vb
det_IBSCBS = objNFeUtil.IBSCBSv130(ibscbs_CST, ibscbs_cClassTrib, "", gIBSCBS_xml, "", "")
'                                                                 ↑             ↑   ↑
'                                                          vIBS (opcional)  gEstornoCred  gAjusteCompet
```

✅ **Totais também vazios**:
```vb
IBSCBSTot_xml = objNFeUtil.IBSCBSTotv130(vBCIBSCBSRTC, gIBSTot_Total_xml, gCBSTot_Total_xml, "", "")
'                                                                                           ↑   ↑
'                                                                                    gMono_Opc  gEstorno/Ajuste
```

**Conclusão**: não precisamos preencher esses grupos. Basta garantir que os parâmetros opcionais sejam `""` (já está assim).

---

## 📋 O que FALTA implementar

### 1. ✅ Banco de dados
**Status**: CONCLUÍDO (script `IBS_CBS_2025_11_NO_RECALC.SQL` executado).
- Campos criados: `[Valor IBS]`, `[Valor CBS]` em produtos/conjuntos/peças e `[Valor Total IBS]`, `[Valor Total CBS]` na nota fiscal.
- **Pendência menor**: verificar se alguma view/SP antiga precisa atualização (ex.: relatórios Crystal).

### 2. 🔄 Regras por item (IMPLEMENTADO, precisa teste)
**Status**: IMPLEMENTADO na rotina `AtualizaValoresIBSCBS`.
- ✅ Calcula IBS/CBS para cada produto/conjunto/peça com `CalcValorOperacaoRTC`.
- ✅ Persiste via `UPDATE` direto no banco.
- ⚠️ **Pendência**: confirmar que TODAS as rotinas de edição de item (F2, botões de alteração, imports) chamam `AtualizaValoresIBSCBS`.

### 3. ✅ Totais da nota (IMPLEMENTADO)
**Status**: CONCLUÍDO na rotina `AjustaValores`.
- ✅ Soma IBS/CBS de todos os itens.
- ✅ Persiste `[Valor Total IBS]` e `[Valor Total CBS]` na tabela `Nota Fiscal`.
- ✅ Alimenta `vTotTrib = IBS + CBS` quando `usaRTC = True`.

### 4. ⚠️ Interface (FALTA validar)
**Status**: PARCIAL — campos existem no form, mas precisamos confirmar binding.
- ✅ Campos `txtValorTotalIBS` e `txtValorTotalCBS` existem (DataField configurado).
- ⚠️ **Pendência**: verificar se os grids (`GrdProdutos`, `grdConjuntos`, `grdPecas`) exibem colunas "Valor IBS" e "Valor CBS".
  - **Ação**: adicionar colunas nos grids se não existirem.
- ⚠️ **Pendência**: atualizar `IRRIG.RES` (relatório DANFE) para mostrar IBS/CBS nos totais.

### 5. ✅ XML RTC (IMPLEMENTADO, precisa validação SEFAZ)
**Status**: IMPLEMENTADO mas não testado em ambiente de homologação.
- ✅ `MontaIBSCBS` gera `gIBSUF`, `gIBSMun`, `gCBS`, `gIBSCBS`.
- ✅ `IBSCBSv130` chamado com parâmetros corretos (crédito vazio).
- ✅ `totalRTC` gera `gIBSTot`, `gCBSTot`, `IBSCBSTot`, `vIS`, `vNFTot`.
- ⚠️ **Pendência**: testar emissão em homologação SEFAZ (FinNFe 5/6) e validar se SEFAZ aceita sem rejeição 531.

### 6. 🔄 Processos auxiliares (NÃO IMPLEMENTADO)
**Status**: DOCUMENTADO mas sem código.
- ⚠️ Importação/Exportação TXT/XML: não atualizam IBS/CBS.
- ⚠️ Integrações com ERP/Financeiro: campos novos podem não estar mapeados.
- ⚠️ Logs de auditoria: não gravam IBS/CBS (se necessário).

### 7. ❌ Testes (NÃO FEITO)
**Status**: PENDENTE.
- Criar casos de teste:
  - Nota com FinNFe = 1 (híbrido) → deve ter ICMS + IBS/CBS.
  - Nota com FinNFe = 5 (RTC puro) → só IBS/CBS, ICMS zerado.
  - Nota com FinNFe = 6 (RTC gradual) → verificar regras.
- Validar totais: `Σ(ValorIBS) = Nota_Fiscal![Valor Total IBS]`.
- Testar rejeição 531: enviar NF em homologação e confirmar aprovação.

---

## 🔧 Checklist técnico (para devs)

### Assinaturas FlexDocs v5.00n usadas:
```vb
' Item (produto/conjunto/peça):
det_IBSCBS = objNFeUtil.IBSCBSv130(CST, cClassTrib, vIBS_Opc, gIBSCBS_xml, gEstornoCred_Opc, gAjusteCompet_Opc)
'                                   ↑       ↑          ↑            ↑              ↑                 ↑
'                                  "90"     ""        ""     (vBC+gIBS+gCBS)       ""               ""

' Totais:
IBSCBSTot_xml = objNFeUtil.IBSCBSTotv130(vBCIBSCBS, gIBSTot_xml, gCBSTot_xml, gMono_Opc, gCredPresOper_Opc)
'                                          ↑            ↑             ↑           ↑             ↑
'                                      vBC total    totais IBS    totais CBS     ""            ""

totalRTC_xml = objNFeUtil.totalRTC(TotalICMS, ISSQNTot, retTrib, vIS, IBSCBSTot, vNFTot)
'                                      ↑          ↑         ↑      ↑       ↑        ↑
'                                   legado    legado     ""       0    RTC totals  total NF
```

### Constantes RTC (já definidas):
```vb
Const RTC_MIN_VIBS = 0.01          ' Mínimo para evitar rejeição
Const RTC_PERC_IBSUF = 0.1         ' 0,1% IBS estadual
Const RTC_PERC_IBSMUN = 0.0        ' 0% IBS municipal (SP não cobra)
Const RTC_PERC_CBS = 0.9           ' 0,9% CBS federal
```

### Funções auxiliares:
| Função | Objetivo | Status |
|--------|----------|--------|
| `CalcValorOperacaoRTC` | Base de cálculo RTC (qtd × unit - desc + frete) | ✅ OK |
| `AtualizaValoresIBSCBS` | Calcula e persiste IBS/CBS por item | ✅ OK |
| `MontaIBSCBS` | Gera XML dos grupos RTC por item | ✅ OK |
| `AjustaValores` | Recalcula totais da nota | ✅ OK |

---

## 🎯 Próximos passos IMEDIATOS

1. **Verificar grids**: confirmar se colunas IBS/CBS aparecem nos grids de produtos/conjuntos/peças.
   - Se não: adicionar via designer ou código.
2. **Testar salvamento**: criar nota com 1 produto, salvar, verificar se campos IBS/CBS foram preenchidos no banco.
3. **Testar XML**: gerar XML para FinNFe = 5, verificar se contém `<gIBSUF>`, `<gCBS>`, `<IBSCBSTot>`.
4. **Homologação SEFAZ**: enviar nota de teste e validar aprovação (sem rejeição 531).
5. **Atualizar DANFE**: se necessário, editar `IRRIG.RES` para mostrar IBS/CBS nos totais impressos.

---

## 📚 Referências
- **FlexDocs Release Notes**: `alteracao5.txt` (v5.00n - 2025-06-18)
- **Plano de execução**: `plan.md`
- **Documentação DB**: `DOCUMENTAÇÃO/SISTEMA/IBS_CBS_2025.md`
- **Script SQL**: `Atualizacao/IBS_CBS_2025_11_NO_RECALC.SQL`

---

**Última atualização**: 18/11/2025  
**Responsável**: Sistema de irrigação — adaptação RTC 2025
