# Plano de Execução – IBS & CBS / Correção Rejeição 531

## 0. Premissas e diagnóstico
- **Erro atual (531)** indica divergência entre `totalICMS` (grupo `ICMSTot`) e o somatório das bases/taxas por item, hoje agravado pela coexistência de tributos legados e RTC.
- IBS/CBS substituirão ICMS/PIS/COFINS para operações RTC (FinNFe = 5 ou 6) mas também precisam constar como novos campos financeiros para exibição e auditoria.
- ISS deixa de ser calculado, porém campos existentes permanecem para histórico, sem impacto nos novos totais.
- Cálculos precisam ocorrer tanto em itens “tradicionais” (Produtos/Conjuntos/Peças) quanto em agrupamentos/serviços (`SemValores`, `Servicos.Recordset`).
- Devemos atualizar banco, regras de negócio e interface **antes** de tocar nos XMLs, para evitar novas rejeições.

## 1. Tabelas e scripts de banco
Atualizar o modelo relacional inclui as tabelas de itens e a nota fiscal pai. Nas três tabelas detalhadas (`Produtos da Nota Fiscal`, `Conjuntos da Nota Fiscal` e `Peças da Nota Fiscal`) vamos adicionar os dois campos `Valor IBS decimal(18,2) NOT NULL DEFAULT(0)` e `Valor CBS decimal(18,2) NOT NULL DEFAULT(0)` para armazenar os valores calculados por item. Esses campos deverão ser refletidos em views, stored procedures, triggers e relatórios que hoje usam `Valor do Tributo`, para não perder consistência.

A `Nota Fiscal` receberá os campos `Valor Total IBS decimal(18,2) NOT NULL DEFAULT(0)` e `Valor Total CBS decimal(18,2) NOT NULL DEFAULT(0)` para consolidar os somatórios por nota e alimentar o financeiro e o DANFE. Precisamos revisar tabelas auxiliares como `Movimento_Financeiro`, `Totais_NFe` ou outras que replicam os totais para garantir que os novos campos sejam propagados corretamente, evitando diferenças que poderiam gerar rejeições.

As ações propostas são: (1) criar um script incremental SQL em `Atualizacao/` com os `ALTER TABLE` e `UPDATE` iniciais para recalcular valores existentes; (2) ajustar arquivos de instalação (`IRRIG.XML`, `IRRIG.RES`) quando exigido pela estrutura; (3) documentar a mudança na pasta `DOCUMENTAÇÃO/SISTEMA`.

**Ações**
1. Criar script incremental (ex.: `Atualizacao/IBS_CBS_2025_11.sql`) com `ALTER TABLE` + `UPDATE` inicial para recalcular valores existentes (retroativo baseado em `Valor Total`).
2. Atualizar `IRRIG.XML` / `IRRIG.RES` se o instalador depender da estrutura.
3. Documentar mudança em `DOCUMENTAÇÃO/SISTEMA`.

**Status 14/11**: Item 1 executado via `Atualizacao/IBS_CBS_2025_11.SQL` e documentação criada em `DOCUMENTAÇÃO/SISTEMA/IBS_CBS_2025.md`.

## 2. Regras de cálculo por item
1. Novo helper VB6: `CalcValorOperacao(Item)` = `(Qtd * Unitário) - Desconto + Frete` (usar mesmos critérios de arredondamento dos demais tributos – 2 casas, `Round(val, 2)`).
2. Para **cada** item nas tabelas de produtos/conjuntos/peças:
   - `ValorIBS = Round(ValorOperacao * 0.001, 2)`
   - `ValorCBS = Round(ValorOperacao * 0.009, 2)`
   - Persistir imediatamente após calcular ICMS/PIS/COFINS (mesmas fases em `NOTAFISC.FRM`).
3. Garantir que notas geradas via agrupamento (`SemValores`) e serviços (`Servicos.Recordset`) também populam IBS/CBS:
   - Se serviço, repetir fórmula com base `vServ` (ainda que ISS não seja usado).
4. Ajustar rotinas de edição/inclusão de itens (ex.: `Produtos.frm`, `Conjuntos.frm`, `Peças.frm`) para recalcular automaticamente antes do `UpdateBatch`.
5. Logs/Debug: imprimir valores calculados para auditoria (`DEBUG RTC: base=... IBS=...`).

