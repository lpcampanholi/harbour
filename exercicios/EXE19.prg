// Apresentar os resultados de uma tabuada de um número digitado (a estrutra de repetição deve variar de 1 a 10)

clear

do while .t.
    
    nNumero     := 0
    nContador   := 1
    nLinha      := 5
    
    @ 01,01 say "      TABUADA"
    @ 02,01 say "---------------------"
    
    @ 03,01 say "Numero: "
    @ 04,01 say "---------------------"
    
    @ 03,09 get nNumero picture "999" valid nNumero > 0
    read

    if LastKey() == 27
        nOpcao := Alert("Deseja sair da aplicacao?", {"Sim", "Nao"})
        if nOpcao == 1
            exit
        endif
        loop
    endif
    
    do while nContador <= 10
        @ nLinha ++,01 say AllTrim(Str(nNumero)) + " * " +  AllTrim(Str(nContador))  + " = " + AllTrim(Str(nNumero * nContador))
        nContador++
    enddo

    InKey(0)

enddo

clear
