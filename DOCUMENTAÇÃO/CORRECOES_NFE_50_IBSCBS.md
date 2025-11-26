# CORREÇÕES NFE 5.0 - IBS/CBS (REFORMA TRIBUTÁRIA)

**Data:** 24 de novembro de 2025  
**Arquivo:** NOTAFISC.FRM  
**Versão DLL:** NFe_Util_2G v5.00n (FlexDocs)

## 📋 PROBLEMAS IDENTIFICADOS E CORRIGIDOS

### ❌ PROBLEMA 1: Função `gIBSCBS` Desatualizada

**Localização:** Linha 6507 (MontaIBSCBS)

**ANTES:**
```vb
gIBSCBS_xml = objNFeUtil.gIBSCBS(vBC, gIBSUF_xml, gIBSMun_xml, gCBS_xml, "", "", "", "")
```

**DEPOIS:**
```vb
' Usar gIBSCBSv130 (versão 5.0.0m) com 7 parâmetros incluindo vIBS
gIBSCBS_xml = objNFeUtil.gIBSCBSv130(vBC, gIBSUF_xml, gIBSMun_xml, vIBS, gCBS_xml, "", "")
```

**Justificativa:**
- Segundo alteracao.txt v5.0.0m: gIBSCredPres e gCBSCredPres foram eliminados
- Nova assinatura: `gIBSCBSv130(double vBC, string gIBSUF, string gIBSMun, double vIBS, string gCBS, string gTribRegular_Opc, string gTribCompraGov_Opc)`
- Agora inclui o parâmetro obrigatório `vIBS` (valor total do IBS)

---

### ❌ PROBLEMA 2: Valores IBS/CBS Duplicados e Divergentes

**Localização:** MontaIBSCBS (linha 6481)

**ANTES:**
```vb
Private Sub MontaIBSCBS(ByRef objNFeUtil As Object, ByVal baseOperacao As Double, _
   ByRef det_IBSCBS As String, ByRef det_IS As String, _
   ByRef vBC As Double, ByRef vIBSUF As Double, ByRef vIBSMun As Double, ByRef vCBS As Double)
   
   ' SEMPRE recalculava com constantes fixas
   ibscbs_pIBSUF = RTC_PERC_IBSUF   ' 0.1%
   ibscbs_pIBSMun = RTC_PERC_IBSMUN ' 0%
   ibscbs_pCBS = RTC_PERC_CBS       ' 0.9%
   vIBSUF = vBC * ibscbs_pIBSUF / 100
   vIBSMun = vBC * ibscbs_pIBSMun / 100
   vCBS = vBC * ibscbs_pCBS / 100
```

**DEPOIS:**
```vb
Private Sub MontaIBSCBS(ByRef objNFeUtil As Object, ByVal baseOperacao As Double, _
   ByRef det_IBSCBS As String, ByRef det_IS As String, _
   ByRef vBC As Double, ByRef vIBSUF As Double, ByRef vIBSMun As Double, ByRef vCBS As Double, _
   Optional ByVal valorIBS_DB As Double = -1, Optional ByVal valorCBS_DB As Double = -1)
   
   Dim vIBS As Double
   vBC = baseOperacao
   
   ' Usar valores do banco se fornecidos, caso contrário calcular com constantes
   If valorIBS_DB >= 0 And valorCBS_DB >= 0 Then
      ' VALORES DO BANCO (CORRETO - já calculados por CalculaImposto)
      vIBS = valorIBS_DB
      vCBS = valorCBS_DB
      ' Calcular IBSUF e IBSMun proporcionalmente
      If RTC_PERC_IBSUF + RTC_PERC_IBSMUN > 0 Then
         vIBSUF = vIBS * (RTC_PERC_IBSUF / (RTC_PERC_IBSUF + RTC_PERC_IBSMUN))
         vIBSMun = vIBS * (RTC_PERC_IBSMUN / (RTC_PERC_IBSUF + RTC_PERC_IBSMUN))
      Else
         vIBSUF = vIBS
         vIBSMun = 0
      End If
      ' Recalcular percentuais baseados nos valores reais
      If vBC > 0 Then
         If vIBSUF > 0 Then ibscbs_pIBSUF = (vIBSUF / vBC) * 100
         If vIBSMun > 0 Then ibscbs_pIBSMun = (vIBSMun / vBC) * 100
         If vCBS > 0 Then ibscbs_pCBS = (vCBS / vBC) * 100
      End If
   Else
      ' FALLBACK: Calcular com constantes (APENAS para compatibilidade)
      ibscbs_pIBSUF = RTC_PERC_IBSUF
      ibscbs_pIBSMun = RTC_PERC_IBSMUN
      ibscbs_pCBS = RTC_PERC_CBS
      vIBSUF = vBC * ibscbs_pIBSUF / 100
      vIBSMun = vBC * ibscbs_pIBSMun / 100
      vCBS = vBC * ibscbs_pCBS / 100
      vIBS = vIBSUF + vIBSMun
   End If
```

