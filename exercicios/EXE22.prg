clear

do while .t.

    cNome           := Space(30)
    nMesada         := 0
    nTotalCompras   := 0

    @ 01,01 say "NOME....: "
    @ 02,01 say "MESADA..: "
    
    @ 01,11 get cNome picture "@!" valid !Empty(cNome)
    @ 02,11 get nMesada picture "@E 9999.99" valid nMesada > 0
    read
    
    if LastKey() == 27
        nOpcao := Alert("Deseja sair da aplicacao?", {"Sim", "Nao"})
        if nOpcao == 1
            exit
        endif
        loop
    endif

    // CADASTRO COMPRAS
    @ 03,01 say "----------------------------------------------"
    @ 04,01 say "COMPRAS"

    
    do while .t.
        cCompra := Space(20)
        cValor  := 0

        @ 05,01 get cCompra picture "@!"        valid !Empty(cCompra)
        @ 05,22 get nValor  picture "@E 999.99" valid !Empty(nValor)
        read

        if LastKey() == 27
            nOpcao := Alert("Finalizar o cadastro das compras?", {"Finalizar", "Cancelar Cadastro"})
            if nOpcao == 1 .or. nOpcao == 2
                exit
            endif
            loop
        endif



    enddo

enddo

