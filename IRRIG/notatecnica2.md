# 📄 Documento Convertido de PDF

---

**📁 Arquivo Fonte:** `NT2022.002 v1.20 - Equiparação Exportação.pdf`  
**📅 Data da Conversão:** 14/11/2025 às 14:03:43  
**📄 Total de Páginas:** 7  
**🔧 Conversor:** PDF → Markdown Pro v2.0

---

## 📄 Página 1

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
Projeto Nota Fiscal 
Eletrônica 
Nota Técnica 2022.002 
Alteração em Regras de Validação 
Equiparação à exportação 
 
 
 
Versão 1.20 – Novembro 2025 
 
 


---

## 📄 Página 2

 
Sumário 
Sumário 
Controle de Versões ...................................................................................................................... 3 
Histórico de Alterações / Cronograma ........................................................................................... 3 
1. Resumo..................................................................................................................................... 4 
1.1. Alterações Introduzidas na Versão 1.10 .............................................................................. 4 
1.2. Alterações Introduzidas na Versão 1.20 .............................................................................. 4 
2. Visão Geral ............................................................................................................................... 5 
2.3 Alterações introduzidas na versão 1.10 ................................................................................ 5 
2.3.1 Atualização da documentação da regra E12-10 ................................................................ 5 
2.4 Alterações introduzidas na versão 1.20 ................................................................................ 5 
3. Regras de Validação ................................................................................................................. 6 
3.1. E. Identificação do Destinatário ........................................................................................... 6 
3.2. X. Transporte NF-e ............................................................................................................. 7 
 


---

## 📄 Página 3

Projeto 
Nota Fiscal Eletrônica 
NT 2022.002 
Página 3 / 7 
 
 
 
Controle de Versões 
 
Versão 
Publicação 
Descrição 
1.00 
Junho 2022 
Publicação da NT. 
1.10 
Agosto 2022 
Alteração na documentação da Regra E12-10 e criação de exceção na regra 
E16a-20 
1.20 
Novembro 2025 
Alteração nas RV E03a-10, E12-10, E14-10 e E16a-20 
 
 
Histórico de Alterações / Cronograma 
 
Versão 
Histórico de atualizações 
Implantação 
Teste 
Implantação 
Produção 
1.00 
Alteração em regras de validação 
25/07/2022 
15/08/2022 
1.10 
Alteração da documentação da regra de validação E12-10 Alteração da 
regra de validação E16a-20 
Até 05/08/2022 
15/08/2022 
1.20 
Alteração nas RV E03a-10, E12-10, E14-10 e E16a-20 
Até 30/11/2025 
Até 12/01/2026 


---

## 📄 Página 4

Projeto 
Nota Fiscal Eletrônica 
NT 2022.002 
Página 4 / 7 
 
 
 
1. Resumo 
 
Essa Nota Técnica divulga alteração em Regras de Validação da NF-e versão 4.0. 
O prazo previsto para a implementação das mudanças é: 
• 
Ambiente de Homologação (ambiente de teste das empresas): 25/07/2022 
• 
Ambiente de Produção: 15/08/2022 
1.1. Alterações Introduzidas na Versão 1.10 
A versão 1.10 dessa Nota Técnica traz alteração na documentação da Regra E12-10 e criação de 
exceção para a Regra E16a-20. Como são alterações documentais ou que visam diminuir a quantidade 
de rejeições e não exigirão esforço de implementação por parte das empresas, o prazo de entrada em 
produção está mantido. 
O prazo previsto para a implementação das mudanças é: 
• 
Ambiente de Homologação (ambiente de teste das empresas): até 05/08/2022 
• 
Ambiente de Produção: 15/08/2022 
 
1.2. Alterações Introduzidas na Versão 1.20 
A versão 1.20 dessa Nota Técnica traz alteração na documentação das RV E03a-10, E12-10, E14-10 
e E16a-20 para incluir o CFOP 7552 como exceção da regra. 


---

## 📄 Página 5

Projeto 
Nota Fiscal Eletrônica 
NT 2022.002 
Página 5 / 7 
 
 
 
2. Visão Geral 
Essa Nota Técnica tem o objetivo de alterar algumas regras de validação para permitir a emissão de 
NF-e nas operações de combustíveis equiparadas à exportação, tratadas no Convênio ICMS 55/2021. 
https://www.confaz.fazenda.gov.br/legislacao/convenios/2021/CV055_21 
 
Essa NT não gera maiores impactos de desenvolvimento para os contribuintes, sendo assim o prazo 
de homologação e produção está reduzido. 
2.1 Alteração da Regra de Validação X04-10 
Para permitir a emissão de operações de combustíveis equiparadas à exportação, realizadas com o 
CFOP 7667, que são operações de abastecimento presencial, sem frete (modFrete=9), foi incluída a 
exceção 4, para não exigir o preenchimento do grupo de transportador, regra X04-10. 
2.2 Alteração da Regra de Validação E03a-10, E12-10, E14-10 
Para permitir a emissão de operações de combustíveis equiparadas à exportação, realizadas com o 
CFOP 7667, aceitando nessa situação a informação de CNPJ para o destinatário, UF brasileira do 
destinatário, e código do país igual a Brasil nestas operações. 
 
