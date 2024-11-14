// Luís Plinio Gabriel Campanholi dos Santos

nJogadores           := 1
cJogadores           := ""
cPontuacoes          := ""

do while .t.
    
   clear

   cJogador             := Space(20)
   nPontos              := 0
   cStringLetrasJogo    := ""
   nColuna              := 0
   nCodigoTecla         := 0
   nLetrasPainel        := 20
   cLetra               := ""
   cLetraASerAcertada   := ""

   @ 01,01 say "Jogador: "

   @ 01,10 get cJogador picture "@!" valid !Empty(cJogador)
   read

   if LastKey() == 27
      nOpcao := Alert("Sair?", {"Sim", "Nao"})
      if nOpcao == 1
         exit
      endif
      loop
   endif

   // Impressão inicial no painel
   nContador := 1
   nLinha    := 3
   do while nContador <= nLetrasPainel
      nAleatorio := Hb_RandomInt(1,4)

      if nAleatorio == 1
         cLetra := "Q"
         nColuna := 1
      elseif nAleatorio == 2
         cLetra := "W"
         nColuna := 3
      elseif nAleatorio == 3
         cLetra := "E"
         nColuna := 5
      elseif nAleatorio == 4
         cLetra := "R"
         nColuna := 7
      endif

      cStringLetrasJogo += cLetra

      @ nLinha,nColuna say cLetra color "r/n"
      nLinha++
      nContador++
   enddo
   
   @ 23,01 say "Q W E R" color "g/n"
   @ 02,01 say "Digite qualquer tecla para comecar.."
   InKey(0)

   @ 02,01 clear to 02,80

   do while .t. // Loop jogada
      
      cLetraASerAcertada := SubStr(cStringLetrasJogo, 20, 1)

      // Codigo da tecla
      if cLetraASerAcertada == "Q"
         nCodigoTecla := 113
      elseif cLetraASerAcertada == "W"
         nCodigoTecla := 119
      elseif cLetraASerAcertada == "E"
         nCodigoTecla := 101
      elseif cLetraASerAcertada == "R"
         nCodigoTecla := 114
      endif

      // Usuario digita tecla
      nKey := InKey(1)

      // Verificação letra digitada
      if nKey == nCodigoTecla
         nPontos++
      else
         Alert("Pontos: " + AllTrim(Str(nPontos)))
         cJogadores += cJogador
         cPontosDaVez := Transform(nPontos, "999")
         cPontuacoes += cPontosDaVez
         exit
      endif

      // Atualização String
      nAleatorio := Hb_RandomInt(1,4)
      if nAleatorio == 1
         cLetra := "Q"
      elseif nAleatorio == 2
         cLetra := "W"
      elseif nAleatorio == 3
         cLetra := "E"
      elseif nAleatorio == 4
         cLetra := "R"
      endif

      cSubString := SubStr(cStringLetrasJogo, 1, 19)
      cStringLetrasJogo := cLetra + cSubString

      // Atualização do painel de letras
      nContador := 1
      nLinha := 22
      @ 03,01 clear to 22,80
      do while nContador <= nLetrasPainel
         cLetraDaString := SubStr(cStringLetrasJogo, (nLetrasPainel + 1) - nContador, 1)
         // Coluna
         if cLetraDaString == "Q"
            nColuna := 1
         elseif cLetraDaString == "W"
            nColuna := 3
         elseif cLetraDaString == "E"
            nColuna := 5
         elseif cLetraDaString == "R"
            nColuna := 7
         endif
         @ nLinha,nColuna say cLetraDaString color "r/n"
         nContador++
         nLinha--
      enddo

   enddo // Loop jogada

   clear

   @ 01,01 say "      HISTORICO DE PONTUACAO"
   @ 02,01 say "-----------------------------------"

   if (nJogadores - 4) > 0
      nContador := nJogadores - 4
   else
      nContador := 1
   endif

   nLinha      := 3
   
   do while nContador <= nJogadores
      cJogadorTabela := SubStr(cJogadores, (20 * nContador) - 19, 20)
      cPontuacaoTabela := SubStr(cPontuacoes, (3 * nContador) - 2, 3)
      @ nLinha,01 say AllTrim(cJogadorTabela)
      @ nLinha,33 say AllTrim(cPontuacaoTabela)
      nLinha++
      nContador++
   enddo

   @ 12,01 say "Pressione qualquer tecla para jogar novamente.."
   InKey(0)

   nJogadores++

enddo