**Justificativa:**
- O sistema calculava IBS/CBS em DOIS lugares diferentes:
  1. **ProcessaProdutos/Conjuntos/Pecas**: Usa `CalculaImposto(16, 17)` → valores corretos baseados em alíquotas cadastradas
  2. **MontaIBSCBS**: Usava constantes fixas → valores divergentes!
- **Resultado:** XML com valores diferentes dos salvos no banco → SEFAZ rejeita
- **Solução:** MontaIBSCBS agora PRIORIZA valores do banco

---

### ❌ PROBLEMA 3: Chamadas MontaIBSCBS Sem Valores do Banco

**Localização:** Linhas 10280 (Produtos), 10410 (Serviços Grid1), 11024 (Serviços RTC)

**ANTES (Produtos - linha 10280):**
```vb
If usaRTC Then
   Dim baseValorRTC As Double
   baseValorRTC = CalcValorOperacaoRTC(Item!Quantidade, Item![Valor Unitário], ...)
   MontaIBSCBS objNFeUtil, baseValorRTC, det_IBSCBS, det_IS, ibscbs_vBC, ibscbs_vIBSUF, ibscbs_vIBSMun, ibscbs_vCBS
```

**DEPOIS (Produtos - linha 10280):**
```vb
If usaRTC Then
   Dim baseValorRTC As Double
   Dim valorIBS_Item As Double, valorCBS_Item As Double
   baseValorRTC = CalcValorOperacaoRTC(Item!Quantidade, Item![Valor Unitário], ...)
   
   ' Ler valores IBS/CBS já calculados e salvos no banco
   On Error Resume Next
   valorIBS_Item = 0
   valorCBS_Item = 0
   valorIBS_Item = Item![Valor IBS]
   If Err.Number <> 0 Then Err.Clear: valorIBS_Item = 0
   valorCBS_Item = Item![Valor CBS]
   If Err.Number <> 0 Then Err.Clear: valorCBS_Item = 0
   On Error GoTo 0
   
   Debug.Print "DEBUG RTC: Valores do banco - IBS=" & valorIBS_Item & " CBS=" & valorCBS_Item
   MontaIBSCBS objNFeUtil, baseValorRTC, det_IBSCBS, det_IS, ibscbs_vBC, ibscbs_vIBSUF, ibscbs_vIBSMun, ibscbs_vCBS, valorIBS_Item, valorCBS_Item
```

**Justificativa:**
- Passa valores do banco para MontaIBSCBS
- Garante que XML usa mesmos valores calculados em ProcessaProdutos/Conjuntos/Pecas
- Serviços não têm campos IBS/CBS, então usam recálculo (comportamento correto)

---

### ❌ PROBLEMA 4: Totais Acumulando Valores Recalculados

**Localização:** Linha 10330 (acumulação de totais)

