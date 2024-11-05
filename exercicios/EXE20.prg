// Mostre o resultado da soma dos números de 10 a 50.

clear

nNumero := 10
nSoma   := 0

do while nNumero <= 50
  nSoma += nNumero
  nNumero++
enddo

@ 01,01 say "Soma dos numeros de 10 a 50: " + AllTrim(Str(nSoma))
