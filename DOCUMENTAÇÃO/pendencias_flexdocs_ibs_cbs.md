# ⚠️ DOCUMENTO OBSOLETO — VEJA `PENDENCIAS_RTC_DEFINITIVO.md`

Este documento foi substituído por uma versão atualizada e mais clara.

**Novo documento**: `PENDENCIAS_RTC_DEFINITIVO.md`

Principais atualizações:
- ✅ Erro de salvamento da NF corrigido (typo `Err.Descption`)
- 🚫 Serviços: nunca mais serão usados (decisão de negócio)
- 💳 Crédito presumido: não aplicável (somos Lucro Real)
- 📋 Checklist detalhado do que falta implementar

**Data**: 18/11/2025

A meta é garantir que `NOTAFISC.FRM` e os módulos auxiliares estejam alinhados com as exigências da reforma tributária (FlexDocs 5.00n) para evitar rejeções 531/\*\* e dar suporte total aos novos grupos RTC. O diagnóstico já confirmou que a maior parte dos campos e funções de cálculo existem, mas ainda há lacunas documentadas nos scripts, UI, totais e XML.

## Serviços ("ATENÇÃO: não vamos usar serviço")
- O plano original cita a necessidade de propagar IBS/CBS também nos agrupamentos “SemValores” e no `Servicos.Recordset`. No nosso contexto de negócios atual **não há emissão de serviços**, portanto não precisaremos preencher os campos `vServ`, `indServ` ou criar abas/lógicas específicas para serviços na nota.
- Mesmo assim, precisamos garantir que:
  1. Qualquer rotina genérica (por exemplo, `CalcValorOperacao` ou `AtualizaValoresIBSCBS`) continue preparada para lidar com itens que não sejam produtos físicos, caso um dia entremos com serviços.
  2. O campo `FinNFe` em Fin 5/6 **não envie valores de serviços**, já que estamos focados apenas em produtos/peças/conjuntos.
  3. Os totais de IBS/CBS sejam construídos apenas com produtos atuais, mas mantenham o gancho para incluir serviços sem quebrar o XML.

## Crédito (o que é e por que aparece nos grupos RTC)
No universo RTC, "crédito" refere-se ao crédito presumido de IBS/CBS que o adquirente pode gerar ao pagar certas operações. Os grupos envolvidos são:
- `gCredPres` / `gCredPresOper`: indicam o crédito presumido por item ou por operação, respectivamente. São usados em eventos como 211110/211150 e no `totalRTC` quando há crédito a compensar.
- `gCredPresIBSZFM` / `gCredPresCBS`: variações para operações em zonas francas (ALC/ZFM) que precisam declarar o crédito separado.
- `gEstornoCred`: grupo usado para registrar estornos de crédito quando um item é devolvido ou uma NF é cancelada.
- `IBSCBSv130` / `IBSCBSTotv130`: versões 1.30 do grupo principal que recebem, além de `vBC`/`gIBS`/`gCBS`, os subgrupos de crédito (e o novo `gAjusteCompet`, se for o caso).

**Onde estamos:** nenhum desses grupos de crédito está em uso hoje no nosso `NOTAFISC.FRM`, porque não emitimos eventos fiscais de crédito. Ainda assim, precisamos manter as chamadas para `IBSCBSv130`/`totalRTC` consistentes com as assinaturas atualizadas, deixando parâmetros opcionais em branco (`""`) quando inexequíveis.

