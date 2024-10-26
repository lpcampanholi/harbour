// Luís Plinio Gabriel Campanholi dos Santos

set epoch to 1940
set date to british

clear

// Dados do Aluno
cNomeAluno      := Space(40)
dNascimento     := CToD("")
cCurso          := Space(20)
nSerie          := 0
nMensalidade    := 800

// Disciplinas
cNomeDisciplina1 := Space(20)
cNomeDisciplina2 := Space(20)
cNomeDisciplina3 := Space(20)

// Disciplina 1
nNotaDisciplina1Bimestre1   := 0
nNotaDisciplina1Bimestre2   := 0
nNotaDisciplina1Bimestre3   := 0
nNotaDisciplina1Bimestre4   := 0

nFaltasDisciplina1Bimestre1 := 0
nFaltasDisciplina1Bimestre2 := 0
nFaltasDisciplina1Bimestre3 := 0
nFaltasDisciplina1Bimestre4 := 0

// Disciplina 2
nNotaDisciplina2Bimestre1   := 0
nNotaDisciplina2Bimestre2   := 0
nNotaDisciplina2Bimestre3   := 0
nNotaDisciplina2Bimestre4   := 0

nFaltasDisciplina2Bimestre1 := 0
nFaltasDisciplina2Bimestre2 := 0
nFaltasDisciplina2Bimestre3 := 0
nFaltasDisciplina2Bimestre4 := 0

// Disciplina 3
nNotaDisciplina3Bimestre1   := 0
nNotaDisciplina3Bimestre2   := 0
nNotaDisciplina3Bimestre3   := 0
nNotaDisciplina3Bimestre4   := 0

nFaltasDisciplina3Bimestre1 := 0
nFaltasDisciplina3Bimestre2 := 0
nFaltasDisciplina3Bimestre3 := 0
nFaltasDisciplina3Bimestre4 := 0

// Disciplina 4
nNotaDisciplina4Bimestre1   := 0
nNotaDisciplina4Bimestre2   := 0
nNotaDisciplina4Bimestre3   := 0
nNotaDisciplina4Bimestre4   := 0

nFaltasDisciplina4Bimestre1 := 0
nFaltasDisciplina4Bimestre2 := 0
nFaltasDisciplina4Bimestre3 := 0
nFaltasDisciplina4Bimestre4 := 0

// Resultado Final
nMediaDisciplina1       := 0
nMediaDisciplina2       := 0
nMediaDisciplina3       := 0

nSomaFaltasDisciplina1  := 0
nSomaFaltasDisciplina2  := 0
nSomaFaltasDisciplina3  := 0

cResultadoDisciplina1   := Space(2)
cResultadoDisciplina2   := Space(2)
cResultadoDisciplina3   := Space(2)

cCorResultadoDisciplina1    := "g/n"
cCorResultadoDisciplina2    := "g/n"
cCorResultadoDisciplina3    := "g/n"

cCorMediaDisciplina1        := "g/n"
cCorMediaDisciplina2        := "g/n"
cCorMediaDisciplina3        := "g/n"

cCorFaltasTotaisDisciplina1 := "g/n"
cCorFaltasTotaisDisciplina2 := "g/n"
cCorFaltasTotaisDisciplina3 := "g/n"

nDependencias       := 0
nMedia              := 0
nFaltasParaReprovar := 0
cResultadoFinal     := Space(30)
nNovaMensalidade    := 0

cDisciplina1Dependencia := Space(20)
cDisciplina2Dependencia := Space(20)
cDisciplina3Dependencia := Space(20)

@ 00,00 to 25,79

@ 01,01 say "                           ESCOLA RECANTO DO SABER"
@ 02,01 say "ENDERECO: R. SAO JOAO, 1203 ZONA 08 MARINGA PR"
@ 02,55 say "TELEFONE: (44) 3028-6565"
@ 03,01 say Replicate("-", 78)

@ 04,01 say "ALUNO: "
@ 04,49 say "DATA DE NASCIMENTO: "
@ 05,01 say "CURSO: "
@ 05,29 say "SERIE: "
@ 05,38 say "MENSALIDADE: "
@ 06,01 say Replicate("-", 78)

