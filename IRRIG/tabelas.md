USE [IRRIGACAO]
GO

UPDATE [dbo].[Nota Fiscal]
   SET [Número da NFe] = <Número da NFe, int,>
      ,[Número da NFSe] = <Número da NFSe, int,>
      ,[Número da Nota Fiscal] = <Número da Nota Fiscal, int,>
      ,[Data de Emissão] = <Data de Emissão, datetime,>
      ,[Seqüência do Geral] = <Seqüência do Geral, int,>
      ,[Seqüência da Propriedade] = <Seqüência da Propriedade, smallint,>
      ,[Seqüência da Natureza] = <Seqüência da Natureza, smallint,>
      ,[Transportadora Avulsa] = <Transportadora Avulsa, bit,>
      ,[Seqüência da Transportadora] = <Seqüência da Transportadora, int,>
      ,[Nome da Transportadora Avulsa] = <Nome da Transportadora Avulsa, varchar(60),>
      ,[Placa do Veículo] = <Placa do Veículo, varchar(8),>
      ,[UF do Veículo] = <UF do Veículo, varchar(3),>
      ,[Frete] = <Frete, varchar(35),>
      ,[Valor do Frete] = <Valor do Frete, decimal(12,4),>
      ,[Fechamento] = <Fechamento, smallint,>
      ,[Valor do Fechamento] = <Valor do Fechamento, decimal(11,2),>
      ,[Volume] = <Volume, int,>
      ,[Espécie] = <Espécie, varchar(20),>
      ,[Data de Saída] = <Data de Saída, datetime,>
      ,[Hora da Saída] = <Hora da Saída, datetime,>
      ,[Forma de Pagamento] = <Forma de Pagamento, varchar(10),>
      ,[Histórico] = <Histórico, text,>
      ,[Valor Total IPI dos Produtos] = <Valor Total IPI dos Produtos, decimal(11,2),>
      ,[Valor Total IPI dos Conjuntos] = <Valor Total IPI dos Conjuntos, decimal(11,2),>
      ,[Valor Total do ICMS] = <Valor Total do ICMS, decimal(11,2),>
      ,[Valor Total dos Produtos] = <Valor Total dos Produtos, decimal(11,2),>
      ,[Valor Total dos Conjuntos] = <Valor Total dos Conjuntos, decimal(11,2),>
      ,[Valor Total de Produtos Usados] = <Valor Total de Produtos Usados, decimal(11,2),>
      ,[Valor Total Conjuntos Usados] = <Valor Total Conjuntos Usados, decimal(11,2),>
      ,[Valor Total dos Serviços] = <Valor Total dos Serviços, decimal(11,2),>
      ,[Valor Total da Nota Fiscal] = <Valor Total da Nota Fiscal, decimal(11,2),>
      ,[Tipo de Nota] = <Tipo de Nota, smallint,>
      ,[Seqüência da Classificação] = <Seqüência da Classificação, smallint,>
      ,[Nota Cancelada] = <Nota Cancelada, bit,>
      ,[Seqüência do Pedido] = <Seqüência do Pedido, int,>
      ,[Seqüência do Vendedor] = <Seqüência do Vendedor, int,>
      ,[Seqüência da Cobrança] = <Seqüência da Cobrança, smallint,>
      ,[Nota Fiscal Avulsa] = <Nota Fiscal Avulsa, bit,>
      ,[Peso Bruto] = <Peso Bruto, decimal(11,2),>
      ,[Peso Líquido] = <Peso Líquido, decimal(11,2),>
      ,[Ocultar Valor Unitário] = <Ocultar Valor Unitário, bit,>
      ,[Contra Apresentação] = <Contra Apresentação, bit,>
      ,[Município da Transportadora] = <Município da Transportadora, int,>
      ,[Documento da Transportadora] = <Documento da Transportadora, varchar(20),>
      ,[NFe Complementar] = <NFe Complementar, bit,>
      ,[Chave Acesso NFe Referenciada] = <Chave Acesso NFe Referenciada, varchar(45),>
      ,[Chave de Acesso da NFe] = <Chave de Acesso da NFe, varchar(50),>
      ,[Protocolo de Autorização NFe] = <Protocolo de Autorização NFe, varchar(50),>
      ,[Data e Hora da NFe] = <Data e Hora da NFe, varchar(25),>
      ,[Transmitido] = <Transmitido, bit,>
      ,[Autorizado] = <Autorizado, bit,>
      ,[Número do Recibo da NFe] = <Número do Recibo da NFe, varchar(20),>
      ,[Marca] = <Marca, varchar(20),>
      ,[Numeração] = <Numeração, varchar(20),>
      ,[Valor Total IPI das Peças] = <Valor Total IPI das Peças, decimal(11,2),>
      ,[Valor Total das Peças] = <Valor Total das Peças, decimal(11,2),>
      ,[Código da ANTT] = <Código da ANTT, varchar(20),>
      ,[Endereço da Transportadora] = <Endereço da Transportadora, varchar(40),>
      ,[IE da Transportadora] = <IE da Transportadora, varchar(15),>
      ,[Observação] = <Observação, text,>
      ,[Valor Total das Peças Usadas] = <Valor Total das Peças Usadas, decimal(11,2),>
      ,[Valor Total da Base de Cálculo] = <Valor Total da Base de Cálculo, decimal(11,2),>
      ,[Valor do Seguro] = <Valor do Seguro, decimal(11,2),>
      ,[Valor Total do PIS] = <Valor Total do PIS, decimal(11,2),>
      ,[Valor Total do COFINS] = <Valor Total do COFINS, decimal(11,2),>
      ,[Valor Total da Base ST] = <Valor Total da Base ST, decimal(11,2),>
      ,[Valor Total do ICMS ST] = <Valor Total do ICMS ST, decimal(11,2),>
      ,[Alíquota do ISS] = <Alíquota do ISS, decimal(5,2),>
      ,[Reter ISS] = <Reter ISS, bit,>
      ,[Recibo NFSe] = <Recibo NFSe, varchar(255),>
      ,[Imprimiu] = <Imprimiu, bit,>
      ,[Seqüência do Movimento] = <Seqüência do Movimento, int,>
      ,[Número do Contrato] = <Número do Contrato, int,>
      ,[Valor do Imposto de Renda] = <Valor do Imposto de Renda, decimal(11,2),>
      ,[Valor Total da Importação] = <Valor Total da Importação, decimal(11,2),>
      ,[Conjunto Avulso] = <Conjunto Avulso, bit,>
      ,[Valor Total do Tributo] = <Valor Total do Tributo, decimal(11,2),>
      ,[Descrição Conjunto Avulso] = <Descrição Conjunto Avulso, varchar(60),>
      ,[FinNFe] = <FinNFe, smallint,>
      ,[Novo Layout] = <Novo Layout, bit,>
      ,[Nota de Devolução] = <Nota de Devolução, bit,>
      ,[Chave da Devolução] = <Chave da Devolução, varchar(200),>
      ,[Outras Despesas] = <Outras Despesas, decimal(10,2),>
      ,[Chave da Devolução 2] = <Chave da Devolução 2, varchar(200),>
      ,[Chave da Devolução 3] = <Chave da Devolução 3, varchar(200),>
      ,[Cancelada no livro] = <Cancelada no livro, bit,>
      ,[Refaturamento] = <Refaturamento, bit,>
      ,[Nota de venda] = <Nota de venda, int,>
      ,[Financiamento] = <Financiamento, bit,>
 WHERE <Search Conditions,,>
