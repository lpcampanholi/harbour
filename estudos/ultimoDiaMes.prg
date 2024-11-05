nAno                    := Year(dCotacao)
nMes                    := Month(dCotacao)
nProximoMes             := 0
cMes                    := Space(10)
dPrimeiroDiaProximoMes  := CtoD("")
dUltimoDiaMes           := CtoD("")

if nMes == 1
    cMes := "Janeiro"
elseif nMes == 2
    cMes := "Fevereiro"
elseif nMes == 3
    cMes := "Marco"
elseif nMes == 4
    cMes := "Abril"
elseif nMes == 5
    cMes := "Maio"
elseif nMes == 6
    cMes := "Junho"
elseif nMes == 7
    cMes := "Julho"
elseif nMes == 8
    cMes := "Agosto"
elseif nMes == 9
    cMes := "Setembro"
elseif nMes == 10
    cMes := "Outubro"
elseif nMes == 11
    cMes := "Novembro"
elseif nMes == 12
    cMes := "Dezembro"
endif

// Verifica se é Dezembro
if nMes == 12
    nProximoMes := 1
    nAno += 1
else
    nProximoMes := nMes + 1
endif

// Monta a data do último dia do mês
dPrimeiroDiaProximoMes := CtoD("01/" + StrZero(nProximoMes, 2) + "/" + AllTrim(Str(nAno)))
dUltimoDiaMes := dPrimeiroDiaProximoMes - 1

@ 01,01 say "Cotacao valida ate " + AllTrim(Str((Day(dUltimoDiaMes)))) + " de " + AllTrim(cMes) + " de " + AllTrim(Str(nAno))
