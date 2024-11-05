/*
Faça um algoritmo que leia o nome do nadador e a idade, classifique-o em uma das seguintes categorias e mostre na tela:
Infantil A = 5 - 7 anos
Infantil B = 8 - 10 anos
Juvenil A = 11 - 13 anos
Juvenil B = 14 - 17 anos
senior = maiores de 18 anos
*/

clear

cNome       := Space(30)
nIdade      := 0
cCategoria  := Space(20)

@ 01,01 say "NOME.: "
@ 02,01 say "IDADE: "

@ 01,08 get cNome   picture "@!"    valid !Empty(cNome)
@ 02,08 get nIdade  picture "999"   valid nIdade > 0 .and. nIdade <= 120
read

if nIdade >= 5 .and. nIdade <= 7
   cCategoria := "INFANTIL A"
elseif nIdade >= 8 .and. nIdade <= 10
   cCategoria := "INFANTIL B"
elseif nIdade >= 11 .and. nIdade <= 13
   cCategoria := "JUVENIL A"
elseif nIdade >= 14 .and. nIdade <= 17
   cCategoria := "JUVENIL B"
elseif nIdade >= 18
   cCategoria := "SENIOR"
endif

@ 03,01 say Replicate("-", 37)
@ 04,01 say "CATEGORIA: " + AllTrim(cCategoria)
