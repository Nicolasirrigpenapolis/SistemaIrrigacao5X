/*
    Script: ZERAR_IBS_CBS_ORCAMENTO.SQL
    Objetivo: Zerar todos os valores de IBS/CBS nos orçamentos existentes
    Motivo: O script anterior calculou valores retroativamente, mas o correto é começar zerado
    Data: 2025-12-03
*/

USE [IRRIGACAO];
GO

-- ============================================================================
-- ZERAR IBS/CBS em todos os itens de Orçamento
-- ============================================================================
PRINT '>> Zerando IBS/CBS em Produtos do Orçamento';
UPDATE [dbo].[Produtos do Orçamento]
   SET [Valor IBS] = 0,
       [Valor CBS] = 0;
GO

PRINT '>> Zerando IBS/CBS em Conjuntos do Orçamento';
UPDATE [dbo].[Conjuntos do Orçamento]
   SET [Valor IBS] = 0,
       [Valor CBS] = 0;
GO

PRINT '>> Zerando IBS/CBS em Peças do Orçamento';
UPDATE [dbo].[Peças do Orçamento]
   SET [Valor IBS] = 0,
       [Valor CBS] = 0;
GO

-- ============================================================================
-- ZERAR totais de IBS/CBS nos Orçamentos
-- ============================================================================
PRINT '>> Zerando totais IBS/CBS em Orçamento';
UPDATE [dbo].[Orçamento]
   SET [Valor Total IBS] = 0,
       [Valor Total CBS] = 0;
GO

PRINT '>> Script ZERAR_IBS_CBS_ORCAMENTO executado com sucesso.';
PRINT '>> Todos os valores de IBS/CBS foram zerados.';
PRINT '>> Os valores só serão calculados quando um orçamento for editado/criado.';
GO
