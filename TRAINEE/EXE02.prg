clear

cNome := Space(40)
nIdade := 0
nPeso := 0

@ 01,01 say "Nome:  "
@ 02,01 say "Idade: "
@ 03,01 say "Peso:  "

@ 01,08 get cNome  picture "@!"         valid !Empty(cNome)
@ 02,08 get nIdade picture "999"        valid nIdade >= 0
@ 03,08 get nPeso  picture "@E 999.999"    valid nPeso >= 0
read

@ 05,01 say "Saudacoes " + AllTrim(cNome) + "!"
@ 06,01 say "Voce tem " + AllTrim(Str( nIdade )) + " anos."
@ 07,01 say "Voce pesa " + AllTrim(Str( nPeso )) + " quilos."
