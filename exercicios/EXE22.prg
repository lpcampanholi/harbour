clear

do while .t.

    cNome               := Space(30)
    nMesada             := 0
    nMesadaRestante     := 0
    nTotalCompras       := 0
    cCorMesadaRestante  := "g/n"

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
    
    nMesadaRestante := nMesada

    // CADASTRO COMPRAS
    @ 03,01 say "----------------------------------------------"
    @ 04,01 say "COMPRAS"
    @ 11,01 say "----------------------------------------------"
    @ 12,01 say "TOTAL............: "
    @ 13,01 say "MESADA RESTANTE..: "
    @ 12,20 say nTotalCompras   picture "@E 9999.99"
    @ 13,20 say nMesadaRestante picture "@E 9999.99" color cCorMesadaRestante

    nLinha          := 05

    do while .t.
        cCompra := Space(20)
        nValor  := 0

        @ nLinha,01 get cCompra picture "@!"        valid !Empty(cCompra)
        @ nLinha,22 get nValor  picture "@E 999.99" valid nValor >= 0
        read

        if LastKey() == 27
            nOpcao := Alert("Finalizar o cadastro das compras?", {"Finalizar", "Cancelar Cadastro"})
            if nOpcao == 1 .or. nOpcao == 2
                exit
            endif
            loop
        endif

        // Validação Mesada
        nMesadaRestante -= nValor
        if nMesadaRestante < 0
            cCorMesadaRestante := "r/n"
            Alert("Limite da mesada alcancado.")
            exit
        else
            nTotalCompras += nValor
        endif

        @ 12,20 say nTotalCompras   picture "@E 9999.99"
        @ 13,20 say nMesadaRestante picture "@E 9999.99" color cCorMesadaRestante
        
        // Controle de linhas
        if nLinha >= 10
            nLinha := 05
            @ 05,01 clear to 10,30
        else
            nLinha++
        endif

    enddo

    clear

    @ 01,01 say "Finalizado"

enddo

