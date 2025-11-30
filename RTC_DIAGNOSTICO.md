# Diagnóstico RTC (FlexDocs 2G v5.00n x ACBr)

## ✅ CAUSA RAIZ IDENTIFICADA E CORRIGIDA!

**Data: 30/11/2025 - Atualização mais recente**

### Problema Principal: Formato das Alíquotas (pIBSUF, pIBSMun, pCBS)
O XML estava sendo gerado com **2 casas decimais** nas alíquotas, mas o schema RTC exige **4 casas decimais**:

```xml
<!-- ANTES (errado - 2 casas decimais): -->
<pIBSUF>0.10</pIBSUF>
<pIBSMun>0.00</pIBSMun>
<pCBS>0.90</pCBS>

<!-- DEPOIS (correto - 4 casas decimais): -->
<pIBSUF>0.1000</pIBSUF>
<pIBSMun>0.0000</pIBSMun>
<pCBS>0.9000</pCBS>
```

### Correção Aplicada
Substituímos as chamadas à DLL FlexDocs por geração manual do XML com formatação correta:

```vb
' ANTES (usava DLL que formatava com 2 casas):
gIBSUF_xml = objNFeUtil.gIBSUF(ibscbs_pIBSUF, 0, 0, 0, 0, 0, ibscbs_vIBSUF)
gIBSMun_xml = objNFeUtil.gIBSMun(ibscbs_pIBSMun, 0, 0, 0, 0, 0, ibscbs_vIBSMun)
gCBS_xml = objNFeUtil.gCBS(ibscbs_pCBS, 0, 0, 0, 0, 0, ibscbs_vCBS)

' DEPOIS (geração manual com 4 casas decimais):
gIBSUF_xml = "<gIBSUF><pIBSUF>" & Format(ibscbs_pIBSUF, "0.0000") & "</pIBSUF><vIBSUF>" & Format(vIBSUF, "0.00") & "</vIBSUF></gIBSUF>"
gIBSMun_xml = "<gIBSMun><pIBSMun>" & Format(ibscbs_pIBSMun, "0.0000") & "</pIBSMun><vIBSMun>" & Format(vIBSMun, "0.00") & "</vIBSMun></gIBSMun>"
gCBS_xml = "<gCBS><pCBS>" & Format(ibscbs_pCBS, "0.0000") & "</pCBS><vCBS>" & Format(vCBS, "0.00") & "</vCBS></gCBS>"
```

### Arquivos Modificados
- **NOTAFISC.FRM linhas ~6839-6843**: Bloco `MontaIBSCBS` (fluxo normal)
- **NOTAFISC.FRM linhas ~11167-11171**: Bloco `OcultaValor:` (notas com "Ocultar Valor Unitário")

---

## Correções Anteriores (também aplicadas)

### Problema 1: `gIBSMun` não era gerado quando zerado
O schema RTC exige gIBSMun sempre presente, mesmo com valores zero.

### Problema 2: CST e cClassTrib com formato inválido
```vb
' ANTES (errado):
ibscbs_CST = "90"           ' <-- 2 dígitos, schema exige 3
ibscbs_cClassTrib = ""      ' <-- vazio, schema exige 6 dígitos

' DEPOIS (correto):
ibscbs_CST = "000"          ' <-- 3 dígitos com padding
ibscbs_cClassTrib = "000000" ' <-- 6 dígitos com padding
```

### Correções Aplicadas (30/11/2025)
1. **Linha ~11165**: `gIBSMun` agora é SEMPRE gerado (mesmo com valores zero)
2. **Linhas ~11139-11150**: CST usa default "000" (3 dígitos) e cClassTrib usa default "000000" (6 dígitos) com padding automático

---

## Fontes analisadas
- XML gerado com erro: `xml_GERADO_ERRO.md`
- XML autorizado RTC (Sefaz): `XML EXEMPLO RTC.TXT`
- Código: `IRRIG/NOTAFISC.FRM` (geração do XML e chamada da DLL)
- Esquemas ACBr atualizados: `ACBrLibNFe-Windows-1.4.7.411/dep/Schemas/NFe/leiauteNFe_v4.00.xsd`
- Release notes FlexDocs: `2Gv5.00n/alteracao.txt` (funções identificadorRTCv130, IBSCBSv130, impostoRTC)

## FlexDocs x ACBr (suporte RTC)
- Ambos possuem schema com os novos grupos (cMunFGIBS, IS, IBSCBS, vItem) – vide `leiauteNFe_v4.00.xsd` linhas 127‑138 (cMunFGIBS), 5080‑5089 (IS/IBSCBS), 5188‑5192 (vItem).
- TCST exige **3 dígitos** (`\d{3}`) e `cClassTrib` exige **6 dígitos** (`\d{6}`) em `DFeTiposBasicos_v1.00.xsd` (FlexDocs e ACBr). Ex.: XML autorizado usa `CST=000` e `cClassTrib=000001`.
- FlexDocs fornece builders específicos: `IS(...)`, `IBSCBSv130(...)`, `detalheRTC(..., vItem, ...)`, `impostoRTC(..., Grupo_IS, Grupo_IBSCBS)`; não há limitação de biblioteca para RTC se os parâmetros forem válidos.

