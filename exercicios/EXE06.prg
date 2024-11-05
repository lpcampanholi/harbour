// Elabore um programa que tenha três números e apresente sua média.

clear

nNumero1 := 0
nNumero2 := 0
nNumero3 := 0

@ 00,00 to 04,45 double

@ 01,01 say "Escreva o numero 1: "
@ 02,01 say "Escreva o numero 2: "

@ 01,21 get nNumero1 picture "@E 999.99" valid nNumero1 >= 0
@ 02,21 get nNumero2 picture "@E 999.99" valid nNumero2 >= 0
read

nMedia := (nNumero1 + nNumero2 + nNumero3) / 3

@ 04,01 say "A media entre " + Transform( nNumero1, "@E 999.99" ) + ", " + Transform( nNumero2, "@E 999.99" ) + " e " + Transform( nNumero3, "@E 999.99" ) + " e igual a " + Transform( nMedia, "@E 999.99" )
@ 05,01 say ""
