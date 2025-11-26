# Atualização IBS/CBS – Novembro/2025

## Objetivo
Adicionar suporte estrutural aos tributos IBS (0,1%) e CBS (0,9%) em todas as etapas da Nota Fiscal eletrônica, permitindo corrigir a rejeição 531 e preparar o cálculo RTC completo.

## Script incremental
- **Arquivo**: `Atualizacao/IBS_CBS_2025_11.SQL`
- **Função**: cria os novos campos, aplica `DEFAULT 0` com `WITH VALUES`, recalcula os valores retroativos dos itens e consolida os totais da nota.

## Alterações de esquema
1. `dbo.Nota Fiscal`
   - Novo campo `Valor Total IBS decimal(18,2) NOT NULL DEFAULT(0)`
   - Novo campo `Valor Total CBS decimal(18,2) NOT NULL DEFAULT(0)`
2. `dbo.Produtos da Nota Fiscal`
   - Novo campo `Valor IBS decimal(18,2) NOT NULL DEFAULT(0)`
   - Novo campo `Valor CBS decimal(18,2) NOT NULL DEFAULT(0)`
3. `dbo.Conjuntos da Nota Fiscal`
   - Novo campo `Valor IBS decimal(18,2) NOT NULL DEFAULT(0)`
   - Novo campo `Valor CBS decimal(18,2) NOT NULL DEFAULT(0)`
4. `dbo.Peças da Nota Fiscal`
   - Novo campo `Valor IBS decimal(18,2) NOT NULL DEFAULT(0)`
   - Novo campo `Valor CBS decimal(18,2) NOT NULL DEFAULT(0)`

## Passos recomendados
1. Executar o script em homologação.
2. Validar se views, stored procedures e relatórios que dependem dos novos campos foram recompilados.
3. Replicar em produção após o "Dia 1" do cronograma descrito em `plan.md`.