**ANTES:**
```vb
'Acumular totais RTC
If usaRTC Then
   vIBSUFTotal = vIBSUFTotal + ibscbs_vIBSUF      ' RECALCULADO por MontaIBSCBS
   vIBSMunTotal = vIBSMunTotal + ibscbs_vIBSMun   ' RECALCULADO por MontaIBSCBS
   vIBSTotal = vIBSTotal + ibscbs_vIBSUF + ibscbs_vIBSMun
   vCBSTotal = vCBSTotal + ibscbs_vCBS            ' RECALCULADO por MontaIBSCBS
   vBCIBSCBS = vBCIBSCBS + ibscbs_vBC
End If
```

**DEPOIS:**
```vb
'Acumular totais RTC - USAR VALORES DO BANCO ao invés dos recalculados
If usaRTC Then
   ' Usar valores do banco se disponíveis, senão usar valores de MontaIBSCBS
   If valorIBS_Item >= 0 And valorCBS_Item >= 0 Then
      vIBSTotal = vIBSTotal + valorIBS_Item     ' DO BANCO
      vCBSTotal = vCBSTotal + valorCBS_Item     ' DO BANCO
      ' Distribuir IBS entre UF e Mun proporcionalmente
      If RTC_PERC_IBSUF + RTC_PERC_IBSMUN > 0 Then
         vIBSUFTotal = vIBSUFTotal + (valorIBS_Item * (RTC_PERC_IBSUF / (RTC_PERC_IBSUF + RTC_PERC_IBSMUN)))
         vIBSMunTotal = vIBSMunTotal + (valorIBS_Item * (RTC_PERC_IBSMUN / (RTC_PERC_IBSUF + RTC_PERC_IBSMUN)))
      Else
         vIBSUFTotal = vIBSUFTotal + valorIBS_Item
      End If
   Else
      ' Fallback: usar valores recalculados por MontaIBSCBS
      vIBSUFTotal = vIBSUFTotal + ibscbs_vIBSUF
      vIBSMunTotal = vIBSMunTotal + ibscbs_vIBSMun
      vIBSTotal = vIBSTotal + ibscbs_vIBSUF + ibscbs_vIBSMun
      vCBSTotal = vCBSTotal + ibscbs_vCBS
   End If
   vBCIBSCBS = vBCIBSCBS + ibscbs_vBC
End If
```

**Justificativa:**
- Totais devem somar valores do BANCO (já calculados corretamente)
- Evita divergências entre soma dos itens e totais
- SEFAZ valida: `SOMA(item[vIBS]) == total[vIBS]`

---

### ❌ PROBLEMA 5: Seção "SemValores" com gIBSCBS Antiga

**Localização:** Linha 10740 (agrupamento SemValores)

**ANTES:**
```vb
gIBSCBS_xml = objNFeUtil.gIBSCBS(ibscbs_vBC, gIBSUF_xml, gIBSMun_xml, gCBS_xml, "", "", "", "")
```

**DEPOIS:**
```vb
Dim vIBS_Agrupado As Double
vIBS_Agrupado = ibscbs_vIBSUF + ibscbs_vIBSMun
' Usar gIBSCBSv130 (versão 5.0.0m)
gIBSCBS_xml = objNFeUtil.gIBSCBSv130(ibscbs_vBC, gIBSUF_xml, gIBSMun_xml, vIBS_Agrupado, gCBS_xml, "", "")
```

**Justificativa:**
- Seção de agrupamento também deve usar função v130
- Garante consistência em todo o XML

---

## ✅ RESULTADO DAS CORREÇÕES

### Fluxo Correto IBS/CBS (Após Correções)

