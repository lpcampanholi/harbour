set epoch to 1940
set date to british

clear

cLetra := Space(1)
dData := CToD("")
nInteiro := 0
nDecimal := 0
cString := Space(20)

@ 00,00 to 06,37
@ 01,01 say "LETRA.........: "
@ 02,01 say "DATA..........: "
@ 03,01 say "NUMERO INTEIRO: "
@ 04,01 say "NUMERO DECIMAL: "
@ 05,01 say "STRING........: "

@ 01,17 get cLetra      picture "@!"        valid !Empty(cLetra)
@ 02,17 get dData                           valid dData <= Date()
@ 03,17 get nInteiro    picture "999"       valid nInteiro >= 0 .and. nInteiro <= 999
@ 04,17 get nDecimal    picture "@E 999.99" valid nDecimal >= 0 .and. nDecimal <= 999.99
@ 05,17 get cString     picture "@!"        valid !Empty(cString)
read

@ 01,01 clear to 05,36

@ 01,01 say "LETRA.........: " + Transform(cLetra, "@!")
@ 02,01 say "DATA..........: " + DToC(dData)
@ 03,01 say "NUMERO INTEIRO: " + AllTrim(Transform(nInteiro, "999"))
@ 04,01 say "NUMERO DECIMAL: " + AllTrim(Transform(nDecimal, "@E 999.99"))
@ 05,01 say "STRING........: " + cString

@ 07,01 say ""
