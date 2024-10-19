clear

nNumero1 := 0
nNumero2 := 0

@ 01,01 say "Numero 1: "
@ 02,01 say "Numero 2: "

@ 01,12 get nNumero1 picture "999"
@ 02,12 get nNumero2 picture "999"
read // ponto de parada

@ 04,01 say "O antigo valor de n1 e " + Transform( nNumero1, "@E 999.99" ) + "."
@ 05,01 say "O antigo valor de n2 e " + Transform( nNumero2, "@E 999.99" ) + "."

@ 07,01 say "Trocando valores..."

nNumero1 := nNumero1 + nNumero2
nNumero2 := nNumero1 - nNumero2
nNumero1 := nNumero1 - nNumero2

@ 11,01 say "O novo valor de n1 e " + Transform( nNumero1, "@E 999.99" ) + "."
@ 12,01 say "O novo valor de n2 e " + Transform( nNumero2, "@E 999.99" ) + "."

@ 14,01 say ""