## Diferenças XML gerado x XML autorizado
| Tag | Autorizado (ACBr) | Gerado (FlexDocs) | Problema |
| --- | --- | --- | --- |
| `ide/cMunFGIBS` | **ausente** | `3537305` (com `indPres=9`) | Biblioteca preenche default porque `ide_cMunFGIBS` chegou vazio; opcional, mas aparece mesmo fora da condição (indPres=5 + sem endereço). |
| `imposto/IS` | **ausente** | `<IS><CSTIS>90</CSTIS><cClassTribIS/>…</IS>` | Valores fora do padrão (`CSTIS` precisa de 3 dígitos; `cClassTribIS` não pode ser vazio). Grupo foi inserido mesmo sem você solicitá-lo. |
| `imposto/IBSCBS` | `<CST>000</CST><cClassTrib>000001</cClassTrib>…` | `<CST>90</CST><cClassTrib/>…` | `CST` com 2 dígitos e `cClassTrib` vazio violam o schema (`\d{3}` e `\d{6}`). |
| `det/vItem` | `22.90` | `1000.00` | Campo é permitido na RTC; não causa rejeição, apenas foi citado no erro por ser novidade. |

## Origem no seu código (`IRRIG/NOTAFISC.FRM`)
- **IBSCBS vazio/2 dígitos**: `MontaIBSCBS` usa defaults `cstIBSCBS_Param="90"` e `cClassTrib_Param=""` (linhas ~6784‑6862). Quando `CalculaImposto` (cases 18/19) não retorna valor, cai nesses defaults → `<CST>90</CST><cClassTrib/>`.
- **CST IBSCBS com fallback “90”**: em `GeraNFe` o `strCST_IBSCBS_Item` assume `"90"` se `CalculaImposto(...,19,...)` vier vazio (`NOTAFISC.FRM` linhas ~10696‑10700).
- **cClassTrib vazio**: `strClassTrib_Item` fica `""` se `CalculaImposto(...,18,...)` não retornar (`NOTAFISC.FRM` linhas ~10688‑10693).
- **IS gerado sem parâmetros**: `det_IS` é enviado vazio para `impostoRTC` (linha ~10733), mas a DLL insere um grupo IS com default `90/blank`, que não passa no schema (`TCST` = 3 dígitos, `cClassTribIS` = 6 dígitos).
- **cMunFGIBS**: você zera quando `indPres<>5` (linha ~10126), mas a DLL preenche com `cMunFG` mesmo assim, produzindo a tag opcional em situações em que você não pediu.

## Diagnóstico
- A DLL FlexDocs 2G v5.00n tem suporte RTC, mas está recebendo parâmetros inválidos/omissos: `CST` com 2 dígitos, `cClassTrib` vazio e `IS` sem dados. O schema (o mesmo usado pelo ACBr) rejeita esses valores.  
- O erro não é da SEFAZ: o XML autorizado e o XSD do ACBr aceitam RTC; o seu XML não cumpre as regras de formatação dos novos grupos.

## Como corrigir no `NotaFisc.frm`
1) **Preencher cClassTrib e CST com formato RTC**  
   - Garanta que `CalculaImposto` cases **18** (cClassTrib) e **19** (CST IBS/CBS) retornem valores de 6 e 3 dígitos conforme cadastro `ClassTrib` (ver docs em `DOCUMENTAÇÃO/IMPLEMENTACAO_CLASSTRIB.md` e `CLASSTRIB_IBSCBS_EXPLICACAO.md`).  
   - Se precisar de fallback, use algo válido: `cClassTrib="000000"` e `CST="000"` (ou outro CST RTC correto), nunca `"90"` de 2 dígitos.

2) **Gerar IBSCBS com dados válidos**  
   - Passe os valores corretos para `MontaIBSCBS` (`cClassTrib_Param`, `cstIBSCBS_Param`).  
   - Ajuste o default de `MontaIBSCBS` de `"90"`/`""` para formatos válidos ou bloqueie a emissão quando faltar ClassTrib/CST.

3) **IS (Imposto Seletivo)**  
   - Se não usar IS, force o grupo a ficar vazio **de verdade**; se a DLL continuar gerando, mande um grupo zerado válido:  
     ```vb
     det_IS = objNFeUtil.IS("000", "000000", 0, 0, 0, "", 0, 0)
     ```  
     Isso atende ao pattern (`TCST` 3 dígitos, `cClassTribIS` 6 dígitos) e evita rejeição.

4) **cMunFGIBS**  
   - Só envie quando `indPres=5` e sem endereço de entrega/destino (condição do XSD). Hoje a DLL está preenchendo default; se persistir, peça correção à FlexDocs ou sobrescreva a string após a chamada de `identificadorRTCv130`.

5) **Validar antes de transmitir**  
   - Rode validação local com o XSD do ACBr (`leiauteNFe_v4.00.xsd` + `DFeTiposBasicos_v1.00.xsd`) para garantir: `CST` 3 dígitos, `cClassTrib` 6 dígitos, grupo IS ausente ou válido.

## Conclusão
- **Problema principal está no `NotaFisc.frm`**: os parâmetros RTC enviados à FlexDocs (CST e ClassTrib) estão vazios/fora do padrão, e o grupo IS é deixado em branco. A DLL então insere defaults inválidos, gerando rejeição de schema.  
- **FlexDocs**: tem suporte RTC; o comportamento de inserir IS/cMunFGIBS por default pode ser ajustado via atualização, mas já é possível emitir RTC corrigindo os parâmetros acima.