## 3. Totais por nota
1. Somatórios:
   - `ValorTotalIBS = Σ ValorIBS (Produtos + Conjuntos + Peças + Serviços + Agrupamentos)`
   - `ValorTotalCBS = Σ ValorCBS (...)
2. Atualizar rotina `CalculaTotaisDaNota` (ou equivalente em `NOTAFISC.FRM`) para zerar e recomputar antes de enviar à NFe.
3. Ajustar `vTotTrib`:
   - Em modo RTC: `vTotTrib = Round(ValorTotalIBS + ValorTotalCBS, 2)`
   - Em modo híbrido: `vTotTrib = tributos legados + IBS/CBS` (conferir se SEFAZ permite nesta combinação).
4. Persistir novos campos em `Nota Fiscal` ao salvar e garantir alinhamento com financeiro.

## 4. Interface (VB6)
1. **Grids de itens** (Produtos, Conjuntos, Peças):
   - Acrescentar colunas “Valor IBS” e “Valor CBS” (formato moeda, 2 casas).
   - Ajustar `ColumnCount`, `DataField`, `Caption`, largura e ordem lógica próxima aos demais tributos.
2. **Formulários de cadastro/edição**:
   - Exibir campos somente leitura `Valor IBS` e `Valor CBS` próximos a ICMS/PIS/COFINS.
   - Garantir que o cálculo ocorra ao alterar quantidade, unitário, desconto, frete.
3. **Financeiro / rodapé da NF** (`NOTAFISC.FRM`, `Financeiro.frm`):
   - Novas caixas `txtValorTotalIBS`, `txtValorTotalCBS` vinculadas aos campos da tabela.
   - Participam do `BindTotals` e dos relatórios impressos (DANFE).
4. **Relatórios**:
   - Atualizar `IRRIG.RES`/Crystal Reports (se aplicável) para mostrar os novos totais.

## 5. Emissão da NFe / XML
1. Ajustar geração do XML em `NOTAFISC.FRM`:
   - Alimentar grupos RTC (`gIBSUF`, `gCBS`, `IBSCBSTot`) com os valores recém-calculados para evitar divergências.
   - Garantir que `ICMSTot/vBC` (quando FinNFe ≠ 5/6) some apenas itens com tributos legados, evitando rejeição 531.
2. Para FinNFe 5/6:
   - Enviar somente IBS/CBS e garantir que `ValorTotalIBS/CBS` = `vIBSTotal/vCBSTotal` (sem inconsistências).
3. Validar se `totalRTC` usa os novos somatórios; alinhar com versões FlexDocs v5.00n.

## 6. Processos auxiliares
1. **Importação / Exportação**: atualizar integrações (TXT/XML) que replicam os itens para considerar os novos campos.
2. **API FlexDocs / Rotinas RTC**: confirmar se novas variáveis precisam alimentar `IBSCBSTotv130` ou se já é feito automaticamente.
3. **Históricos / Logs**: armazenar IBS/CBS nas tabelas de auditoria (`mov.txt`, históricos de transmissão) para futura conferência.

## 7. Testes e validação
1. **Banco**: executar script em ambiente de homologação e validar inserts/updates.
2. **UI**: cadastrar nota com itens variados, verificar preenchimento automático dos novos campos e arredondamentos.
3. **Regressão NFe**:
   - Caso A: FinNFe = 1 (modo híbrido). Validar se ICMS base + IBS/CBS somam corretamente e SEFAZ aceita.
   - Caso B: FinNFe = 5 e 6 (modo RTC puro). Confirmar ausência de ICMS e rejeições B25/531.
4. **Rejeição 531**: gerar NF-e simulada e comparar `Σ bases` x `total` antes do envio; adicionar assert em `PreValidaNFE`.
5. **Relatórios / Financeiro**: conferir se novos totais aparecem no DANFE e no extrato financeiro.

## 8. Cronograma sugerido
1. Dia 1: Scripts DB + migração dados.
2. Dia 2: Ajustes de cálculo (negócio) + logs.
3. Dia 3: Interface (grids, financeiro) + relatórios.
4. Dia 4: Integração NFe/FlexDocs e testes automatizados/manual.
5. Dia 5: Homologação SEFAZ + correções finais.

---
**Próximo passo:** validar este plano com o time; após aprovação, iniciar execução seguindo a ordem acima.
