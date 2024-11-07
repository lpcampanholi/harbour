set century on
set date to british

do while .t.
    
    clear
    
    dData := Date()

    @ 01,01 say "      Calendario"
    @ 02,01 say "-----------------------"
    @ 03,01 say "Data: "
    
    @ 03,07 get dData valid !Empty(dData)
    read

    if LastKey() == 27
        nOpcao := Alert("Deseja sair?", {"Sim", "Nao"})
        if nOpcao == 1
            exit
        endif
        loop
    endif
    
    // Primeiro dia do mês
    nMes := Month(dData)
    nAno := Year(dData)
    dPrimeiroDiaDoMes := CToD("01/" + Str(nMes) + "/" + Str(nAno))

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
    dPrimeiroDiaProximoMes := CToD("01/" + Str(nProximoMes) + "/" + Str(nAno))
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

    InKey(0)

enddo

clear
