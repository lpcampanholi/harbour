clear

nNumero1 := 0
nNumero2 := 0

@ 01,01 say "Numero 1: "
@ 02,01 say "Numero 2: "

@ 01,10 get nNumero1 picture "@E 999.99"
@ 02,10 get nNumero2 picture "@E 999.99"
read

@ 04,01 say "Numero 1 + Numero 2 = " + Transform( nNumero1 + nNumero2, "@E 999.99" )
@ 05,01 say "Numero 1 - Numero 2 = " + Transform( nNumero1 - nNumero2, "@E 999.99" )
@ 06,01 say "Numero 1 * Numero 2 = " + Transform( nNumero1 * nNumero2, "@E 999.99" )
@ 07,01 say "Numero 1 / Numero 2 = " + Transform( nNumero1 / nNumero2, "@E 999.99" )
