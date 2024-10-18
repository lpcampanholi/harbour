clear

nNumero1 := 10
nNumero2 := 20
nNumero3 := 30

nMedia := (nNumero1 + nNumero2 + nNumero3) / 3

@ 00,00 to 04,45 double

@ 01,01 say "A media entre " + AllTrim(Str(nNumero1)) + ", " + AllTrim( Str( nNumero2 ) ) + " e " + AllTrim(Str(nNumero3)) + " e igual a " + AllTrim(Str(nMedia))
@ 02,01 say "A media e " + Str(nMedia, 5, 2) // Caixa com tamanho 5
@ 03,01 say "A media e " + AllTrim(Str(nMedia, 4, 2)) // Saída: **** (estourou a caixa, nao cabe os caracteres)

@ 05,01 say ""
