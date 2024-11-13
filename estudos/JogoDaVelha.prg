clear

cSimbolo    := "X"
cPosicao    := Space(1)
cPosicao1   := "1"
cPosicao2   := "2"
cPosicao3   := "3"
cPosicao4   := "4"
cPosicao5   := "5"
cPosicao6   := "6"
cPosicao7   := "7"
cPosicao8   := "8"
cPosicao9   := "9"
cJogo       := "Continua"
cJogadas    := ""
nRodada     := 1

do while !(cJogo == "Continua") .or. nRodada < 10

   @ 02,02 say "Bem vindo ao jogo da velha"
   @ 03,02 say "Jogador " + cSimbolo + ", escolha uma posicao: "
   @ 05,02 say "|" + cPosicao1 + "|" + cPosicao2 + "|" + cPosicao3 + "|"
   @ 06,02 say "|" + cPosicao4 + "|" + cPosicao5 + "|" + cPosicao6 + "|"
   @ 07,02 say "|" + cPosicao7 + "|" + cPosicao8 + "|" + cPosicao9 + "|"
   
   @ 04,02 get cPosicao valid cPosicao $ "123456789"
   read
   
   if cPosicao $ cJogadas
      Alert("Casa ocupada")
      loop
   endif

   cJogadas += cPosicao

   if cPosicao == cPosicao1
      cPosicao1 := cSimbolo
   elseif cPosicao == cPosicao2
      cPosicao2 := cSimbolo
   elseif cPosicao == cPosicao3
      cPosicao3 := cSimbolo
   elseif cPosicao == cPosicao4
      cPosicao4 := cSimbolo
   elseif cPosicao == cPosicao5
      cPosicao5 := cSimbolo
   elseif cPosicao == cPosicao6
      cPosicao6 := cSimbolo
   elseif cPosicao == cPosicao7
      cPosicao7 := cSimbolo
   elseif cPosicao == cPosicao8
      cPosicao8 := cSimbolo
   elseif cPosicao == cPosicao9
      cPosicao9 := cSimbolo
   endif
   
   cHorizontal1     := cPosicao1 + cPosicao2 + cPosicao3
   cHorizontal2     := cPosicao4 + cPosicao5 + cPosicao6
   cHorizontal3     := cPosicao7 + cPosicao8 + cPosicao9
   cVertical1       := cPosicao1 + cPosicao4 + cPosicao7
   cVertical2       := cPosicao2 + cPosicao5 + cPosicao8
   cVertical3       := cPosicao3 + cPosicao6 + cPosicao9
   cDiagonal1       := cPosicao1 + cPosicao5 + cPosicao9
   cDiagonal2       := cPosicao3 + cPosicao5 + cPosicao7
   cCondicaoJogador := cSimbolo + cSimbolo + cSimbolo
   cPossibilidades  := cHorizontal1+","+cHorizontal2+","+cHorizontal3+","+cVertical1+","+cVertical2+","+cVertical3+","+cDiagonal1+","+cDiagonal2

   if cCondicaoJogador $ cPossibilidades
      cJogo := "Acabou"
      exit
   endif
   
   if cSimbolo == "X"
      cSimbolo := "O"
   else
      cSimbolo := "X"
   endif
   
   nRodada++

enddo


@ 09,01 say "Jogo encerrado!"

if cJogo == "Acabou"
   @ 10,02 say "Vencedor: " + cSimbolo
else
   @ 10,02 say "Empate"
endif
   

inkey(0)