@ 04,08 get cNomeAluno      picture "@!"            valid !Empty(cNomeAluno)
@ 04,69 get dNascimento                             valid !Empty(dNascimento) .and. dNascimento <= Date()
@ 05,08 get cCurso          picture "@!"            valid !Empty(cCurso)
@ 05,36 get nSerie          picture "9"             valid nSerie >= 1 .and. nSerie <= 8 .and. !Empty(nSerie)
@ 05,51 get nMensalidade    picture "@E 9999.99"    valid nMensalidade >= 0 .and. nMensalidade < 10000
read

// VALIDAÇÕES DE MÉDIA E FALTA

if nSerie <= 4
    nMedia := 6
else
    nMedia := 7
endif

if nSerie <= 3
    nFaltasParaReprovar := 6
else
    nFaltasParaReprovar := 8
endif

// BOLETIM
@ 08,01 say "DISCIPLINA           |   1B  |   2B  |   3B  |   4B  | MEDIA | FALTAS | RES"
@ 09,01 say "                     | N | F | N | F | N | F | N | F |       |        |    "

// DISCIPLINA 1
@ 10,01 get cNomeDisciplina1                picture "@!"        valid !Empty(cNomeDisciplina1)
@ 10,22 get nNotaDisciplina1Bimestre1       picture "@E 99.9"   valid nNotaDisciplina1Bimestre1 >= 0 .and. nNotaDisciplina1Bimestre1 <= 10.0
@ 10,27 get nFaltasDisciplina1Bimestre1     picture "99"        valid nFaltasDisciplina1Bimestre1 >= 0 .and. nFaltasDisciplina1Bimestre1 <= 50
@ 10,30 get nNotaDisciplina1Bimestre2       picture "@E 99.9"   valid nNotaDisciplina1Bimestre2 >= 0 .and. nNotaDisciplina1Bimestre2 <= 10.0
@ 10,35 get nFaltasDisciplina1Bimestre2     picture "99"        valid nFaltasDisciplina1Bimestre2 >= 0 .and. nFaltasDisciplina1Bimestre2 <= 50
@ 10,38 get nNotaDisciplina1Bimestre3       picture "@E 99.9"   valid nNotaDisciplina1Bimestre3 >= 0 .and. nNotaDisciplina1Bimestre3 <= 10.0
@ 10,43 get nFaltasDisciplina1Bimestre3     picture "99"        valid nFaltasDisciplina1Bimestre3 >= 0 .and. nFaltasDisciplina1Bimestre3 <= 50
@ 10,46 get nNotaDisciplina1Bimestre4       picture "@E 99.9"   valid nNotaDisciplina1Bimestre4 >= 0 .and. nNotaDisciplina1Bimestre4 <= 10.0
@ 10,51 get nFaltasDisciplina1Bimestre4     picture "99"        valid nFaltasDisciplina1Bimestre4 >= 0 .and. nFaltasDisciplina1Bimestre4 <= 50
read

nMediaDisciplina1 = (nNotaDisciplina1Bimestre1 + nNotaDisciplina1Bimestre2 + nNotaDisciplina1Bimestre3 + nNotaDisciplina1Bimestre4) / 4
nSomaFaltasDisciplina1 = nFaltasDisciplina1Bimestre1 + nFaltasDisciplina1Bimestre2 + nFaltasDisciplina1Bimestre3 + nFaltasDisciplina1Bimestre4

if nMediaDisciplina1 < nMedia
    cCorMediaDisciplina1 = "r/n"
endif

if nSomaFaltasDisciplina1 > nFaltasParaReprovar
    cCorFaltasTotaisDisciplina1 := "r/n"
endif

if nSomaFaltasDisciplina1 > nFaltasParaReprovar .or. nMediaDisciplina1 < nMedia
    nResultadoDisciplina1 := "DP"
    nDependencias += 1
    cDisciplina1Dependencia := cNomeDisciplina1
    cCorResultadoDisciplina1 := "r/n"
else
    nResultadoDisciplina1 := "AP"
endif