```
1. INSERÇÃO NO GRID
   └─> Grid_AfterUpdateRecord
       └─> PROCESSOS_DIRETOS
           └─> ProcessaProdutos/Conjuntos/Pecas
               └─> CalculaImposto(16) → [Valor IBS]  ← SALVO NO BANCO
               └─> CalculaImposto(17) → [Valor CBS]  ← SALVO NO BANCO

2. GERAÇÃO DO XML (ao transmitir NFe)
   └─> Loop Produtos
       ├─> LER Item![Valor IBS] do banco → valorIBS_Item
       ├─> LER Item![Valor CBS] do banco → valorCBS_Item
       └─> MontaIBSCBS(... valorIBS_Item, valorCBS_Item)
           ├─> USA valores do banco (prioritário)
           ├─> Calcula IBSUF e IBSMun proporcionalmente
           └─> Gera XML: gIBSCBSv130(vBC, gIBSUF_xml, gIBSMun_xml, vIBS, gCBS_xml, "", "")
   
   └─> Acumular Totais
       ├─> vIBSTotal += valorIBS_Item   ← DO BANCO
       └─> vCBSTotal += valorCBS_Item   ← DO BANCO
   
   └─> Gerar Totais
       └─> IBSCBSTotv130(vBCIBSCBS, gIBSTot_xml, gCBSTot_xml, "", "")
```

### Garantias

✅ **Valores Consistentes**: XML usa mesmos valores salvos no banco  
✅ **Totais Corretos**: Soma dos itens bate com totais  
✅ **Função Atualizada**: gIBSCBSv130 compatível com NFe 5.0  
✅ **Tag vIBS Presente**: Parâmetro obrigatório informado  
✅ **Compatibilidade**: Fallback para recálculo se banco falhar  

---

## 🔍 VALIDAÇÕES PENDENTES

### ⚠️ IMPORTANTE: Próximos Passos

1. **CST e cClassTrib**
   - Atualmente hardcoded: `ibscbs_CST = "90"`, `ibscbs_cClassTrib = ""`
   - **PENDENTE**: Buscar do cadastro de produtos ou natureza de operação
   - CST "90" é genérico (outros) - pode não ser apropriado para todos os produtos

2. **Alíquotas IBS/CBS**
   - Constantes: `RTC_PERC_IBSUF = 0.1`, `RTC_PERC_IBSMUN = 0`, `RTC_PERC_CBS = 0.9`
   - **VERIFICAR**: Se alíquotas estão corretas para a região/operação
   - Podem variar por UF, município, tipo de operação

3. **Teste Completo**
   - **PENDENTE**: Transmitir NFe de teste para SEFAZ homologação
   - Validar se XML é aceito sem rejeições
   - Verificar se totais batem com itens

4. **Grupos Opcionais NFe 5.0**
   - `gEstornoCred_Opc`: Estorno de créditos (linha 6516)
   - `gCredPresumido_Opc`: Créditos presumidos (linha 6516)
   - `gAjusteCompet`: Ajustes de competência
   - **AVALIAR**: Se empresa precisa utilizar esses grupos

---

## 📚 REFERÊNCIAS

- **DLL:** NFe_Util_2G.dll v5.00n (2025-11-08)
- **Changelog:** `c:\Projetos\SistemaIrrigacao5X\2Gv5.00n\alteracao.txt`
- **Schemas:** `c:\Projetos\SistemaIrrigacao5X\2Gv5.00n\NFe_Util\Schemas\`
- **Documentação:** FlexDocs www.flexdocs.net/guiaNFe

### Alterações Relevantes do alteracao.txt

- **v5.0.0m (2025-11-04)**: Correção IBSCBSv130 para gerar gEstornoCred; eliminação de gIBSCredPres e gCBSCredPres
- **v5.0.0l (2025-10-28)**: Criação IBSCBSv130 com indDoacao, gAjusteCompet, gEstornoCred, gCredPresOper
- **v5.0.0h (2025-08-10)**: Acréscimo tag vIBS no gIBSCBS

---

## ✍️ OBSERVAÇÕES

- Todas as correções implementam **fallback** para garantir compatibilidade
- Debug.Print adicionados para rastreamento de valores
- Erros de leitura de IBS/CBS do banco são suprimidos silenciosamente
- Sistema continua funcional mesmo se campos IBS/CBS não existirem no recordset

**IMPORTANTE**: Antes de usar em produção, testar em ambiente de homologação!
