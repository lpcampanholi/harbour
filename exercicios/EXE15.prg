// Faça um programa que imprima seu nome 10 vezes

clear

cNome       := Space(20)
nContador   := 1
nLinha      := 2

@ 01,01 say "NOME: "
@ 01,07 get cNome picture "@!" valid !Empty(cNome)
read

do while nContador <= 10
    @ nLinha++,01 say cNome
    nContador++
enddo
