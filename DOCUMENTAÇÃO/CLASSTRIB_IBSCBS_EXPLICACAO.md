# ClassTrib e Tributação IBS/CBS - Guia Completo

## Índice
1. [O que é ClassTrib?](#o-que-é-classtrib)
2. [O que são IBS e CBS?](#o-que-são-ibs-e-cbs)
3. [Como funciona a tributação?](#como-funciona-a-tributação)
4. [Exemplo prático de cálculo](#exemplo-prático-de-cálculo)
5. [Diferença do ICMS antigo](#diferença-do-icms-antigo)
6. [Fluxo no sistema](#fluxo-no-sistema)
7. [Estrutura da tabela ClassTrib](#estrutura-da-tabela-classtrib)
8. [Campos importantes](#campos-importantes)
9. [Integração com API SVRS](#integração-com-api-svrs)

---

## O que é ClassTrib?

O **ClassTrib** (Classificação Tributária) é uma tabela **nacional** mantida pela Receita Federal que define os **percentuais de redução** aplicáveis ao IBS e CBS para diferentes tipos de produtos e serviços.

### Em termos simples:
> **ClassTrib = Tabela de descontos fiscais nacionais**

Cada código ClassTrib define:
- Qual o **CST** (Código de Situação Tributária)
- Quanto de **redução no IBS** o produto tem (0% a 100%)
- Quanto de **redução no CBS** o produto tem (0% a 100%)
- Se é **válido para NFe**
- Qual a **legislação** que ampara o benefício

---

## O que são IBS e CBS?

São os novos tributos criados pela **Reforma Tributária (Lei Complementar 214/2025)**:

| Tributo | Nome Completo | Esfera | Substitui |
|---------|---------------|--------|-----------|
| **IBS** | Imposto sobre Bens e Serviços | Estadual/Municipal | ICMS + ISS |
| **CBS** | Contribuição sobre Bens e Serviços | Federal | PIS + COFINS |

### Alíquotas de Transição (2026):
| Tributo | Alíquota |
|---------|----------|
| IBS (UF) | 0,1% |
| IBS (Municipal) | 0% |
| CBS | 0,9% |
| **Total** | **1,0%** |

> ⚠️ **Importante:** Estas são alíquotas de transição. As alíquotas definitivas serão maiores quando a reforma estiver 100% implementada.

---

## Como funciona a tributação?

### Princípio fundamental:
**IBS e CBS são tributos NACIONAIS com alíquotas UNIFORMES em todo o Brasil.**

Diferente do ICMS (que varia por estado), o IBS/CBS usa a mesma alíquota independente de:
- Estado de origem
- Estado de destino
- Tipo de operação (interna/interestadual)

### O que varia é a REDUÇÃO:
O ClassTrib define reduções que se aplicam **igualmente em todo território nacional**.

### Fórmula de cálculo:
```
Alíquota Efetiva = Alíquota Base × (1 - Percentual de Redução)
```

### Exemplo:
```
Alíquota Base IBS: 0,1%
Redução ClassTrib: 60%
Alíquota Efetiva: 0,1% × (1 - 0,60) = 0,04%
```

---

## Exemplo Prático de Cálculo

### Cenário:
- **Produto:** Tubo de aço para uso agrícola
- **NCM:** 73071920
- **ClassTrib:** 200038
- **CST:** 200 (Alíquota reduzida)
- **Redução IBS:** 60%
- **Redução CBS:** 60%
- **Valor do Item:** R$ 1.000,00

### Passo 1: Alíquotas Base
| Tributo | Alíquota Base |
|---------|---------------|
| IBS | 0,1% |
| CBS | 0,9% |

### Passo 2: Aplicar Redução de 60%
| Tributo | Cálculo | Alíquota Efetiva |
|---------|---------|------------------|
| IBS | 0,1% × (1 - 0,60) | **0,04%** |
| CBS | 0,9% × (1 - 0,60) | **0,36%** |

### Passo 3: Calcular Valores
| Tributo | Cálculo | Valor |
|---------|---------|-------|
| IBS | R$ 1.000 × 0,04% | **R$ 0,40** |
| CBS | R$ 1.000 × 0,36% | **R$ 3,60** |
| **Total** | | **R$ 4,00** |

### Comparativo: Com vs Sem Redução
| Situação | IBS | CBS | Total | Economia |
|----------|-----|-----|-------|----------|
| Sem redução | R$ 1,00 | R$ 9,00 | R$ 10,00 | - |
| Com redução 60% | R$ 0,40 | R$ 3,60 | R$ 4,00 | **R$ 6,00** |

---

## Diferença do ICMS Antigo

| Aspecto | ICMS (antigo) | IBS/CBS (novo) |
|---------|---------------|----------------|
| **Alíquota** | Varia por estado (7%, 12%, 18%, etc.) | **Nacional fixa** |
| **Benefício fiscal** | Cada estado decide | **ClassTrib nacional** |
| **Tabela de tributação** | Cada UF tem a sua | **Uma única (SVRS/Receita)** |
| **Guerra fiscal** | Estados competem com incentivos | **Não existe** |
| **Complexidade** | Alta (27 legislações) | **Baixa (1 legislação)** |

### Exemplo de venda interestadual:

**ICMS (sistema antigo):**
```
Venda SP → MG: alíquota 12%
Venda SP → RS: alíquota 12%
Venda SP → BA: alíquota 7%
Venda SP → SP: alíquota 18%
```

**IBS/CBS (sistema novo):**
```
Venda SP → MG: alíquota 0,1% + 0,9% = 1%
Venda SP → RS: alíquota 0,1% + 0,9% = 1%
Venda SP → BA: alíquota 0,1% + 0,9% = 1%
Venda SP → SP: alíquota 0,1% + 0,9% = 1%
```
> A alíquota é sempre a mesma! Apenas o destino do repasse do IBS muda.

---

## Fluxo no Sistema

```
┌─────────────────────────────────────────────────────────────────┐
│                        CADASTRO                                  │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ┌──────────┐    ┌─────────────────────┐    ┌──────────────┐   │
│  │ Produto  │───▶│ Classificação Fiscal│───▶│  ClassTrib   │   │
│  │          │    │       (NCM)         │    │              │   │
│  └──────────┘    └─────────────────────┘    └──────────────┘   │
│       │                    │                       │            │
│       │                    │                       │            │
│  Seq. Produto      Seq. Classificação        ClassTribId       │
│                                                    │            │
│                                              ┌─────▼─────┐      │
│                                              │ Reduções  │      │
│                                              │ IBS: 60%  │      │
│                                              │ CBS: 60%  │      │
│                                              └───────────┘      │
└─────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────┐
│                      NOTA FISCAL                                 │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  1. Busca Produto                                               │
│          ↓                                                       │
│  2. Obtém Classificação Fiscal (NCM)                            │
│          ↓                                                       │
│  3. Obtém ClassTribId da Classificação                          │
│          ↓                                                       │
│  4. Busca reduções na tabela ClassTrib                          │
│          ↓                                                       │
│  5. Calcula IBS = Valor × 0,1% × (1 - ReducaoIBS)              │
│  6. Calcula CBS = Valor × 0,9% × (1 - ReducaoCBS)              │
│          ↓                                                       │
│  7. Grava valores no banco                                      │
│  8. Gera XML com cClassTrib                                     │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## Estrutura da Tabela ClassTrib

### DDL (SQL Server):
```sql
CREATE TABLE [ClassTrib] (
    [Id] INT PRIMARY KEY IDENTITY(1,1),
    [CodigoClassTrib] NVARCHAR(6) NOT NULL UNIQUE,
    [CodigoSituacaoTributaria] NVARCHAR(3) NOT NULL,
    [DescricaoSituacaoTributaria] NVARCHAR(200),
    [DescricaoClassTrib] NVARCHAR(MAX) NOT NULL,
    [PercentualReducaoIBS] DECIMAL(8,5),
    [PercentualReducaoCBS] DECIMAL(8,5),
    [TipoAliquota] NVARCHAR(50),
    [ValidoParaNFe] BIT,
    [TributacaoRegular] BIT,
    [CreditoPresumidoOperacoes] BIT,
    [EstornoCredito] BIT,
    [AnexoLegislacao] INT,
    [LinkLegislacao] NVARCHAR(MAX),
    [Ativo] BIT DEFAULT 1,
    [DataCriacao] DATETIME DEFAULT GETDATE(),
    [DataAtualizacao] DATETIME
);
```

### Vínculo com Classificação Fiscal:
```sql
ALTER TABLE [Classificação Fiscal] 
ADD ClassTribId INT FOREIGN KEY REFERENCES ClassTrib(Id);
```

### Consulta para obter reduções de um produto:
```sql
SELECT 
    p.[Descrição do Produto],
    cf.NCM,
    ct.CodigoClassTrib,
    ct.CodigoSituacaoTributaria AS CST,
    ct.PercentualReducaoIBS,
    ct.PercentualReducaoCBS,
    ct.ValidoParaNFe
FROM Produtos p
INNER JOIN [Classificação Fiscal] cf 
    ON p.[Seqüência da Classificação] = cf.[Seqüência da Classificação]
LEFT JOIN ClassTrib ct 
    ON cf.ClassTribId = ct.Id
WHERE p.[Seqüência do Produto] = @SeqProduto;
```

---

## Campos Importantes

### CST (Código de Situação Tributária):
| CST | Descrição | Redução Típica |
|-----|-----------|----------------|
| **000** | Tributação integral | 0% |
| **200** | Alíquota reduzida | 30% a 60% |
| **300** | Isento | 100% |
| **400** | Não tributado | 100% |
| **500** | Suspensão | 100% |
| **900** | Outros | Variável |

### Tipo de Alíquota:
- **Padrão:** Usa alíquota nacional padrão
- **Fixa:** Valor fixo por unidade
- **Uniforme Nacional:** Alíquota específica definida em lei

### ValidoParaNFe:
- **true:** Pode ser usado em Nota Fiscal Eletrônica
- **false:** Uso restrito (consultas, relatórios, etc.)

---

## Integração com API SVRS

A tabela ClassTrib é sincronizada com a API da Receita Federal (SVRS - Secretaria Virtual do RS).

### Endpoint de sincronização:
```
POST /api/classtrib/sync
```

### Frequência recomendada:
- Sincronização diária ou semanal
- Sempre antes de períodos de fechamento fiscal

### Fluxo de atualização:
```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   Backend   │────▶│  API SVRS   │────▶│  ClassTrib  │
│   .NET      │     │  (Receita)  │     │   (Local)   │
└─────────────┘     └─────────────┘     └─────────────┘
```

---

## Resumo Final

| Conceito | Definição |
|----------|-----------|
| **ClassTrib** | Código que define quanto de redução o produto tem no IBS/CBS |
| **IBS** | Imposto sobre Bens e Serviços (substitui ICMS+ISS) |
| **CBS** | Contribuição sobre Bens e Serviços (substitui PIS+COFINS) |
| **CST** | Código que indica a situação tributária (integral, reduzida, isenta) |
| **Redução** | Percentual de desconto sobre a alíquota base |

### Analogia:
- **Alíquota base** = Preço cheio
- **ClassTrib** = Cupom de desconto
- **Alíquota efetiva** = Preço final com desconto

---

## Referências

- Lei Complementar nº 214/2025 (Reforma Tributária)
- Manual de Orientação do Contribuinte - NFe 5.0
- Portal SVRS - Receita Federal
- Documentação API ClassTrib

---

*Documento criado em: 26/11/2025*  
*Sistema: Irrigação Penápolis*
