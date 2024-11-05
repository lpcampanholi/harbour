set epoch to 1940
set date to british

clear

dHoje       := Date()
nAno        := Year(dHoje)
nMes        := Month(dHoje)
nDia        := Day(dHoje)
nDiaSemana  := DoW(dHoje)
cMes        := Space(20)
cDiaSemana  := Space(20)

if nMes == 1
    cMes := "JANEIRO"
elseif nMes == 2
    cMes := "FEVEREIRO"
elseif nMes == 3
    cMes := "MARCO"
elseif nMes == 4
    cMes := "ABRIL"
elseif nMes == 5
    cMes := "MAIO"
elseif nMes == 6
    cMes := "JUNHO"
elseif nMes == 7
    cMes := "JULHO"
elseif nMes == 8
    cMes := "AGOSTO"
elseif nMes == 9
    cMes := "SETEMBRO"
elseif nMes == 10
    cMes := "OUTUBRO"
elseif nMes == 11
    cMes := "NOVEMBRO"
elseif nMes == 12
    cMes := "DEZEMBRO"
endif

if nDiaSemana == 1
    cDiaSemana := "DOMINGO"
elseif nDiaSemana == 2
    cDiaSemana := "SEGUNDA-FEIRA"
elseif nDiaSemana == 3
    cDiaSemana := "TERCA-FEIRA"
elseif nDiaSemana == 4
    cDiaSemana := "QUARTA-FEIRA"
elseif nDiaSemana == 5
    cDiaSemana := "QUINTA-FEIRA"
elseif nDiaSemana == 6
    cDiaSemana := "SEXTA-FEIRA"
elseif nDiaSemana == 7
    cDiaSEmana := "SABADO"
endif

@ 01,01 say "MARINGA, " + AllTrim(Str(nDia)) + " de " + cMes + " de " + AllTrim(Str(nAno)) + ". " + "(" + cDiaSemana + ")"