## O que falta implementar, por área
| Área | O que precisa ser feito | Referência | Status atual |
| --- | --- | --- | --- |
| Banco de dados | Scripts de `ALTER TABLE` e `UPDATE` para os campos `ValorIBS` e `ValorCBS` em produtos, conjuntos e peças; e totals na tabela `Nota Fiscal`. | `plan.md §1` | Provavelmente já concluído (documentação existente), mas rever se os campos estão sendo usados em todas as views e SPs. |
| Regras por item | Garantir `CalcValorOperacao` → IBS/CBS para todos os itens; aplicar em `SemValores`; persistir nos recordsets (`Produtos`, `Conjuntos`, `Peças`). | `plan.md §2`, `NOTAFISC.FRM` | A lógica principal existe, mas falta evidência de que todos os recordsets e botões de alteração atualizam `ValorIBS`/`ValorCBS`. |
| Totais da nota | `CalculaTotaisDaNota` deve atualizar `ValorTotalIBS/CBS`, definir `vTotTrib = IBS+CBS` em Fin 5/6 e chamar `gIBSTot`, `gCBSTot` com os valores atuais. | `plan.md §3`, `NOTAFISC.FRM` | `AjustaValores` já chama `totalRTC`, mas ainda não empacota os novos parâmetros do grupo de crédito nem exibe os totais nos campos da NF. |
| Interface | Exibir colunas e campos de IBS/CBS nos grids e no rodapé (NF, financeiro); garantir o valor aparece nos relatórios/DANFE. | `plan.md §4` | Precisamos confirmar se `txtValorTotalIBS` / `txtValorTotalCBS` existem e estão vinculados. Possivelmente falta atualização do `IRRIG.RES`. |
| XML - RTC | Alinhar `MontaIBSCBS`, `IBSCBSTotv130`, `totalRTC`, `identificadorRTCv130`, `produtoRTCv130` com as assinaturas 5.00n; preencher `gEstornoCred`, `gCredPresOper`, `gAjusteCompet` quando houver dados. | `plan.md §5`, `alteracao5.txt` | `IBSCBSTot` já é chamado, mas sem as novas assinaturas. Ainda não há populadores para os subgrupos de crédito nem para `gAjusteCompet`/`gEstornoCred`. |
| Processos auxiliares | Integrações e logs devem propagar IBS/CBS, e os eventos RTC (211110/211150 etc.) precisam das mesmas informações se algum dia forem usados. | `plan.md §6` | Documentado mas sem implementação (eventos não usados). |
| Testes | Scripts manuais (Fin 1, 5/6), validação de rejeições e compare de totais. | `plan.md §7` | Em aberto; será importante criar casos de teste automatizados e de homologação. |

## Pontos técnicos essenciais (resumo rápido)
1. `CalcValorOperacao(Item)` deve considerar frete/desc/adiantamento e sempre arredondar para 2 casas antes de multiplicar pelas alíquotas (`pIBSUF`, `pCBS`).
2. `AtualizaValoresIBSCBS` deve gravar `ValorIBS` e `ValorCBS` nos recordsets de produtos/conjuntos/peças e também nos campos temporários usados na montagem do XML.
3. `MontaIBSCBS` e `totalRTC` precisam passar: `IBSCBSTotv130(vBCIBSCBS, gIBS_Opc, gCBS_Opc, gMono_Opc)` – atualmente só enviamos `vBC` e os grupos principais; falta preencher as strings de crédito.
4. `produtoRTCv130`/`identificadorRTCv130` introduzem campos opcionais como `credPresumido_Opc`, `xJust`, `gCompraGov`, `tpNFDebito`, `tpNFCredito` e devem ser invocados com os valores corretos ou strings vazias para manter compatibilidade.
5. Mesmo sem crédito ativo, devemos sempre passar `""` para os parâmetros opcionais que não usamos (ex.: `gCredPresOper_Opc = ""`).

## Próximos passos imediatos
1. Validar se o `DOCUMENTAÇÃO/SISTEMA/IBS_CBS_2025.md` já contém os scripts/documentações necessários; se não, completar com a checklist acima.
2. Auditar `NOTAFISC.FRM` e os formulários irmãos (`Produtos`, `Conjuntos`, `Peças`) para garantir a persistência dos novos campos e que o usuário os enxerga.
3. Atualizar as chamadas a `IBSCBSv130`/`totalRTC` para enviar `gEstornoCred`, `gAjusteCompet`, `gCredPresOper`/`gCredPresIBSZFM` (mesmo que sejam strings vazias) e documentar os locais onde esses dados deveriam vir.
4. Criar testes de validação manual (Fin 1/5/6) e scripts para não regressar nos totais da nota.

**Nota:** esta lista visa dar uma visão consolidada do que ainda falta para fechar a reforma tributária com o `NOTAFISC.FRM`. Caso prefira, posso transformar esses pontos em issues ou tarefas mais detalhadas.