2.3 Alterações introduzidas na versão 1.10 
2.3.1 Atualização da documentação da regra E12-10 
Alteração documental para corrigir uma imprecisão na chamada da Regra, que verifica se foi 
preenchido o literal ‘EX’ no campo ‘dest/UF’ quando se trata de operação com o exterior. 
2.3.2 Alteração da Regra de Validação E16a-20 
Alteração para adicionar à Regra E16a-20 a mesma exceção previamente adicionada às Regras E12- 
10 e E14-10 na versão 1.00 dessa NT. Essa alteração se fez necessária para permitir a emissão correta 
da NF-e, que seria rejeitada no caso de destinatário com inscrição estadual ativa. 
 
 
2.4 Alterações introduzidas na versão 1.20 
2.4.1 Alteração da Regra de Validação E03a-10, E12-10, E14-10 e E16a-20 
Alteração para adicionar o CFOP 7552 como exceção das regras, para atender o previsto no Convênio 
ICMS 55/2021, que trata das operações equiparadas à exportação. 
 


---

## 📄 Página 6

Projeto 
Nota Fiscal Eletrônica 
NT 2022.002 v1.10 – Equiparação à exportação 
Página 6 / 7 
 
 
 
3. Regras de Validação 
3.1. E. Identificação do Destinatário 
 
Campo-Seq 
Modelo 
Regra de Validação 
Aplic. 
Msg 
Efeito 
Descrição Erro 
E03a-10 
55 
Se Operação com Exterior (tag:idDest = 3): 
– Deve ser informada tag idEstrangeiro (conteúdo da tag pode ser nulo) 
Exceção 1: Poderá ser informada a tag: dest/CNPJ quando o país do 
destinatário for o Brasil (tag: enderDest/cPais = “1058”) e existir algum item 
com a UF de consumo do combustível igual a exterior (tag:comb/UFCons = 
“EX”) e com CFOP = “7667 - Venda de combustível ou lubrificante a 
consumidor ou usuário final”. 
Exceção 2: Regra de validação não se aplica para quando CFOP=7552 
Obrig. 
720 
Rej. 
Rejeição: Na operação com Exterior deve ser informada tag idEstrangeiro 
E12-10 
55 
Se Operação com Exterior (tag:idDest=3): 
– UF de destino diferente de “EX” 
Exceção 1: Regra não se aplica quando existir algum item com a UF de 
consumo do combustível igual a exterior (tag: comb/UFCons = “EX”) e com 
CFOP = “7667 - Venda de combustível ou lubrificante a consumidor ou 
usuário final”. 
Exceção 2: Regra de validação não se aplica para quando CFOP=7552 
Obrig. 
727 
Rej. 
Rejeição: Operação com Exterior e UF diferente de EX 
E14-10 
55 
Se operação com Exterior (tag:idDest=3): 
– Código País do destinatário = 1058 (Brasil), ou não informado 
Exceção 1: Regra não se aplica quando existir algum item com a UF de 
consumo do combustível igual a exterior (tag: comb/UFCons = “EX”) e com 
CFOP = “7667 - Venda de combustível ou lubrificante a consumidor ou 
usuário final”. 
Exceção 2: Regra de validação não se aplica para quando CFOP=7552 
Facul. 
510 
Rej. 
Rejeição: Operação com Exterior e Código País destinatário é 1058 (Brasil) 
ou não informado 
E16a-20 
55 
Se operação com Exterior (tag:idDest=3): 
– Indicação de IE Destinatário diferente "Não Contribuinte" (tag:indIEDest 
<> 9) (NT 2015.003) 
Exceção 1: Regra não se aplica quando existir algum item com a UF de 
consumo do combustível igual a exterior (tag: comb/UFCons = “EX”) e com 
CFOP = “7667 - Venda de combustível ou lubrificante a consumidor ou 
usuário final”. 
Exceção 2: Regra de validação não se aplica para quando CFOP=7552 
Obrig. 
790 
Rej. 
Rejeição: Operação com Exterior para destinatário Contribuinte de ICMS 


---

## 📄 Página 7

Projeto 
Nota Fiscal Eletrônica 
NT 2022.002 v1.10 – Equiparação à exportação 
Página 7 / 7 
 
 
 
3.2. X. Transporte NF-e 
 
Campo-Seq 
Modelo 
Regra de Validação 
Aplic. 
Msg 
Efeito 
Descrição Erro 
X04-10 
55 
Obrigatória a informação de identificação do Transportador para os CFOP de 
venda de combustível (tag: CNPJ/CPF, id:X04/X05) com esta obrigatoriedade 
na Tabela CFOP, indComb=2. 
Exceção 1: A regra de validação acima se aplica somente para as NF-e com 
Finalidade de Emissão normal (tag:finNFe=1); 
Exceção 2: A regra de validação acima se aplica somente para os Códigos de 
Produto ANP relacionados na seção 8.11 do MOC – Visão Geral, 
Exceção 3: A regra de validação acima não se aplica se for informada a UF do 
Transportador no exterior (tag:transporta/UF=”EX”, id:X10); 
Exceção 4: Regra não se aplica quando existir algum item com a UF de 
consumo do combustível igual a exterior (tag: comb/UFCons = “EX”) e com 
CFOP = “7667 - Venda de combustível ou lubrificante a consumidor ou 
usuário final”. 
Observação: Nos casos em que não houver circulação física de mercadoria 
ou em que o transportador seja estrangeiro, os dados do transportador 
poderão ser preenchidos com o CNPJ do próprio emitente do documento 
fiscal. (NT 2015.002) 
Facul. 
362 
Rej. 
Rejeição: Venda de combustível sem informação do Transportador 
 


---

**🔒 Conversão preserva caracteres especiais e acentuação**  
*Gerado automaticamente pelo Conversor PDF → Markdown Pro*
