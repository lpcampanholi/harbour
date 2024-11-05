// Faça um programa que leia uma palavra e imprima invertida

clear

cPalavra            := Space(20)
cPalavraInvertida   := Space(20)
nTamanho            := 0

@ 01,01 say "PALAVRA: "

@ 01,10 get cPalavra picture "@!" valid !Empty(cPalavra)
read

nTamanho := Len(AllTrim(cPalavra))

do while nTamanho > 0
    cPalavraInvertida += SubStr(cPalavra, nTamanho--, 1)
enddo

@ 03,01 say "PALAVRA INVERTIDA: " + AllTrim(cPalavraInvertida)
