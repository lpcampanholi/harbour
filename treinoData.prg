set epoch to 1940
set date to british

clear

dHoje       := Date()
nAno        := Year(dHoje)
nMes        := Month(dHoje)
nDia        := Day(dHoje)
nDiaSemana  := DoW(dHoje)

// @ 01,01 say "MARINGA, 29 DE OUTUBRO DE 2024"

@ 01,01 say dHoje
@ 02,01 say nAno
@ 03,01 say nMes
@ 04,01 say nDia
@ 05,01 say nDiaSemana