@ 10,55 say nMediaDisciplina1               picture "@E 99.9"   color cCorMediaDisciplina1
@ 10,62 say nSomaFaltasDisciplina1          picture "99"        color cCorFaltasTotaisDisciplina1
@ 10,71 say nResultadoDisciplina1           picture "@!"        color cCorResultadoDisciplina1

// DISCIPLINA 2
@ 12,01 get cNomeDisciplina2                picture "@!"        valid !Empty(cNomeDisciplina2)
@ 12,22 get nNotaDisciplina2Bimestre1       picture "@E 99.9"   valid nNotaDisciplina2Bimestre1 >= 0 .and. nNotaDisciplina2Bimestre1 <= 10.0
@ 12,27 get nFaltasDisciplina2Bimestre1     picture "99"        valid nFaltasDisciplina2Bimestre1 >= 0 .and. nFaltasDisciplina2Bimestre1 <= 50
@ 12,30 get nNotaDisciplina2Bimestre2       picture "@E 99.9"   valid nNotaDisciplina2Bimestre2 >= 0 .and. nNotaDisciplina2Bimestre2 <= 10.0
@ 12,35 get nFaltasDisciplina2Bimestre2     picture "99"        valid nFaltasDisciplina2Bimestre2 >= 0 .and. nFaltasDisciplina2Bimestre2 <= 50
@ 12,38 get nNotaDisciplina2Bimestre3       picture "@E 99.9"   valid nNotaDisciplina2Bimestre3 >= 0 .and. nNotaDisciplina2Bimestre3 <= 10.0
@ 12,43 get nFaltasDisciplina2Bimestre3     picture "99"        valid nFaltasDisciplina2Bimestre3 >= 0 .and. nFaltasDisciplina2Bimestre3 <= 50
@ 12,46 get nNotaDisciplina2Bimestre4       picture "@E 99.9"   valid nNotaDisciplina2Bimestre4 >= 0 .and. nNotaDisciplina2Bimestre4 <= 10.0
@ 12,51 get nFaltasDisciplina2Bimestre4     picture "99"        valid nFaltasDisciplina2Bimestre4 >= 0 .and. nFaltasDisciplina2Bimestre4 <= 50
read

nMediaDisciplina2 = (nNotaDisciplina2Bimestre1 + nNotaDisciplina2Bimestre2 + nNotaDisciplina2Bimestre3 + nNotaDisciplina2Bimestre4) / 4
nSomaFaltasDisciplina2 = nFaltasDisciplina2Bimestre1 + nFaltasDisciplina2Bimestre2 + nFaltasDisciplina2Bimestre3 + nFaltasDisciplina2Bimestre4

if nMediaDisciplina2 < nMedia
    cCorMediaDisciplina2 = "r/n"
endif

if nSomaFaltasDisciplina2 > nFaltasParaReprovar
    cCorFaltasTotaisDisciplina2 := "r/n"
endif

if nSomaFaltasDisciplina2 > nFaltasParaReprovar .or. nMediaDisciplina2 < nMedia
    nResultadoDisciplina2 := "DP"
    nDependencias += 1
    cDisciplina2Dependencia := cNomeDisciplina2
    cCorResultadoDisciplina2 := "r/n"
else
    nResultadoDisciplina2 := "AP"
endif

@ 12,55 say nMediaDisciplina2               picture "@E 99.9"   color cCorMediaDisciplina2      
@ 12,62 say nSomaFaltasDisciplina2          picture "99"        color cCorFaltasTotaisDisciplina2
@ 12,71 say nResultadoDisciplina2           picture "@!"        color cCorResultadoDisciplina2

