// Luís Plinio Gabriel Campanholi dos Santos

set epoch to 1940
set date to british

do while .t.

    clear

    nQuantidadeSenhas   := 0
    cTodasSenhas        := ""
    nOpcaoMenu          := 0

    @ 01,01 say "       SISTEMA DE CADASTRO DE SENHAS"
    @ 02,01 say "---------------------------------------------"
    @ 03,01 say "1- Cadastrar" 
    @ 04,01 say "2- Consultar"
    @ 05,01 say "3- Sair"

    @ 06,01 get nOpcaoMenu picture "9" valid nOpcaoMenu >= 1 .and. nOpcaoMenu <= 3
    read

    if LastKey() == 27
        nOpcao := Alert("Sair do programa?", {"Sim", "Nao"})
        if nOpcao == 1
            exit
        endif
        loop
    endif



    if nOpcaoMenu == 1 // Cadastro

        do while .t.
            clear

            nCodigo                     := nQuantidadeSenhas + 1
            cSenha                      := Space(20)
            dCadastro                   := Date()
            nTamanhoSenha               := 0
            nPosicaoCaractere           := 0
            lTamanhoMinimo              := .f.
            lContemLetraMaiuscula       := .f.
            lContemLetraMinuscula       := .f.
            lContemNumero               := .f.
            lContemCaractereEspecial    := .f.
    
    
            @ 01,01 say "Codigo..........: "
            @ 02,01 say "Senha...........: "
            @ 03,01 say "Data cadastro...: "
            @ 01,19 say nCodigo picture "99"
    
            @ 02,19 get cSenha      valid !Empty(cSenha)
            @ 03,19 get dCadastro   valid !Empty(dCadastro) .and. dCadastro <= Date()
            read

            if LastKey() == 27
                nOpcao := Alert("Voltar?", {"Sim", "Nao"})
                if nOpcao == 1
                    exit
                endif
                loop
            endif

            // Mínimo 8 caracteres
            if nTamanhoSenha >= 8
                lTamanhoMinimo := .t.
            else
                Alert("A senha deve possuir no minimo 8 caracteres")
                loop
            endif

            nTamanhoSenha := Len(AllTrim(cSenha))

            // caractere numerico
            nPosicaoCaractere := 1
            do while nPosicaoCaractere <= nTamanhoSenha
                cCaractere := SubStr(cSenha, nPosicaoCaractere++, 1)
                if cCaractere $ "0123456789"
                    lContemNumero := .t.
                else
                    Alert("A senha deve possuir pelo menos um caractere numerico")
                    loop
                endif
            enddo

            // letra maiuscula
            nPosicaoCaractere := 1
            do while nPosicaoCaractere <= nTamanhoSenha
                cCaractere := SubStr(cSenha, nPosicaoCaractere++, 1)
                if cCaractere $ "ABCDEFGHIJKLMNOPQRSTUVWXZY"
                    lContemLetraMinuscula := .t.
                else
                    Alert("A senha deve possuir pelo menos uma letra maiuscula")
                    loop
                endif
            enddo

            // letra minuscula
            nPosicaoCaractere := 1
            do while nPosicaoCaractere <= nTamanhoSenha
                cCaractere := SubStr(cSenha, nPosicaoCaractere++, 1)
                if cCaractere $ "abcdefghijklmnopqrstuvwxyz"
                    lContemCaractereEspecial := .t.
                else
                    Alert("A senha deve possuir pelo menos uma letra minuscula")
                    loop
                endif
            enddo

            // caractere especial
            nPosicaoCaractere := 1
            do while nPosicaoCaractere <= nTamanhoSenha
                cCaractere := SubStr(cSenha, nPosicaoCaractere++, 1)
                if cCaractere $ "!@#$%^&*()-+"
                    lContemCaractereEspecial := .t.
                else
                    Alert("A senha deve possuir pelo menos um caractere especial")
                    loop
                endif
            enddo

            if lTamanhoMinimo .and. lContemNumero .and. lContemLetraMaiuscula .and. lContemLetraMinuscula .and. lContemCaractereEspecial
                Alert("Senha cadastrada com sucesso!")
                nQuantidadeSenhas++
                cTodasSenhas += "|" + StrZero(nCodigo, 2) + DToC(dCadastro) + cSenha
                Alert(Str(cTodasSenhas))
                exit
            endif

        enddo

    elseif nOpcaoMenu == 2 // Consulta

        clear

        if cTodasSenhas == ""
            Alert("Voce ainda nao possui senhas cadastradas!")
            loop
        endif

        nCodigoConsulta             := 0
        nCaractere                  := 0
        cSenhaEscolhida             := ""
        dCadastroSenhaEscolhida     := CtoD("")
        nTamanhoTodasSenhas         := 0
        
        @ 01,01 say "Codigo.........: "
        @ 02,01 say "Senha..........: "
        @ 03,01 say "Data cadastro..:"

        @ 01,18 get nCodigo picture "999" valid !Empty(nCodigo)
        read

        if LastKey() == 27
            nOpcao := Alert("Voltar?", {"Sim", "Nao"})
            if nOpcao == 1
                loop
            endif
        endif

        
        // Buscar Senha na String
        // |0102/10/24/senha
        nTamanhoTodasSenhas := Len(AllTrim(cTodasSenhas))
        nContadorCaracteres := 1
        cPipeECodigo := "|" + StrZero(nCodigoConsulta, 2)
        cPipeEProximoCodigo := "|" + AllTrim(Str(nCodigoConsulta + 1))
        
        do while nContadorCaracteres <= nTamanhoTodasSenhas
            cCaracteresDaVez := SubStr(cTodasSenhas, nContadorCaracteres, 3)
            if cCaracteresDaVez == cPipeECodigo
                nComecoData := nContadorCaracteres + 3
                nComecoSenha := nContadorCaracteres + 12
            endif
            if cCaracteresDaVez == cPipeEProximoCodigo
                nFimSenhaEscolhida := nContadorCaracteres - 1
            endif
            nContadorCaracteres++
        enddo
        cSenhaEscolhida := SubStr(cTodasSenhas, nComecoSenha, nFimSenhaEscolhida)
        dCadastroSenhaEscolhida := CToD(SubStr(cTodasSenhas, nComecoData, 8))

        @ 02,18 say cSenhaEscolhida
        @ 03,18 say dCadastroSenhaEscolhida

        // Calendário

        dData := dCadastroSenhaEscolhida
        nMesData := Month(dData)
        cMesData := AllTrim(Str(nMesData))

        dPrimeiroDiaMes := CtoD("01/" + StrZero(Month(dData), 2) + "/" + AllTrim(Str(Year(dData))))
        nDiaDaSemanaDoPrimeiroDiaDoMes := DoW(dPrimeiroDiaMes)

        nDiaDoMes := 1

        nLinha := 06
        nColuna := nDiaDaSemanaDoPrimeiroDiaDoMes * 3

        // Total de dias do mês
        nTotalDiasMes := 0
        if cMesData $ "1|3|5|7|8|10|12"
            nTotalDiasMes := 31
        elseif cMesData $ "4|6|9|11"
            nTotalDiasMes := 30
        elseif cMesData == 2
            nTotalDiasMes := 28
        endif

        @ 05,01 say "D  S  T  Q  Q  S  S"

        do while nDiaDoMes <= nTotalDiasMes

            if nDiaDoMes == Day(dData)
                set color to "n/r"
            endif

            set color to "n/w"

            @ nLinha,nColuna say nDiaDoMes picture "99"

            if nColuna > 19
                nLinha++
                nColuna := 1
            endif
            nColuna := nColuna + 3
            nDiaDoMes++
            set color to "w/n"
        enddo


    elseif nOpcaoMenu == 3 // Sair
        exit
    endif
    

enddo

