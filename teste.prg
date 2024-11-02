set epoch to 1940
set date to british

clear

dAdmissao := CtoD("")
dDemissao := CtoD("")

nAnosTrabalhos := 0

@ 01,01 say "Data admissao: "
@ 02,01 say "Data demissao: "

@ 01,16 get dAdmissao valid !Empty(dAdmissao)
@ 02,16 get dDemissao valid !Empty(dDemissao)
read

nAnosTrabalhos := Year(dDemissao) - Year(dAdmissao)

@ 06,01 say "Anos trabalhados: "
@ 06,19 say nAnosTrabalhos
