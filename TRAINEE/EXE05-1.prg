clear

nNumero1 := 2
nNumero2 := 10

@ 00,00 to 03,27
@ 01,01 say "O antigo valor de n1 e " + AllTrim ( Str( nNumero1 ) ) + "."
@ 02,01 say "O antigo valor de n2 e " + AllTrim ( Str( nNumero2 ) ) + "."

@ 04,00 to 06,27
@ 05,01 say "Trocando valores..."

nNumero3 := nNumero1
nNumero1 := nNumero2
nNumero2 := nNumero3

@ 07,00 to 10,27
@ 08,01 say "O novo valor de n1 e " + AllTrim ( Str( nNumero1 ) ) + "."
@ 09,01 say "O novo valor de n2 e " + AllTrim ( Str( nNumero2 ) ) + "."

@ 11,01 say ""
