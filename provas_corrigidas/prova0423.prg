// Luís Plinio Gabriel Campanholi dos Santos

set epoch to 1940
set date to british

cTodasSenhas        := ""
nQuantidadeSenhas   := 0
nOpcao              := 0

do while .t.

    clear

    nOpcaoMenu := 0

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
            lContemNumero               := .f.
            lContemLetraMaiuscula       := .f.
            lContemLetraMinuscula       := .f.
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

            // Validação senha
            
            nTamanhoSenha := Len(AllTrim(cSenha))
            if nTamanhoSenha >= 8
                lTamanhoMinimo := .t.
            endif

            nPosicaoCaractere := 1
            do while nPosicaoCaractere <= nTamanhoSenha
                cCaractere := SubStr(cSenha, nPosicaoCaractere++, 1)
                if cCaractere $ "0123456789"
                    lContemNumero := .t.
                endif
                if cCaractere $ "ABCDEFGHIJKLMNOPQRSTUVWXZY"
                    lContemLetraMaiuscula := .t.
                endif
                if cCaractere $ "abcdefghijklmnopqrstuvwxyz"
                    lContemLetraMinuscula := .t.
                endif
                if cCaractere $ "!@#$%^&*()-+"
                    lContemCaractereEspecial := .t.
                endif
            enddo
            
            cMensagemErro := "A senha deve possuir: "
            
            if !lTamanhoMinimo
                cMensagemErro += "No minimo 8 caracteres. "
            endif
            if !lContemNumero
                cMensagemErro += "Pelo menos um caractere numerico. "
            endif
            if !lContemLetraMaiuscula
                cMensagemErro += "Pelo menos uma letra maiuscula. "
            endif
            if !lContemLetraMinuscula
                cMensagemErro += "Pelo menos uma letra minuscula. "
            endif
            if !lContemCaractereEspecial
                cMensagemErro += "Pelo menos um caractere especial."
            endif
            
            if lTamanhoMinimo .and. lContemNumero .and. lContemLetraMaiuscula .and. lContemLetraMinuscula .and. lContemCaractereEspecial
                Alert("Senha cadastrada com sucesso!")
                cTodasSenhas += "|" + StrZero(nCodigo, 2) + DToC(dCadastro) + AllTrim(cSenha)
                nQuantidadeSenhas++
                exit
            else
                Alert(cMensagemErro)
                loop
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

        @ 01,18 get nCodigoConsulta picture "999" valid !Empty(nCodigoConsulta) .and. nCodigoConsulta <= nQuantidadeSenhas
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
        cPipeEProximoCodigo := "|" + StrZero(nCodigoConsulta + 1, 2)

        nComecoData         := 0
        nComecoSenha        := 0
        nFimSenhaEscolhida  := 0
        
        do while nContadorCaracteres <= nTamanhoTodasSenhas
            cCaracteresDaVez := SubStr(cTodasSenhas, nContadorCaracteres, 3)
            if cCaracteresDaVez == cPipeECodigo
                nComecoData := nContadorCaracteres + 3
                nComecoSenha := nContadorCaracteres + 11
            endif
            if nQuantidadeSenhas == 1 .or. nCodigoConsulta == nQuantidadeSenhas
                nFimSenhaEscolhida := nTamanhoTodasSenhas
            elseif cCaracteresDaVez == cPipeEProximoCodigo
                nFimSenhaEscolhida := nContadorCaracteres - 1
            endif
            nContadorCaracteres++
        enddo

        cSenhaEscolhida := SubStr(cTodasSenhas, nComecoSenha, nFimSenhaEscolhida - nComecoSenha + 1)
        dCadastroSenhaEscolhida := CToD(SubStr(cTodasSenhas, nComecoData, 8))

        @ 02,18 say cSenhaEscolhida
        @ 03,18 say dCadastroSenhaEscolhida

        // Calendário

        dData := dCadastroSenhaEscolhida
        
        // Primeiro dia do mês
        nMes := Month(dData)
        nAno := Year(dData)
        dPrimeiroDiaDoMes := CToD("01/" + StrZero(nMes, 2) + "/" + AllTrim(Str(nAno)))
    
        // Dia da semana do primeiro dia do mês
        nDiaDaSemanaDoPrimeiroDiaDoMes := DoW(dPrimeiroDiaDoMes)
        
        // Linha e coluna
        nLinha := 06
        nColuna := (nDiaDaSemanaDoPrimeiroDiaDoMes * 3) + 1
        
        // Total de dias do mês
        if nMes == 12
            nProximoMes := 1
            nAno++
        else
            nProximoMes := nMes + 1
        endif
        dPrimeiroDiaProximoMes := CToD("01/" + StrZero(nProximoMes, 2) + "/" + AllTrim(Str(nAno)))
        dUltimoDiaDoMes := dPrimeiroDiaProximoMes - 1
        nTotalDiasMes := Day(dUltimoDiaDoMes)
        
        // Desenho calendário
        @ 05,01 say "   D  S  T  Q  Q  S  S"
        
        nDiaDoMes := 1
        do while nDiaDoMes <= nTotalDiasMes  
            // Cor
            set color to "n/w"
            if nDiaDoMes == Day(dData)
                set color to "n/r"
            endif
        
            @ nLinha,nColuna say nDiaDoMes picture "99"
            if nColuna > 19
                nLinha++
                nColuna := 1
            endif
            
            nColuna := nColuna + 3
            nDiaDoMes++
            set color to "w/n"
        enddo

        @ 12,01 say "Pressione qualquer tecla para sair..."    
        InKey(0)

    elseif nOpcaoMenu == 3 // Sair
        nOpcao := Alert("Deseja sair?", {"Sim", "Nao"})
        if nOpcao == 1
            exit
        endif
        loop

    endif

enddo

clear
