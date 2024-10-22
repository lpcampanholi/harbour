clear

nNumero1 := 0
nNumero2 := 0

@ 01,01 say "numero 1: "
@ 02,01 say "numero 2: "

@ 01,11 get nNumero1 picture "@E 999.99" valid nNumero1 >= 0
@ 02,11 get nNumero2 picture "@E 999.99" valid nNumero2 >= 0
read

nProduto := nNumero1 * nNumero2

@ 04,01 say "O produto entre " + AllTrim( Transform( nNumero1, "@E 999.99" ) ) + " e " + AllTrim( Transform( nNumero2, "@E 999.99" ) ) + " e igual a " + AllTrim( Transform( nProduto, "@E 999.99" ) ) + "."