// DISCIPLINA 3
@ 14,01 get cNomeDisciplina3                picture "@!"        valid !Empty(cNomeDisciplina3)
@ 14,22 get nNotaDisciplina3Bimestre1       picture "@E 99.9"   valid nNotaDisciplina3Bimestre1 >= 0 .and. nNotaDisciplina3Bimestre1 <= 10.0
@ 14,27 get nFaltasDisciplina3Bimestre1     picture "99"        valid nFaltasDisciplina3Bimestre1 >= 0 .and. nFaltasDisciplina3Bimestre1 <= 50
@ 14,30 get nNotaDisciplina3Bimestre2       picture "@E 99.9"   valid nNotaDisciplina3Bimestre2 >= 0 .and. nNotaDisciplina3Bimestre2 <= 10.0
@ 14,35 get nFaltasDisciplina3Bimestre2     picture "99"        valid nFaltasDisciplina3Bimestre2 >= 0 .and. nFaltasDisciplina3Bimestre2 <= 50
@ 14,38 get nNotaDisciplina3Bimestre3       picture "@E 99.9"   valid nNotaDisciplina3Bimestre3 >= 0 .and. nNotaDisciplina3Bimestre3 <= 10.0
@ 14,43 get nFaltasDisciplina3Bimestre3     picture "99"        valid nFaltasDisciplina3Bimestre3 >= 0 .and. nFaltasDisciplina3Bimestre3 <= 50
@ 14,46 get nNotaDisciplina3Bimestre4       picture "@E 99.9"   valid nNotaDisciplina3Bimestre4 >= 0 .and. nNotaDisciplina3Bimestre4 <= 10.0
@ 14,51 get nFaltasDisciplina3Bimestre4     picture "99"        valid nFaltasDisciplina3Bimestre4 >= 0 .and. nFaltasDisciplina3Bimestre4 <= 50
read

nMediaDisciplina3 = (nNotaDisciplina3Bimestre1 + nNotaDisciplina3Bimestre2 + nNotaDisciplina3Bimestre3 + nNotaDisciplina3Bimestre4) / 4
nSomaFaltasDisciplina3 = nFaltasDisciplina3Bimestre1 + nFaltasDisciplina3Bimestre2 + nFaltasDisciplina3Bimestre3 + nFaltasDisciplina3Bimestre4

if nMediaDisciplina3 < nMedia
    cCorMediaDisciplina3 = "r/n"
endif

if nSomaFaltasDisciplina3 > nFaltasParaReprovar
    cCorFaltasTotaisDisciplina3 := "r/n"
endif

if nSomaFaltasDisciplina3 > nFaltasParaReprovar .or. nMediaDisciplina3 < nMedia
    nResultadoDisciplina3 := "DP"
    nDependencias += 1
    cDisciplina3Dependencia := cNomeDisciplina3
    cCorResultadoDisciplina3 := "r/n"
else
    nResultadoDisciplina3 := "AP"
endif

@ 14,55 say nMediaDisciplina3               picture "@E 99.9"   color cCorMediaDisciplina3   
@ 14,62 say nSomaFaltasDisciplina3          picture "99"        color cCorFaltasTotaisDisciplina3
@ 14,71 say nResultadoDisciplina3           picture "@!"        color cCorResultadoDisciplina3

// VALIDAÇÕES FINAIS

if nDependencias >= 3
    cResultadoFinal := "ALUNO COM MAIS DE 3 DEPENDENCIAS. REPROVADO"
elseif nDependencias == 1 .or. nDependencias == 2
    cResultadoFinal := "ALUNO APROVADO, MAS COM CORRECAO DA MENSALIDADE."
else
    cResultadoFinal := "ALUNO APROVADO!"
endif

if nDependencias == 1
    nNovaMensalidade = nMensalidade + (0.2 * nMensalidade)
elseif nDependencias == 2
    nNovaMensalidade = nMensalidade + (0.4 * nMensalidade)
endif

// RESULTADO FINAL

@ 15,01 say Replicate("-", 78)
@ 16,01 say "                           RESULTADO FINAL"
@ 17,01 say Replicate("-", 78)

@ 18,01 say "TOTAL DE DEPENDENCIAS: " + AllTrim(Str(nDependencias))
@ 19,01 say cResultadoFinal

if nDependencias > 0
    @ 20,01 say "DEPENDENCIAS: "
    @ 21,01 say cDisciplina1Dependencia
    @ 22,01 say cDisciplina2Dependencia
    @ 23,01 say cDisciplina3Dependencia
endif

if nDependencias == 1 .or. nDependencias == 2
    @ 22,25 say "MENSALIDADE ATUALIZADA. NOVA MENSALIDADE: " + AllTrim(Str(nNovaMensalidade))
endif

@ 23,01 say ""
