clear

nIdade := 0

@ 01,01 say "Idade: "

@ 01,08 get nIdade picture "999" valid nIdade > 0 .and. nIdade <= 120
read

if nIdade >= 21
   @ 02,01 say "Maior de 21 anos."
else
   @ 02,01 say "Nao e maior de 21 anos."
endif
