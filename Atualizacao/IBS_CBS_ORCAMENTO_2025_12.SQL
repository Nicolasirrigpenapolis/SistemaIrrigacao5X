/*
    Script: IBS_CBS_ORCAMENTO_2025_12.SQL
    Objetivo: Adicionar campos de IBS/CBS nas tabelas de Orçamento e itens (Produtos, Conjuntos, Peças do Orçamento)
    Data: 2025-12-02
*/

USE [IRRIGACAO];
GO

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO

-- ============================================================================
-- TABELA: Orçamento - Campos totais
-- ============================================================================
PRINT '>> Adicionando campos [Valor Total IBS/CBS] na tabela Orçamento';

IF COL_LENGTH(N'dbo.Orçamento', N'Valor Total IBS') IS NULL
BEGIN
    ALTER TABLE [dbo].[Orçamento]
        ADD [Valor Total IBS] decimal(18,2) NOT NULL
            CONSTRAINT [DF_Orcamento_Valor_Total_IBS] DEFAULT (0) WITH VALUES;
    PRINT '   Campo [Valor Total IBS] adicionado com sucesso.';
END
ELSE
BEGIN
    PRINT '   Campo [Valor Total IBS] já existe.';
END
GO

IF COL_LENGTH(N'dbo.Orçamento', N'Valor Total CBS') IS NULL
BEGIN
    ALTER TABLE [dbo].[Orçamento]
        ADD [Valor Total CBS] decimal(18,2) NOT NULL
            CONSTRAINT [DF_Orcamento_Valor_Total_CBS] DEFAULT (0) WITH VALUES;
    PRINT '   Campo [Valor Total CBS] adicionado com sucesso.';
END
ELSE
BEGIN
    PRINT '   Campo [Valor Total CBS] já existe.';
END
GO

-- ============================================================================
-- TABELA: Produtos do Orçamento - Campos por item
-- ============================================================================
PRINT '>> Adicionando campos [Valor IBS/CBS] na tabela Produtos do Orçamento';

IF COL_LENGTH(N'dbo.Produtos do Orçamento', N'Valor IBS') IS NULL
BEGIN
    ALTER TABLE [dbo].[Produtos do Orçamento]
        ADD [Valor IBS] decimal(18,2) NOT NULL
            CONSTRAINT [DF_Produtos_Orc_Valor_IBS] DEFAULT (0) WITH VALUES;
    PRINT '   Campo [Valor IBS] adicionado com sucesso.';
END
ELSE
BEGIN
    PRINT '   Campo [Valor IBS] já existe.';
END
GO

IF COL_LENGTH(N'dbo.Produtos do Orçamento', N'Valor CBS') IS NULL
BEGIN
    ALTER TABLE [dbo].[Produtos do Orçamento]
        ADD [Valor CBS] decimal(18,2) NOT NULL
            CONSTRAINT [DF_Produtos_Orc_Valor_CBS] DEFAULT (0) WITH VALUES;
    PRINT '   Campo [Valor CBS] adicionado com sucesso.';
END
ELSE
BEGIN
    PRINT '   Campo [Valor CBS] já existe.';
END
GO

-- ============================================================================
-- TABELA: Conjuntos do Orçamento - Campos por item
-- ============================================================================
PRINT '>> Adicionando campos [Valor IBS/CBS] na tabela Conjuntos do Orçamento';

IF COL_LENGTH(N'dbo.Conjuntos do Orçamento', N'Valor IBS') IS NULL
BEGIN
    ALTER TABLE [dbo].[Conjuntos do Orçamento]
        ADD [Valor IBS] decimal(18,2) NOT NULL
            CONSTRAINT [DF_Conjuntos_Orc_Valor_IBS] DEFAULT (0) WITH VALUES;
    PRINT '   Campo [Valor IBS] adicionado com sucesso.';
END
ELSE
BEGIN
    PRINT '   Campo [Valor IBS] já existe.';
END
GO

IF COL_LENGTH(N'dbo.Conjuntos do Orçamento', N'Valor CBS') IS NULL
BEGIN
    ALTER TABLE [dbo].[Conjuntos do Orçamento]
        ADD [Valor CBS] decimal(18,2) NOT NULL
            CONSTRAINT [DF_Conjuntos_Orc_Valor_CBS] DEFAULT (0) WITH VALUES;
    PRINT '   Campo [Valor CBS] adicionado com sucesso.';
END
ELSE
BEGIN
    PRINT '   Campo [Valor CBS] já existe.';
END
GO

-- ============================================================================
-- TABELA: Peças do Orçamento - Campos por item
-- ============================================================================
PRINT '>> Adicionando campos [Valor IBS/CBS] na tabela Peças do Orçamento';

IF COL_LENGTH(N'dbo.Peças do Orçamento', N'Valor IBS') IS NULL
BEGIN
    ALTER TABLE [dbo].[Peças do Orçamento]
        ADD [Valor IBS] decimal(18,2) NOT NULL
            CONSTRAINT [DF_Pecas_Orc_Valor_IBS] DEFAULT (0) WITH VALUES;
    PRINT '   Campo [Valor IBS] adicionado com sucesso.';
END
ELSE
BEGIN
    PRINT '   Campo [Valor IBS] já existe.';
END
GO

IF COL_LENGTH(N'dbo.Peças do Orçamento', N'Valor CBS') IS NULL
BEGIN
    ALTER TABLE [dbo].[Peças do Orçamento]
        ADD [Valor CBS] decimal(18,2) NOT NULL
            CONSTRAINT [DF_Pecas_Orc_Valor_CBS] DEFAULT (0) WITH VALUES;
    PRINT '   Campo [Valor CBS] adicionado com sucesso.';
END
ELSE
BEGIN
    PRINT '   Campo [Valor CBS] já existe.';
END
GO

-- ============================================================================
-- NOTA: Os valores de IBS/CBS devem ser zerados por padrão
-- O cálculo será feito apenas quando o orçamento for editado/criado
-- ============================================================================
PRINT '>> Campos IBS/CBS criados com valor padrão 0 (zero).';
PRINT '>> Os valores só serão calculados quando um orçamento for editado/criado.';

PRINT '>> Script IBS_CBS_ORCAMENTO_2025_12 executado com sucesso.';
GO
