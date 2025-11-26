/*
    Script: IBS_CBS_2025_11.SQL
    Objetivo: adicionar campos de IBS/CBS nas tabelas de Nota Fiscal e itens,
              além de recalcular valores existentes para manter consistência.
    Data: 2025-11-14
*/

USE [IRRIGACAO];
GO

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO

PRINT '>> Adicionando campos [Valor Total IBS/CBS] na tabela Nota Fiscal';
IF COL_LENGTH(N'dbo.Nota Fiscal', N'Valor Total IBS') IS NULL
BEGIN
    ALTER TABLE [dbo].[Nota Fiscal]
        ADD [Valor Total IBS] decimal(18,2) NOT NULL
            CONSTRAINT [DF_Nota_Fiscal_Valor_Total_IBS] DEFAULT (0) WITH VALUES;
END
GO

IF COL_LENGTH(N'dbo.Nota Fiscal', N'Valor Total CBS') IS NULL
BEGIN
    ALTER TABLE [dbo].[Nota Fiscal]
        ADD [Valor Total CBS] decimal(18,2) NOT NULL
            CONSTRAINT [DF_Nota_Fiscal_Valor_Total_CBS] DEFAULT (0) WITH VALUES;
END
GO

PRINT '>> Adicionando campos [Valor IBS/CBS] na tabela Produtos da Nota Fiscal';
IF COL_LENGTH(N'dbo.Produtos da Nota Fiscal', N'Valor IBS') IS NULL
BEGIN
    ALTER TABLE [dbo].[Produtos da Nota Fiscal]
        ADD [Valor IBS] decimal(18,2) NOT NULL
            CONSTRAINT [DF_Produtos_NF_Valor_IBS] DEFAULT (0) WITH VALUES;
END
GO

IF COL_LENGTH(N'dbo.Produtos da Nota Fiscal', N'Valor CBS') IS NULL
BEGIN
    ALTER TABLE [dbo].[Produtos da Nota Fiscal]
        ADD [Valor CBS] decimal(18,2) NOT NULL
            CONSTRAINT [DF_Produtos_NF_Valor_CBS] DEFAULT (0) WITH VALUES;
END
GO

PRINT '>> Adicionando campos [Valor IBS/CBS] na tabela Conjuntos da Nota Fiscal';
IF COL_LENGTH(N'dbo.Conjuntos da Nota Fiscal', N'Valor IBS') IS NULL
BEGIN
    ALTER TABLE [dbo].[Conjuntos da Nota Fiscal]
        ADD [Valor IBS] decimal(18,2) NOT NULL
            CONSTRAINT [DF_Conjuntos_NF_Valor_IBS] DEFAULT (0) WITH VALUES;
END
GO

IF COL_LENGTH(N'dbo.Conjuntos da Nota Fiscal', N'Valor CBS') IS NULL
BEGIN
    ALTER TABLE [dbo].[Conjuntos da Nota Fiscal]
        ADD [Valor CBS] decimal(18,2) NOT NULL
            CONSTRAINT [DF_Conjuntos_NF_Valor_CBS] DEFAULT (0) WITH VALUES;
END
GO

PRINT '>> Adicionando campos [Valor IBS/CBS] na tabela Peças da Nota Fiscal';
IF COL_LENGTH(N'dbo.Peças da Nota Fiscal', N'Valor IBS') IS NULL
BEGIN
    ALTER TABLE [dbo].[Peças da Nota Fiscal]
        ADD [Valor IBS] decimal(18,2) NOT NULL
            CONSTRAINT [DF_Pecas_NF_Valor_IBS] DEFAULT (0) WITH VALUES;
END
GO

IF COL_LENGTH(N'dbo.Peças da Nota Fiscal', N'Valor CBS') IS NULL
BEGIN
    ALTER TABLE [dbo].[Peças da Nota Fiscal]
        ADD [Valor CBS] decimal(18,2) NOT NULL
            CONSTRAINT [DF_Pecas_NF_Valor_CBS] DEFAULT (0) WITH VALUES;
END
GO

PRINT '>> Recalculando IBS/CBS retroativos nos itens (Produtos)';
UPDATE P
   SET [Valor IBS] = CONVERT(decimal(18,2), ISNULL([Valor Total], 0) * 0.001),
       [Valor CBS] = CONVERT(decimal(18,2), ISNULL([Valor Total], 0) * 0.009)
FROM [dbo].[Produtos da Nota Fiscal] AS P;
GO

PRINT '>> Recalculando IBS/CBS retroativos nos itens (Conjuntos)';
UPDATE C
   SET [Valor IBS] = CONVERT(decimal(18,2), ISNULL([Valor Total], 0) * 0.001),
       [Valor CBS] = CONVERT(decimal(18,2), ISNULL([Valor Total], 0) * 0.009)
FROM [dbo].[Conjuntos da Nota Fiscal] AS C;
GO

PRINT '>> Recalculando IBS/CBS retroativos nos itens (Peças)';
UPDATE PE
   SET [Valor IBS] = CONVERT(decimal(18,2), ISNULL([Valor Total], 0) * 0.001),
       [Valor CBS] = CONVERT(decimal(18,2), ISNULL([Valor Total], 0) * 0.009)
FROM [dbo].[Peças da Nota Fiscal] AS PE;
GO

PRINT '>> Consolidando totais de IBS/CBS por Nota Fiscal';
;WITH Totais AS (
    SELECT NF.[Seqüência da Nota Fiscal],
           ValorTotalIBS = ISNULL(Prod.SumIBS, 0) + ISNULL(Conj.SumIBS, 0) + ISNULL(Pec.SumIBS, 0),
           ValorTotalCBS = ISNULL(Prod.SumCBS, 0) + ISNULL(Conj.SumCBS, 0) + ISNULL(Pec.SumCBS, 0)
      FROM [dbo].[Nota Fiscal] AS NF
      OUTER APPLY (
            SELECT SUM([Valor IBS]) AS SumIBS,
                   SUM([Valor CBS]) AS SumCBS
              FROM [dbo].[Produtos da Nota Fiscal] AS P
             WHERE P.[Seqüência da Nota Fiscal] = NF.[Seqüência da Nota Fiscal]
      ) AS Prod
      OUTER APPLY (
            SELECT SUM([Valor IBS]) AS SumIBS,
                   SUM([Valor CBS]) AS SumCBS
              FROM [dbo].[Conjuntos da Nota Fiscal] AS C
             WHERE C.[Seqüência da Nota Fiscal] = NF.[Seqüência da Nota Fiscal]
      ) AS Conj
      OUTER APPLY (
            SELECT SUM([Valor IBS]) AS SumIBS,
                   SUM([Valor CBS]) AS SumCBS
              FROM [dbo].[Peças da Nota Fiscal] AS PE
             WHERE PE.[Seqüência da Nota Fiscal] = NF.[Seqüência da Nota Fiscal]
      ) AS Pec
)
UPDATE NF
   SET [Valor Total IBS] = CONVERT(decimal(18,2), ISNULL(T.ValorTotalIBS, 0)),
       [Valor Total CBS] = CONVERT(decimal(18,2), ISNULL(T.ValorTotalCBS, 0))
  FROM [dbo].[Nota Fiscal] AS NF
  JOIN Totais AS T
    ON T.[Seqüência da Nota Fiscal] = NF.[Seqüência da Nota Fiscal];
GO

PRINT '>> Script IBS_CBS_2025_11 executado com sucesso.';
GO
