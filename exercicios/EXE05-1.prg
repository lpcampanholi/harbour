clear

nNumero1 := 0
nNumero2 := 0

@ 00,00 to 04,29

@ 01,01 say "Insira numeros entre 0 e 99:"
@ 02,01 say "Valor de n1: " 
@ 03,01 say "Valor de n2: "

@ 02,14 get nNumero1 picture "99" valid nNumero1 >= 0 .and. nNumero1 <=99
@ 03,14 get nNumero2 picture "99" valid nNumero2 >= 0 .and. nNumero2 <=99
read

@ 05,00 to 07,29

@ 06,01 say "Trocando valores..."

nNumero3 := nNumero1
nNumero1 := nNumero2
nNumero2 := nNumero3

@ 08,00 to 11,29
@ 09,01 say "Novo valor de n1: " + Transform( nNumero1, "99" )
@ 10,01 say "Novo valor de n2: " + Transform( nNumero2, "99" )

@ 12,01 say ""
