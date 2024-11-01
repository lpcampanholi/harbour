set epoch to 1940
set date to british

do while .t.

    clear

    cNomeCliente            := Space(40)
    nIdadeCliente           := 0
    dAtual                  := Date()
    dCompra                 := Date()
    cEnderecoEntrega        := Space(20)
    dEntrega                := CToD("")
    nTotalCompra            := 0
    nLimite                 := 0
    nLimiteTotal            := 0
    cCorLimite              := "g/n"

    @ 01,01 say "              INFORMACOES DA COMPRA"

    @ 02,01 say "NOME..: "
    @ 03,01 say "IDADE.: "
    @ 04,01 say "LIMITE: "
    @ 04,25 say "DATA DA COMPRA: "

    @ 02,09 get cNomeCliente    picture "@!"           valid !Empty(cNomeCliente)
    @ 03,09 get nIdadeCliente   picture "999"          valid nIdadeCliente > 0 .and. nIdadeCliente <= 120
    @ 04,09 get nLimiteTotal    picture "@E 9999.99"   valid nLimiteTotal >= 0 .and. nLimiteTotal <= 9999
    @ 04,41 get dCompra                                valid dCompra <= dAtual .and. !Empty(dCompra)
    read
    
    if LastKey() == 27
        nOpcao := Alert("Deseja sair do programa?", {"Sim", "Nao"})
        if nOpcao == 1
            exit
        endif
        loop
    endif

    nLimite  := nLimiteTotal
    dEntrega := dCompra + 3

    @ 05,01 say Replicate("-", 48)

    @ 06,01 say "SEQ"
    @ 06,05 say "PRODUTO"
    @ 06,26 say "QTD"
    @ 06,33 say "PRECO"
    @ 06,41 say "VALOR"

    // Valot total e limite
    @ 10,01 say Replicate("-", 48)
    @ 11,01 say "VALOR TOTAL: "
    @ 11,39 say nTotalCompra    picture "@E 99999.99"
    @ 12,01 say "LIMITE.....: "
    @ 12,40 say nLimite         picture "@E 9999.99" color cCorLimite
    @ 13,01 say Replicate("-", 48)

    // CADASTRO PRODUTO
    
    nSequencia              := 1
    nLinha                  := 7
    
    do while .t.
        cNomeProduto        := Space(20)
        nQuantidadeProduto  := 0
        nPrecoProduto       := 0
        nValorProduto       := 0

        @ nLinha,01 say Transform(nSequencia, "99")

        @ nLinha,05 get cNomeProduto       picture "@!"        valid !Empty(cNomeProduto)
        @ nLinha,26 get nQuantidadeProduto picture "@E 999.99" valid nQuantidadeProduto > 0
        @ nLinha,33 get nPrecoProduto      picture "@E 999.99" valid nPrecoProduto >= 0
        read

        if LastKey() == 27
            nOpcao := Alert("Finalizar a compra?", {"Finalizar Compra", "Cancelar Compra"})
            if nOpcao == 1 .or. nOpcao == 2
                exit
            endif
            loop
        endif
    
        // Atualiar Valores
        nValorProduto   := nQuantidadeProduto * nPrecoProduto
        nTotalCompra    += nValorProduto
        nLimite         := nLimite - nValorProduto
        nSequencia++
        
        if nLimite <= nLimiteTotal .and. nLimite >= 0
            cCorLimite := "g/n"
        else
            cCorLimite := "r/n"
        endif
   
        @ nLinha,41 say nValorProduto   picture "@E 999.99"
        @ 11,39     say nTotalCompra    picture "@E 99999.99"
        @ 12,40     say nLimite         picture "@E 9999.99" color cCorLimite

        // Incrementar linha
        nLinha++
        if nLinha >= 10
            nLinha := 7
            @ 07,01 clear to 10,48
        endif

    enddo

    if nOpcao == 2
        loop
    endif

    // ENTREGA

    @ 14,01 say "INFORMACOES DE ENTREGA"
    @ 15,01 say "ENDERECO DE ENTREGA: "
    @ 16,01 say "DATA DE ENTREGA....: "

    @ 15,22 get cEnderecoEntrega picture "@!" valid !Empty(cEnderecoEntrega)
    @ 16,22 get dEntrega                      valid dEntrega >= dCompra + 3
    read

enddo
