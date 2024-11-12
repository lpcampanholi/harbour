do while .t.
    
    clear
    
    cPalavraChave           := Space(20)
    cLetrasDigitadas        := ""
    nTamanhoPalavraChave    := 0
    nLetrasAcertadas        := 0
    nTentativasTotal        := 5
    nTentativa              := 0
    nOpcao                  := 0
    nOpcaoJogar             := 0

    @ 01,01 say "Palavra Chave: "
    @ 01,16 get cPalavraChave picture "@!" valid !Empty(cPalavraChave)
    read

    if LastKey() == 27
        nOpcao := Alert("Deseja sair?", {"Sim", "Nao"})
        if nOpcao == 1
            exit
        endif
        loop
    endif

    nTamanhoPalavraChave := Len(AllTrim(cPalavraChave))

    // Imprimir traços
    nContadorPalavra := 1
    do while nContadorPalavra <= nTamanhoPalavraChave
        @ 05,nContadorPalavra say "_"
        nContadorPalavra++ 
    enddo

    do while .t.

        cLetraChutada := Space(1)

        // Ler
        @ 03,01 say cLetrasDigitadas
        @ 06,01 say "Digite uma letra: "

        @ 06,19 get cLetraChutada picture "@!" valid !Empty(cLetraChutada)
        read

        if LastKey() == 27
            nOpcao := Alert("Desistir?", {"Sim", "Nao"})
            if nOpcao == 1
                exit
            endif
            loop
        endif

        // Imprimir a letra
        cLetraChutada += cLetrasDigitadas  + " "
        
        // Verifica a palavra
        nContador := 1
        do while nContador <= nTamanhoPalavraChave
            cLetra := SubStr(cPalavraChave, nContador, 1)
            if cLetra == cLetraChutada
                @ 04,nContador say cLetraChutada
                nLetrasAcertadas++
            endif
            nContador++   
        enddo
        
        // Errou a letra
        if !(cLetraChutada $ cPalavraChave)
            nTentativa++
        endif

        // Vitoria
        if nLetrasAcertadas == nTamanhoPalavraChave
            Alert("Voce ganhou, parabens!")
            exit
        endif
        
        // Desenho do boneco
        if nTentativa == 1
            @ 05,30 say "  O"
        elseif nTentativa == 2
            @ 06,30 say "  |"
            @ 07,30 say "  |"
        elseif nTentativa == 3
            @ 07,30 say " \|/"
        elseif nTentativa == 4
            @ 09,30 say " / \"
        elseif nTentativa == 5
            @ 09,30 say "_/ \_"
        endif
        
        // Derrota
        if nTentativa >= nTentativasTotal
            @ 06,30 say "--|--" color "r"
            nOpcaoJogar := Alert("Deu forca. Jogar novamente?", {"Sim", "Nao"})
            exit
        endif
        
    enddo

    if nOpcaoJogar == 2
        exit        
    endif

enddo

clear
