
//Michel Colognese Bocchi Junior

set scoreboard off
set date brit
set epoch to 1940
set message to 21 center
set wrap on

cUsuario1             := ''
cUsuario2             := ''
cUsuario3             := ''
cUsuario4             := ''
cUsuario5             := ''
cUsuario6             := ''
cUsuario7             := ''
cUsuario8             := ''
cUsuario9             := ''
cUsuario10            := ''
cUsuario11            := ''
cUsuario12            := ''
cUsuario13            := ''
cUsuario14            := ''
cUsuario15            := ''
dAtual                := date()
cDataAtual            := DtoC(dAtual)
cDisponibilidade      := 'D'

do while .t.

   set color to W/BG+

   clear

   @ 00,70 say PadR(cDataAtual,10)

   set color to W/N

   nLinha                    := 01
   nColuna                   := 01
   nOpcao                    := 0

   @   nLinha,nColuna to nLinha+7,nColuna+27
   @   20    ,nColuna to 22      ,nColuna+77 double
   @   21    , 02    clear to  21,77

   @ ++nLinha,++nColuna prompt 'Manutencao de Usuarios    ' message 'Manutencao de Usuarios'
   @ ++nLinha,  nColuna prompt 'Manutencao de Livros      ' message 'Manutencao de Livros'
   @ ++nLinha,  nColuna prompt 'Emprestimo de Livros      ' message 'Realizar a Locacao de Livros'
   @ ++nLinha,  nColuna prompt 'Devolucao de Livros       ' message 'Realizar a Devolucao de Livros'
   @ ++nLinha,  nColuna prompt 'Relatorio de Movimentacoes' message 'Relacao das Ultimas Movimentacoes'
   @ ++nLinha,  nColuna prompt 'Sair                      ' message 'Fechar Siatema'
   menu to nOpcao

   if lastkey() == 27
      exit
   endif

   do while .t.

      set color to W/B

      @   10 , 03  clear to 18,76
      @   10 , 03        to 18,76

      cUsuario                  := space (3)
      cNomeUsuario              := space (60)
      cEnderecoUsuario          := space (60)
      cIdadeUsuario             := space (3)
      cAnoLancamento            := space (4)
      cNomeLivro                := space (60)
      cEscritor                 := space (60)
      cEditora                  := space (20)
      cCodigoLivro              := space (3)
      nCodigoUsuario            := 0

      if nOpcao == 1

         nLinha  := 10
         nColuna := 3

         @ ++ nLinha,nColuna+=2 say 'Codigo..:'
         @ nLinha+=2,nColuna    say 'Nome....:'
         @ ++ nLinha,nColuna    say 'Idade...:'
         @ ++ nLinha,nColuna    say 'Endereco:'

         @ nLinha-=4,nColuna+=10    get cUsuario picture '999' valid !empty(cUsuario)
         read

         if lastkey() == 27
            exit
         endif

         if cUsuario == Substr(cUsuario1,1,3)

            cNomeUsuario    := substr(cUsuario1,4,60)
            cIdadeUsuario   := substr(cUsuario1,64,3)
            cEnderecoUsuario:= substr(cUsuario1,67,60)
            nUsuario        := 1

         elseif cUsuario == Substr(cUsuario2,1,3)

            cNomeUsuario    := substr(cUsuario2,4,60)
            cIdadeUsuario   := substr(cUsuario2,64,3)
            cEnderecoUsuario:= substr(cUsuario2,67,60)
            nUsuario        := 2

         elseif cUsuario == Substr(cUsuario3,1,3)

            cNomeUsuario    := substr(cUsuario3,4,60)
            cIdadeUsuario   := substr(cUsuario3,64,3)
            cEnderecoUsuario:= substr(cUsuario3,67,60)
            nUsuario        := 3

         elseif cUsuario == Substr(cUsuario4,1,3)

            cNomeUsuario    := substr(cUsuario4,4,60)
            cIdadeUsuario   := substr(cUsuario4,64,3)
            cEnderecoUsuario:= substr(cUsuario4,67,60)
            nUsuario        := 4

         elseif cUsuario == Substr(cUsuario5,1,3)

            cNomeUsuario    := substr(cUsuario5,4,60)
            cIdadeUsuario   := substr(cUsuario5,64,3)
            cEnderecoUsuario:= substr(cUsuario5,67,60)
            nUsuario        := 5

         else
            if empty(cUsuario1)
               cUsuario1 := cUsuario
               nUsuario  := 1
            elseif empty(cUsuario2)
               cUsuario2 := cUsuario
               nUsuario  := 2
            elseif empty(cUsuario3)
               cUsuario3 := cUsuario
               nUsuario  := 3
            elseif empty(cUsuario4)
               cUsuario4 := cUsuario
               nUsuario  := 4
            elseif empty(cUsuario5)
               cUsuario5 := cUsuario
               nUsuario  := 5
            else
               alert('Limite de usuarios atingido!')
               loop
            endif
         endif

         @ nLinha+=2,nColuna    get cNomeUsuario        picture '@!'  valid !empty(cNomeUsuario)
         @ ++ nLinha,nColuna    get cIdadeUsuario       picture '999' valid !empty(cIdadeUsuario)
         @ ++ nLinha,nColuna    get cEnderecoUsuario    picture '@!'  valid !empty(cEnderecoUsuario)
         read

         if lastkey() == 27
            loop
         endif

         if nUsuario == 1

            cUsuario1 += cNomeUsuario + cIdadeUsuario + cEnderecoUsuario

         elseif nUsuario == 2

            cUsuario2 += cNomeUsuario + cIdadeUsuario + cEnderecoUsuario

         elseif nUsuario == 3

            cUsuario3 += cNomeUsuario + cIdadeUsuario + cEnderecoUsuario

         elseif nUsuario == 4

            cUsuario4 += cNomeUsuario + cIdadeUsuario + cEnderecoUsuario

         elseif nUsuario == 5

            cUsuario5 += cNomeUsuario + cIdadeUsuario + cEnderecoUsuario

         endif

         @ 21,02 say padc('Alteracoes realizadas com sucesso!!!',74) color ('G/N')

         inkey (0)

         @ 21,02 say padc('Manutencao de Usuarios',74) color ('W/N')

      elseif nOpcao == 2

         nLinha  := 10
         nColuna := 3

         @ ++ nLinha,nColuna+=2 say 'Codigo..:'
         @ nLinha+=2,nColuna    say 'Nome....:'
         @ ++ nLinha,nColuna    say 'Escritor:'
         @ ++ nLinha,nColuna    say 'Editora.:'
         @    nLinha,nColuna+31 say 'Ano de Lancamento:'
         @ nLinha+2 ,nColuna    say 'Status..:'

         @ nLinha-=4,nColuna+=10    get cUsuario picture '999' valid !empty(cUsuario)
         read

         if lastkey() == 27
            exit
         endif

         if cUsuario == Substr(cUsuario11,1,3)

            cNomeLivro      := substr(cUsuario11,4,60)
            cEscritor       := substr(cUsuario11,64,60)
            cEditora        := substr(cUsuario11,124,20)
            cAnoLancamento  := substr(cUsuario11,144,4)
            cStatus         := substr(cUsuario11,148,1)
            nUsuario        := 1

         elseif cUsuario == Substr(cUsuario12,1,3)

            cNomeLivro      := substr(cUsuario12,4,60)
            cEscritor       := substr(cUsuario12,64,60)
            cEditora        := substr(cUsuario12,124,20)
            cAnoLancamento  := substr(cUsuario12,144,4)
            cStatus         := substr(cUsuario12,148,1)
            nUsuario        := 2

         elseif cUsuario == Substr(cUsuario13,1,3)

            cNomeLivro      := substr(cUsuario13,4,60)
            cEscritor       := substr(cUsuario13,64,60)
            cEditora        := substr(cUsuario13,124,20)
            cAnoLancamento  := substr(cUsuario13,144,4)
            cStatus         := substr(cUsuario13,148,1)
            nUsuario        := 3

         elseif cUsuario == Substr(cUsuario14,1,3)

            cNomeLivro      := substr(cUsuario14,4,60)
            cEscritor       := substr(cUsuario14,64,60)
            cEditora        := substr(cUsuario14,124,20)
            cAnoLancamento  := substr(cUsuario14,144,4)
            cStatus         := substr(cUsuario14,148,1)
            nUsuario        := 4

         elseif cUsuario == Substr(cUsuario15,1,3)

            cNomeLivro      := substr(cUsuario15,4,60)
            cEscritor       := substr(cUsuario15,64,60)
            cEditora        := substr(cUsuario15,124,20)
            cAnoLancamento  := substr(cUsuario15,144,4)
            cStatus         := substr(cUsuario15,148,1)
            nUsuario        := 5

         elseif cUsuario == Substr(cUsuario6,1,3)

            cNomeLivro      := substr(cUsuario6,4,60)
            cEscritor       := substr(cUsuario6,64,60)
            cEditora        := substr(cUsuario6,124,20)
            cAnoLancamento  := substr(cUsuario6,144,4)
            cStatus         := substr(cUsuario6,148,1)
            nUsuario        := 6

         elseif cUsuario == Substr(cUsuario7,1,3)

            cNomeLivro      := substr(cUsuario7,4,60)
            cEscritor       := substr(cUsuario7,64,60)
            cEditora        := substr(cUsuario7,124,20)
            cAnoLancamento  := substr(cUsuario7,144,4)
            cStatus         := substr(cUsuario7,148,1)
            nUsuario        := 7

         elseif cUsuario == Substr(cUsuario8,1,3)

            cNomeLivro      := substr(cUsuario8,4,60)
            cEscritor       := substr(cUsuario8,64,60)
            cEditora        := substr(cUsuario8,124,20)
            cAnoLancamento  := substr(cUsuario8,144,4)
            cStatus         := substr(cUsuario8,148,1)
            nUsuario        := 8

         elseif cUsuario == Substr(cUsuario9,1,3)

            cNomeLivro      := substr(cUsuario9,4,60)
            cEscritor       := substr(cUsuario9,64,60)
            cEditora        := substr(cUsuario9,124,20)
            cAnoLancamento  := substr(cUsuario9,144,4)
            cStatus         := substr(cUsuario9,148,1)
            nUsuario        := 9

         elseif cUsuario == Substr(cUsuario10,1,3)

            cNomeLivro      := substr(cUsuario10,4,60)
            cEscritor       := substr(cUsuario10,64,60)
            cEditora        := substr(cUsuario10,124,20)
            cAnoLancamento  := substr(cUsuario10,144,4)
            cStatus         := substr(cUsuario10,148,1)
            nUsuario        := 10

         else

            cStatus := cDisponibilidade

            if empty(cUsuario11)
               cUsuario11 := cUsuario
               nUsuario  := 1
            elseif empty(cUsuario12)
               cUsuario12 := cUsuario
               nUsuario  := 2
            elseif empty(cUsuario13)
               cUsuario3 := cUsuario
               nUsuario  := 3
            elseif empty(cUsuario14)
               cUsuario4 := cUsuario
               nUsuario  := 4
            elseif empty(cUsuario15)
               cUsuario5 := cUsuario
               nUsuario  := 5
            elseif empty(cUsuario6)
               cUsuario6 := cUsuario
               nUsuario  := 6
            elseif empty(cUsuario7)
               cUsuario7 := cUsuario
               nUsuario  := 7
            elseif empty(cUsuario8)
               cUsuario8 := cUsuario
               nUsuario  := 8
            elseif empty(cUsuario9)
               cUsuario9 := cUsuario
               nUsuario  := 9
            elseif empty(cUsuario10)
               cUsuario10 := cUsuario
               nUsuario  := 10
            else
               alert('Limite de usuarios atingido!')
               loop
            endif
         endif

         if cStatus == 'D'
            cStatus := 'Disponivel'
            cCor    := 'W/G'
         else
            cStatus := 'Emprestado'
            cCor    := 'W/R'
         endif

         @ 17,nColuna           say cStatus color (cCor)

         @ nLinha+=2,nColuna    get cNomeLivro          picture '@!'    valid !empty(cNomeLivro)
         @ ++ nLinha,nColuna    get cEscritor           picture '@!'    valid !empty(cEscritor)
         @ ++ nLinha,nColuna    get cEditora            picture '@!'    valid !empty(cEditora)
         @    nLinha,nColuna+39 get cAnoLancamento      picture '9999'  valid !empty(cAnoLancamento)
         read

         if lastkey() == 27
            loop
         endif

         if nUsuario == 1

            cUsuario11 += cNomeLivro + cEscritor + cEditora + cAnoLancamento + cDisponibilidade

         elseif nUsuario == 2

            cUsuario12 += cNomeLivro + cEscritor + cEditora + cAnoLancamento + cDisponibilidade

         elseif nUsuario == 3

            cUsuario13 += cNomeLivro + cEscritor + cEditora + cAnoLancamento + cDisponibilidade

         elseif nUsuario == 4

            cUsuario14 += cNomeLivro + cEscritor + cEditora + cAnoLancamento + cDisponibilidade

         elseif nUsuario == 5

            cUsuario15 += cNomeLivro + cEscritor + cEditora + cAnoLancamento + cDisponibilidade

         elseif nUsuario == 6

            cUsuario6  += cNomeLivro + cEscritor + cEditora + cAnoLancamento + cDisponibilidade

         elseif nUsuario == 7

            cUsuario7  += cNomeLivro + cEscritor + cEditora + cAnoLancamento + cDisponibilidade

         elseif nUsuario == 8

            cUsuario8  += cNomeLivro + cEscritor + cEditora + cAnoLancamento + cDisponibilidade

         elseif nUsuario == 9

            cUsuario9  += cNomeLivro + cEscritor + cEditora + cAnoLancamento + cDisponibilidade

         elseif nUsuario == 10

            cUsuario10 += cNomeLivro + cEscritor + cEditora + cAnoLancamento + cDisponibilidade

         endif

         @ 21,02 say padc('Alteracoes realizadas com sucesso!!!',74) color ('G/N')

         inkey(0)

         @ 21,02 say padc('Manutencao de Livros',74) color ('W/N')

      elseif nOpcao == 3

         nLinha  := 10
         nColuna := 3

         @ ++ nLinha,nColuna+=2 say 'CodigoLivro..:'
         @ ++ nLinha,nColuna    say 'CodigoUsuario:'

         @ nLinha-=4,nColuna+=10    get cUsuario picture '999' valid !empty(cUsuario)
         read

         if lastkey() == 27
            exit
         endif

         if cUsuario == Substr(cUsuario11,1,3)

            cNomeLivro      := substr(cUsuario11,4,60)
            cDisponibilidade:= 'E'

         elseif cUsuario == Substr(cUsuario12,1,3)

            cNomeLivro      := substr(cUsuario12,4,60)
            cDisponibilidade:= 'E'

         elseif cUsuario == Substr(cUsuario13,1,3)

            cNomeLivro      := substr(cUsuario13,4,60)
            cDisponibilidade:= 'E'

         elseif cUsuario == Substr(cUsuario14,1,3)

            cNomeLivro      := substr(cUsuario14,4,60)
            cDisponibilidade:= 'E'

         elseif cUsuario == Substr(cUsuario15,1,3)

            cNomeLivro      := substr(cUsuario15,4,60)
            cDisponibilidade:= 'E'

         elseif cUsuario == Substr(cUsuario6,1,3)

            cNomeLivro      := substr(cUsuario6,4,60)
            cDisponibilidade:= 'E'

         elseif cUsuario == Substr(cUsuario7,1,3)

            cNomeLivro      := substr(cUsuario7,4,60)
            cDisponibilidade:= 'E'

         elseif cUsuario == Substr(cUsuario8,1,3)

            cNomeLivro      := substr(cUsuario8,4,60)
            cDisponibilidade:= 'E'

         elseif cUsuario == Substr(cUsuario9,1,3)

            cNomeLivro      := substr(cUsuario9,4,60)
            cDisponibilidade:= 'E'

         elseif cUsuario == Substr(cUsuario10,1,3)

            cNomeLivro      := substr(cUsuario10,4,60)
            cDisponibilidade:= 'E'

         else
            alert('Codigo de livro invalido!')
            loop
         endif

         @ ++nLinha,nColuna+=10    get cUsuario picture '999' valid !empty(cUsuario)
         read

         if lastkey() == 27
            exit
         endif

         if cUsuario == Substr(cUsuario1,1,3)

            cNomeUsuario    := substr(cUsuario1,4,60)

         elseif cUsuario == Substr(cUsuario2,1,3)

            cNomeUsuario    := substr(cUsuario2,4,60)

         elseif cUsuario == Substr(cUsuario3,1,3)

            cNomeUsuario    := substr(cUsuario3,4,60)

         elseif cUsuario == Substr(cUsuario4,1,3)

            cNomeUsuario    := substr(cUsuario4,4,60)

         elseif cUsuario == Substr(cUsuario5,1,3)

            cNomeUsuario    := substr(cUsuario5,4,60)

         else
             alert('Codigo de Usuario invalido!')
             loop
         endif

      elseif nOpcao == 4

         nLinha  := 10
         nColuna := 3

         @ ++ nLinha,nColuna+=2 say 'Codigo..:'
         @ nLinha+=2,nColuna    say 'Nome....:'
         @ ++ nLinha,nColuna    say 'Idade...:'
         @ ++ nLinha,nColuna    say 'Endereco:'

         @ nLinha-=4,nColuna+=10    get cUsuario picture '999' valid !empty(cUsuario)
         read

         if lastkey() == 27
            exit
         endif

         if cUsuario == Substr(cUsuario1,1,3)

            cNomeUsuario    := substr(cUsuario1,4,nTamanhoNomeUsuario)
            cIdadeUsuario   := substr(cUsuario1,4 + nTamanhoNomeUsuario,nTamanhoIdadeUsuario)
            cEnderecoUsuario:= substr(cUsuario1,4 + nTamanhoNomeUsuario + nTamanhoIdadeUsuario,nTamanhoEnderecoUsuario)
            nUsuario        := 1

         elseif cUsuario == Substr(cUsuario2,1,3)

            cNomeUsuario    := substr(cUsuario2,4,nTamanhoNomeUsuario)
            cIdadeUsuario   := substr(cUsuario2,4 + nTamanhoNomeUsuario,nTamanhoIdadeUsuario)
            cEnderecoUsuario:= substr(cUsuario2,4 + nTamanhoNomeUsuario + nTamanhoIdadeUsuario,nTamanhoEnderecoUsuario)
            nUsuario        := 2

         elseif cUsuario == Substr(cUsuario3,1,3)

            cNomeUsuario    := substr(cUsuario3,4,nTamanhoNomeUsuario)
            cIdadeUsuario   := substr(cUsuario3,4 + nTamanhoNomeUsuario,nTamanhoIdadeUsuario)
            cEnderecoUsuario:= substr(cUsuario3,4 + nTamanhoNomeUsuario + nTamanhoIdadeUsuario,nTamanhoEnderecoUsuario)
            nUsuario        := 3

         elseif cUsuario == Substr(cUsuario4,1,3)

            cNomeUsuario    := substr(cUsuario4,4,nTamanhoNomeUsuario)
            cIdadeUsuario   := substr(cUsuario4,4 + nTamanhoNomeUsuario,nTamanhoIdadeUsuario)
            cEnderecoUsuario:= substr(cUsuario4,4 + nTamanhoNomeUsuario + nTamanhoIdadeUsuario,nTamanhoEnderecoUsuario)
            nUsuario        := 4

         elseif cUsuario == Substr(cUsuario5,1,3)

            cNomeUsuario    := substr(cUsuario5,4,nTamanhoNomeUsuario)
            cIdadeUsuario   := substr(cUsuario5,4 + nTamanhoNomeUsuario,nTamanhoIdadeUsuario)
            cEnderecoUsuario:= substr(cUsuario5,4 + nTamanhoNomeUsuario + nTamanhoIdadeUsuario,nTamanhoEnderecoUsuario)
            nUsuario        := 5

         else
            if empty(cUsuario1)
               cUsuario1 := cUsuario
               nUsuario  := 1
            elseif empty(cUsuario2)
               cUsuario2 := cUsuario
               nUsuario  := 2
            elseif empty(cUsuario3)
               cUsuario3 := cUsuario
               nUsuario  := 3
            elseif empty(cUsuario4)
               cUsuario4 := cUsuario
               nUsuario  := 4
            elseif empty(cUsuario5)
               cUsuario5 := cUsuario
               nUsuario  := 5
            else
               alert('Limite de usuarios atingido!')
               loop
            endif
         endif





      elseif nOpcao == 5


         nLinha  := 10
         nColuna := 3

         @ ++ nLinha,nColuna+=2 say 'Codigo..:'
         @ nLinha+=2,nColuna    say 'Nome....:'
         @ ++ nLinha,nColuna    say 'Idade...:'
         @ ++ nLinha,nColuna    say 'Endereco:'

         @ nLinha-=4,nColuna+=10    get cUsuario picture '999' valid !empty(cUsuario)
         read

         if lastkey() == 27
            exit
         endif

         if cUsuario == Substr(cUsuario1,1,3)

            cNomeUsuario    := substr(cUsuario1,4,nTamanhoNomeUsuario)
            cIdadeUsuario   := substr(cUsuario1,4 + nTamanhoNomeUsuario,nTamanhoIdadeUsuario)
            cEnderecoUsuario:= substr(cUsuario1,4 + nTamanhoNomeUsuario + nTamanhoIdadeUsuario,nTamanhoEnderecoUsuario)
            nUsuario        := 1

         elseif cUsuario == Substr(cUsuario2,1,3)

            cNomeUsuario    := substr(cUsuario2,4,nTamanhoNomeUsuario)
            cIdadeUsuario   := substr(cUsuario2,4 + nTamanhoNomeUsuario,nTamanhoIdadeUsuario)
            cEnderecoUsuario:= substr(cUsuario2,4 + nTamanhoNomeUsuario + nTamanhoIdadeUsuario,nTamanhoEnderecoUsuario)
            nUsuario        := 2

         elseif cUsuario == Substr(cUsuario3,1,3)

            cNomeUsuario    := substr(cUsuario3,4,nTamanhoNomeUsuario)
            cIdadeUsuario   := substr(cUsuario3,4 + nTamanhoNomeUsuario,nTamanhoIdadeUsuario)
            cEnderecoUsuario:= substr(cUsuario3,4 + nTamanhoNomeUsuario + nTamanhoIdadeUsuario,nTamanhoEnderecoUsuario)
            nUsuario        := 3

         elseif cUsuario == Substr(cUsuario4,1,3)

            cNomeUsuario    := substr(cUsuario4,4,nTamanhoNomeUsuario)
            cIdadeUsuario   := substr(cUsuario4,4 + nTamanhoNomeUsuario,nTamanhoIdadeUsuario)
            cEnderecoUsuario:= substr(cUsuario4,4 + nTamanhoNomeUsuario + nTamanhoIdadeUsuario,nTamanhoEnderecoUsuario)
            nUsuario        := 4

         elseif cUsuario == Substr(cUsuario5,1,3)

            cNomeUsuario    := substr(cUsuario5,4,nTamanhoNomeUsuario)
            cIdadeUsuario   := substr(cUsuario5,4 + nTamanhoNomeUsuario,nTamanhoIdadeUsuario)
            cEnderecoUsuario:= substr(cUsuario5,4 + nTamanhoNomeUsuario + nTamanhoIdadeUsuario,nTamanhoEnderecoUsuario)
            nUsuario        := 5

         else
            if empty(cUsuario1)
               cUsuario1 := cUsuario
               nUsuario  := 1
            elseif empty(cUsuario2)
               cUsuario2 := cUsuario
               nUsuario  := 2
            elseif empty(cUsuario3)
               cUsuario3 := cUsuario
               nUsuario  := 3
            elseif empty(cUsuario4)
               cUsuario4 := cUsuario
               nUsuario  := 4
            elseif empty(cUsuario5)
               cUsuario5 := cUsuario
               nUsuario  := 5
            else
               alert('Limite de usuarios atingido!')
               loop
            endif
         endif





      elseif nOpcao == 6
         exit
      endif


   enddo

   set color to W/BG+

   @ 11,02 clear to 22,76

   if nOpcao == 6 .or. nOpcao == 0
      exit
   endif

enddo