GO





USE [IRRIGACAO]
GO

UPDATE [dbo].[Produtos da Nota Fiscal]
   SET [Seqüência da Nota Fiscal] = <Seqüência da Nota Fiscal, int,>
      ,[Seqüência do Produto] = <Seqüência do Produto, int,>
      ,[Quantidade] = <Quantidade, decimal(11,4),>
      ,[Valor Unitário] = <Valor Unitário, decimal(12,4),>
      ,[Valor Total] = <Valor Total, decimal(12,4),>
      ,[Valor do IPI] = <Valor do IPI, decimal(12,4),>
      ,[Valor do ICMS] = <Valor do ICMS, decimal(12,4),>
      ,[Alíquota do IPI] = <Alíquota do IPI, decimal(8,4),>
      ,[Alíquota do ICMS] = <Alíquota do ICMS, decimal(5,2),>
      ,[Percentual da Redução] = <Percentual da Redução, decimal(6,2),>
      ,[Diferido] = <Diferido, bit,>
      ,[Valor da Base de Cálculo] = <Valor da Base de Cálculo, decimal(11,2),>
      ,[Valor do PIS] = <Valor do PIS, decimal(11,4),>
      ,[Valor do Cofins] = <Valor do Cofins, decimal(11,4),>
      ,[IVA] = <IVA, decimal(8,4),>
      ,[Base de Cálculo ST] = <Base de Cálculo ST, decimal(11,2),>
      ,[Valor ICMS ST] = <Valor ICMS ST, decimal(11,2),>
      ,[CFOP] = <CFOP, smallint,>
      ,[CST] = <CST, smallint,>
      ,[Alíquota do ICMS ST] = <Alíquota do ICMS ST, decimal(5,2),>
      ,[Base de Cálculo da Importação] = <Base de Cálculo da Importação, decimal(11,2),>
      ,[Valor das Despesas Aduaneiras] = <Valor das Despesas Aduaneiras, decimal(11,2),>
      ,[Valor do Imposto de Importação] = <Valor do Imposto de Importação, decimal(11,2),>
      ,[Valor do IOF] = <Valor do IOF, decimal(11,2),>
      ,[Valor do Tributo] = <Valor do Tributo, decimal(11,2),>
      ,[Valor do Desconto] = <Valor do Desconto, decimal(11,2),>
      ,[Valor do Frete] = <Valor do Frete, decimal(12,4),>
      ,[Bc pis] = <Bc pis, decimal(9,2),>
      ,[Bc cofins] = <Bc cofins, decimal(9,2),>
      ,[Aliq do pis] = <Aliq do pis, decimal(5,2),>
      ,[Aliq do cofins] = <Aliq do cofins, decimal(5,2),>
 WHERE <Search Conditions,,>
