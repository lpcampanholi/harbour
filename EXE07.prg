clear

nNumero1 := 0
nNumero2 := 0

@ 01,01 say "Numero 1: "
@ 02,01 say "Numero 2: "

@ 01,10 get nNumero1 picture "@E 999.99" valid nNumero1 != 0
@ 02,10 get nNumero2 picture "@E 999.99" valid nNumero2 != 0
read

@ 04,01 say "Soma.....: " + Transform( nNumero1 + nNumero2, "@E 999.99" )
@ 05,01 say "Subtracao: " + Transform( nNumero1 - nNumero2, "@E 999.99" )
@ 06,01 say "Produto..: " + Transform( nNumero1 * nNumero2, "@E 999.99" )
@ 07,01 say "Divisao..: " + Transform( nNumero1 / nNumero2, "@E 999.99" )
