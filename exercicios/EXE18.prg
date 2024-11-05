// Faça um algoritmo que conte e imprima de 1 a 10. Após feito, inclua também para imprimir de 10 até 1.

clear

nNumero := 1
nLinha  := 1

do while nNumero <= 10
    @ nLinha++,01 say AllTrim(Str(nNumero++))
enddo

nNumero := 10
nLinha  := 1

do while nNumero >= 1
    @ nLinha++,05 say AllTrim(Str(nNumero--))
enddo