GO


USE [IRRIGACAO]
GO

UPDATE [dbo].[Conjuntos da Nota Fiscal]
   SET [Seqüência da Nota Fiscal] = <Seqüência da Nota Fiscal, int,>
      ,[Seqüência do Conjunto] = <Seqüência do Conjunto, int,>
      ,[Quantidade] = <Quantidade, decimal(11,4),>
      ,[Valor Unitário] = <Valor Unitário, decimal(12,4),>
      ,[Valor Total] = <Valor Total, decimal(12,4),>
      ,[Valor do IPI] = <Valor do IPI, decimal(12,4),>
      ,[Valor do ICMS] = <Valor do ICMS, decimal(12,4),>
      ,[Alíquota do IPI] = <Alíquota do IPI, decimal(8,4),>
      ,[Alíquota do ICMS] = <Alíquota do ICMS, decimal(5,2),>
      ,[Percentual da Redução] = <Percentual da Redução, decimal(6,2),>
      ,[Diferido] = <Diferido, bit,>
      ,[Valor da Base de Cálculo] = <Valor da Base de Cálculo, decimal(11,2),>
      ,[Valor do PIS] = <Valor do PIS, decimal(11,4),>
      ,[Valor do Cofins] = <Valor do Cofins, decimal(11,4),>
      ,[IVA] = <IVA, decimal(8,4),>
      ,[Base de Cálculo ST] = <Base de Cálculo ST, decimal(11,2),>
      ,[Valor ICMS ST] = <Valor ICMS ST, decimal(11,2),>
      ,[CFOP] = <CFOP, smallint,>
      ,[CST] = <CST, smallint,>
      ,[Alíquota do ICMS ST] = <Alíquota do ICMS ST, decimal(5,2),>
      ,[Valor do Tributo] = <Valor do Tributo, decimal(11,2),>
      ,[Valor do Desconto] = <Valor do Desconto, decimal(11,2),>
      ,[Valor do Frete] = <Valor do Frete, decimal(12,4),>
      ,[Bc pis] = <Bc pis, decimal(9,2),>
      ,[Aliq do pis] = <Aliq do pis, decimal(5,2),>
      ,[Bc cofins] = <Bc cofins, decimal(9,2),>
      ,[Aliq do cofins] = <Aliq do cofins, decimal(5,2),>
 WHERE <Search Conditions,,>
GO


USE [IRRIGACAO]
GO

UPDATE [dbo].[Peças da Nota Fiscal]
   SET [Seqüência da Nota Fiscal] = <Seqüência da Nota Fiscal, int,>
      ,[Seqüência do Produto] = <Seqüência do Produto, int,>
      ,[Quantidade] = <Quantidade, decimal(11,4),>
      ,[Valor Unitário] = <Valor Unitário, decimal(12,4),>
      ,[Valor Total] = <Valor Total, decimal(12,4),>
      ,[Valor do IPI] = <Valor do IPI, decimal(12,4),>
      ,[Valor do ICMS] = <Valor do ICMS, decimal(12,4),>
      ,[Alíquota do IPI] = <Alíquota do IPI, decimal(8,4),>
      ,[Alíquota do ICMS] = <Alíquota do ICMS, decimal(5,2),>
      ,[Percentual da Redução] = <Percentual da Redução, decimal(6,2),>
      ,[Diferido] = <Diferido, bit,>
      ,[Valor da Base de Cálculo] = <Valor da Base de Cálculo, decimal(11,2),>
      ,[Valor do PIS] = <Valor do PIS, decimal(11,4),>
      ,[Valor do Cofins] = <Valor do Cofins, decimal(11,4),>
      ,[IVA] = <IVA, decimal(8,4),>
      ,[Base de Cálculo ST] = <Base de Cálculo ST, decimal(11,2),>
      ,[Valor ICMS ST] = <Valor ICMS ST, decimal(11,2),>
      ,[CFOP] = <CFOP, smallint,>
      ,[CST] = <CST, smallint,>
      ,[Alíquota do ICMS ST] = <Alíquota do ICMS ST, decimal(5,2),>
      ,[Valor do Tributo] = <Valor do Tributo, decimal(11,2),>
      ,[Valor do Desconto] = <Valor do Desconto, decimal(11,2),>
      ,[Valor do Frete] = <Valor do Frete, decimal(12,4),>
      ,[Bc pis] = <Bc pis, decimal(9,2),>
      ,[Aliq do pis] = <Aliq do pis, decimal(5,2),>
      ,[Bc cofins] = <Bc cofins, decimal(9,2),>
      ,[Aliq do cofins] = <Aliq do cofins, decimal(5,2),>
 WHERE <Search Conditions,,>
GO


