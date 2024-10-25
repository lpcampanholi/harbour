clear

nNumero1    := 0
nNumero2    := 0
nNumero3    := 0
nMaior      := 0

@ 01,01 say "Numero 1: "
@ 02,01 say "Numero 2: "
@ 03,01 say "Numero 3: "

@ 01,11 get nNumero1 picture "@E 999.99" valid nNumero1 <= 999.99
@ 02,11 get nNumero2 picture "@E 999.99" valid nNumero2 <= 999.99
@ 03,11 get nNumero3 picture "@E 999.99" valid nNumero3 <= 999.99
read

nMaior := nNumero1

if nNumero2 > nMaior
   nMaior := nNumero2
endif

if nNumero3 > nMaior
   nMaior := nNumero3
endif

@ 04,01 say Replicate("-", 11)
@ 05,01 say "Maior numero: " + Transform(nMaior, "@999.99")
