do while .t.
    
    clear
    
    cPalavraChave           := Space(20)
    cDica                   := Space(20)
    cLetrasDigitadas        := ""

    nLetrasAcertadas        := 0
    nTentativasTotal        := 6
    nTentativa              := 0
    nOpcao                  := 0
    nOpcaoJogar             := 0

    @ 01,01 say "              JOGO DA FORCA"
    @ 02,01 say "--------------------------------------------"
    @ 04,01 say "Palavra Chave..: "
    @ 05,01 say "Dica...........: "

    @ 04,18 get cPalavraChave   picture "@!"  valid !Empty(cPalavraChave) color "w/w"
    @ 05,18 get cDica           picture "@!"
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
        @ 13,nContadorPalavra say "_"
        nContadorPalavra++ 
    enddo

    // Chutes
    do while .t.

        cLetraChutada := Space(1)

        @ 07,01 say "A palavra tem " + AllTrim(Str(nTamanhoPalavraChave)) + " letras."
        @ 09,01 say cLetrasDigitadas color "gr"
        @ 16,01 say "Digite uma letra: "

        @ 16,19 get cLetraChutada picture "@!" valid !Empty(cLetraChutada)
        read

        if LastKey() == 27
            nOpcao := Alert("Desistir?", {"Sim", "Nao"})
            if nOpcao == 1
                exit
            endif
            loop
        endif

        // Imprimir a letra
        if cLetraChutada $ cLetrasDigitadas
            Alert("A letra " + cLetraChutada + " ja foi. Tente outra.")
            loop
        else
            cLetrasDigitadas += cLetraChutada  + " "
        endif
        
        // Verifica a palavra
        nContador := 1
        do while nContador <= nTamanhoPalavraChave
            cLetra := SubStr(cPalavraChave, nContador, 1)
            if cLetra == cLetraChutada
                @ 12,nContador say cLetraChutada
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
            @ 07,29 say "  O"
        elseif nTentativa == 2
            @ 08,29 say "  |"
            @ 09,29 say "  |"
        elseif nTentativa == 3
            @ 09,29 say " \|/"
        elseif nTentativa == 4
            @ 11,29 say " / \"
        elseif nTentativa == 5
            @ 11,29 say "_/ \_"
        endif
        
        // Derrota
        if nTentativa >= nTentativasTotal
            @ 08,29 say "--|--" color "r"
            nOpcaoJogar := Alert("Deu forca. Jogar novamente?", {"Sim", "Nao"})
            Alert("A palavra chave era: " + AllTrim(cPalavraChave))
            exit
        endif
        
    enddo

    if nOpcaoJogar == 2
        exit
    endif

enddo

clear
