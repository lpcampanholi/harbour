// Luís Plinio Gabriel Campanholi dos Santos

cNome                   := Space(20)
cDificuldade            := Space(1)
cPalavraChave           := Space(20)
cDica1                  := Space(30)
cDica2                  := Space(30)
cDica3                  := Space(30)
cAlfabeto               := "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
nTentativasTotaisTotais := 0
nTamanhoPalavraChave    := 0
nOpcao                  := 0

do while .t.

    clear

   @ 01,01 say "                Jogo da forca"
   @ 02,01 say "----------------------------------------------"
   @ 03,01 say "Nome...........: "
   @ 04,01 say "Dificuldade....:   [F]acil, [M]edio, [D]ificil"
   @ 05,01 say "Palavra-chave..: "

   @ 03,18 get cNome           picture "@!"    valid !Empty(cNome)
   @ 04,18 get cDificuldade    picture "@!"    valid cDificuldade $ "FMD"
   @ 05,18 get cPalavraChave   picture "@!"    valid !Empty(cPalavraChave) color "w/w"
   read

   nTamanhoPalavraChave := Len(AllTrim(cPalavraChave))

   if LastKey() == 27
      nOpcao := Alert("Sair?", {"Sim", "Nao"})
      if nOpcao == 1
         exit
      endif
      loop
   endif

   // Ler dicas quando está no fácil
   if cDificuldade == "F"
      @ 06,01 say "----------------------------------------------"
      @ 07,01 say "                    Dicas"
      @ 08,01 say "----------------------------------------------"
      @ 09,01 say "Dica 01..: "
      @ 10,01 say "Dica 02..: "
      @ 11,01 say "Dica 03..: "

      @ 09,12 get cDica1 picture "@!" valid !Empty(cDica1)
      @ 10,12 get cDica2 picture "@!" valid !Empty(cDica2)
      @ 11,12 get cDica3 picture "@!" valid !Empty(cDica3)
      read

      if LastKey() == 27
         nOpcao := Alert("Sair?", {"Sim", "Nao"})
         if nOpcao == 1
            exit
         endif
         loop
      endif
   endif

   // Tentativas com base na dificuldade
   if cDificuldade == "F"
      nTentativasTotais := 6
   elseif cDificuldade == "M"
      nTentativasTotais := 5
   elseif cDificuldade == "D"
      nTentativasTotais := 4
   endif

   clear

   nColuna           := 1
   nLetrasAcertadas  := 0
   cLetrasDigitadas  := ""
   nTentativa        := 0
   
   @ 02,00 to 04,27
   
   @ 03,01 say cAlfabeto
   @ 06,01 say "A palavra tem " + AllTrim(Str(nTamanhoPalavraChave)) + " letras."
   
   // Letreiro
   nContador := 1
   do while nContador <= nTamanhoPalavraChave
      @ 10,nColuna++ say "_"
      nContador++
   enddo

   // Tentativas
   do while .t.

      cLetraChutada := Space(1)
      
      @ 12,01 say "Digite uma letra: "
      @ 07,01 say "Voce tem " + AllTrim(Str(nTentativasTotais - nTentativa)) + " tentativa(s)."
      
      @ 12,19 get cLetraChutada picture "@!" valid !Empty(cLetraChutada)
      read

      if LastKey() == 27
         nOpcao := Alert("Desistir?", {"Sim", "Nao"})
         if nOpcao == 1
            exit
         endif
         loop
      endif
      
      if cLetraChutada $ cLetrasDigitadas
         Alert("A letra " + AllTrim(cLetraChutada) + " ja foi. Tente outra.")
         loop
      endif

      cLetrasDigitadas += cLetraChutada

      // Buscar na palavra-chave
      nContadorPalavraChave := 1
      do while nContadorPalavraChave <= nTamanhoPalavraChave
         cLetraBuscada := SubStr(cPalavraChave, nContadorPalavraChave, 1)
         if cLetraChutada == cLetraBuscada
            @ 09,nContadorPalavraChave say cLetraChutada picture "@!"
            nLetrasAcertadas++
         endif
         nContadorPalavraChave++
      enddo

      // Busca no alfabeto
      nContadorAlfabeto := 1
      do while nContadorAlfabeto <= Len(AllTrim(cAlfabeto))
         cLetraBuscadaAlfabeto := SubStr(cAlfabeto, nContadorAlfabeto, 1)
         if cLetraBuscadaAlfabeto == cLetraChutada
            @ 03,nContadorAlfabeto say cLetraBuscadaAlfabeto color "r/n"
         endif
         nContadorAlfabeto++
      enddo

      // Aumenta tentativas
      if !(cLetraChutada $ cPalavraChave)
         nTentativa++
      endif

      // Acertou a palavra
      if nLetrasAcertadas == nTamanhoPalavraChave
         Alert("Voce acertou, parabens!!!")
         exit
      endif

      // Dicas
      if nTentativa == 2 .and. cDificuldade == "F"
         @ 15,01 say "Dica 1: " + AllTrim(cDica1)
      endif
      if nTentativa == 3 .and. cDificuldade == "F"
         @ 16,01 say "Dica 2: " + AllTrim(cDica2)
      endif
      if nTentativa == 4 .and. cDificuldade == "F"
         @ 17,01 say "Dica 3: " + AllTrim(cDica3)
      endif

      // Desenho boneco
      if nTentativa == 1
         @ 02,30 say "   O"   // cabeça
      elseif nTentativa == 2
         @ 03,30 say "   |"   // corpo
         @ 04,30 say "   |"   // corpo
      elseif nTentativa == 3
         @ 04,30 say "  /|\"  // braços
      elseif nTentativa == 4
         @ 05,30 say "  / \ " // pernas
      elseif nTentativa == 5
         @ 05,30 say " _/ \_" // pés
      endif

      // Derrota
      if nTentativa >= nTentativasTotais
         @ 03,30 say " --|--"  color "r/n" // forca
         nOpcao := Alert("Deu forca! Jogar novamente?", {"Sim", "Nao"})
         exit
      endif

   enddo // loop tentativas

   if nOpcao == 2
      exit
   endif

enddo // loop tela inicial

clear
