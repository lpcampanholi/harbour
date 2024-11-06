set epoch to 1940
set date to british

clear

dData := Date()
nMesData := Month(dData)
cMesData := AllTrim(Str(nMesData))

dPrimeiroDiaMes := CtoD("01/" + StrZero(Month(dData), 2) + "/" + AllTrim(Str(Year(dData))))
nDiaDaSemanaDoPrimeiroDiaDoMes := DoW(dPrimeiroDiaMes)

nDiaDoMes := 1

nLinha := 06
nColuna := nDiaDaSemanaDoPrimeiroDiaDoMes * 3

// Total de dias do mês
nTotalDiasMes := 0
if cMesData $ "1|3|5|7|8|10|12"
    nTotalDiasMes := 31
elseif cMesData $ "4|6|9|11"
    nTotalDiasMes := 30
elseif cMesData == 2
    nTotalDiasMes := 28
endif

@ 05,01 say "D  S  T  Q  Q  S  S"

do while nDiaDoMes <= nTotalDiasMes

    if nDiaDoMes == Day(dData)
        set color to "n/r"
    endif

    set color to "n/w"

    @ nLinha,nColuna say nDiaDoMes picture "99"

    if nColuna > 19
        nLinha++
        nColuna := 1
    endif
    nColuna := nColuna + 3
    nDiaDoMes++
    set color to "w/n"
enddo
