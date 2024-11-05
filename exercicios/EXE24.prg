clear

do while .t.

    cFruta := Space(20)
    
    @ 01,01 say "Digite uma fruta: "
    @ 01,19 get cFruta picture "@!" valid !Empty(cFruta)
    read

    if LastKey() == 27
        nOpcao := 
    endif
    
enddo
