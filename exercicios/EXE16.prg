clear

cNome       := Space(20)
nRepeticoes := 0
nContador   := 1
nLinha      := 3
nColuna     := 1

@ 01,01 say "NOME......: "
@ 02,01 say "REPETICOES: "

@ 01,07 get cNome       picture "@!"    valid !Empty(cNome)
@ 02,12 get nRepeticoes picture "999"   valid nRepeticoes >= 0  .and. nRepeticoes <= 100
read

do while nContador <= nRepeticoes
    if nLinha >= 25
        nColuna := 10
    endif
    @ nLinha++,nColuna say cNome
    nContador++
enddo
