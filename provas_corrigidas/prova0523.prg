// Luís Plinio Gabriel Campanholi dos Santos

set epoch to 1940
set date to british
set message to 23 center
set wrap on

nOpcao   := 0
nPedidos := 1

// Produtos
nCodigoProduto1         := 5500
cDescricaoProduto1      := "Amora preta"
nPrecoProduto1          := 1.50
nMaximoDescontoProduto1 := 12
nEstoqueProduto1        := 110

nCodigoProduto2         := 7744
cDescricaoProduto2      := "Uva Rubi"
nPrecoProduto2          := 8
nMaximoDescontoProduto2 := 11
nEstoqueProduto2        := 198.50

nCodigoProduto3         := 4445
cDescricaoProduto3      := "Pepino"
nMaximoDescontoProduto3 := 2
nPrecoProduto3          := 3.99
nEstoqueProduto3        := 445

nCodigoProduto4         := 6565
cDescricaoProduto4      := "Morango"
nPrecoProduto4          := 15.49
nMaximoDescontoProduto4 := 6
nEstoqueProduto4        := 200

// Usuarios
cUsuario1         := "luis"
cSenhaUsuario1    := "123"

cUsuario2         := "anaclaudia"
cSenhaUsuario2    := "89"

cUsuario3         := "reginaldo"
cSenhaUsuario3    := "0"

do while .t. // Loop login
   
   clear

   @ 01,01 say "              SEJA BEM-VINDO!"
   @ 02,01 say "---------------------------------------------"
   
   cUsuario := Space(20)
   cSenha   := Space(20)
   
   @ 03,01 say "Usuario..: "
   @ 04,01 say "Senha....: "
   
   @ 03,12 get cUsuario  valid !Empty(cUsuario)
   @ 04,12 get cSenha    valid !Empty(cSenha)
   read
      
   if LastKey() == 27
      nOpcao := Alert("Sair?", {"Sim", "Nao"})
      if nOpcao == 1
         exit
      endif
      loop
   endif
      
   // Validação usuário
   if !((cUsuario = cUsuario1 .and. cSenha = cSenhaUsuario1) .or. (cUsuario = cUsuario2 .and. cSenha = cSenhaUsuario2) .or. (cUsuario = cUsuario3 .and. cSenha = cSenhaUsuario3))
      Alert("Dados incorretos. Tente novamente. Dica: Tente 'luis' senha '123'")
      loop
   endif
      
   do while .t. // Loop menu

      clear

      @ 01,01 say "              FRUTARIA DO LUIS"
      @ 02,01 say "---------------------------------------------"

      nOpacaoMenu := 1

      @ 03,01 prompt "Efetuar pedidos"    message "Fazer novo pedido"
      @ 04,01 prompt "Sair"               message "Sair do programa"
      menu to nOpcaoMenu
   
      if Empty(nOpcaoMenu)
         nOpcaoMenu := 2
      endif
   
      if nOpcaoMenu == 1 // Pedidos

         do while .t.
               
            clear
               
            cNomeCliente         := Space(30)
            nLimiteCredito       := 0
            dPedido              := Date()
            nLinha               := 10
            nValorTotal          := 0
               
            @ 01,01 say "                             NOVO PEDIDO"
            @ 02,01 say "------------------------------------------------------------------------"
            @ 03,01 say "Pedido " + AllTrim(Str(nPedidos))
            @ 04,01 say "------------------------------------------------------------------------"
            @ 05,01 say "Nome do cliente....: "
            @ 06,01 say "Limite de credito..: "
            @ 07,01 say "Data do pedido.....: "
               
            @ 05,22 get cNomeCliente      picture "@!"            valid !Empty(cNomeCliente)
            @ 06,22 get nLimiteCredito    picture "@E 99999.99"   valid nLimiteCredito > 0
            @ 07,22 get dPedido                                   valid !Empty(dPedido) .and. dPedido <= Date()
            read
               
            if LastKey() == 27
               nOpcao := Alert("Cancelar pedido?", {"Sim", "Nao"})
               if nOpcao == 1
                  exit
               endif
               loop
            endif
                              
            do while .t. // Loop produtos
                     
               nCodigo              := 0
               nQuantidade          := 0
               nPorcentagemDesconto := 0
               nSubtotal            := 0
               cDescricao           := ""
               nPreco               := 0
               nMaximoDesconto      := 0
               nEstoque             := 0
      
               @ 08,01 say "------------------------------------------------------------------------"
               @ 09,01 say "Codigo  Descricao         Preco Unit.  Quantidade  Desconto(%)  Subtotal" 
               @ 16,01 say "------------------------------------------------------------------------"
               @ 17,01 say "Valor total..: "
               @ 18,01 say "Limite.......: "
               @ 17,16 say nValorTotal    picture "@E 99999.99"
               @ 18,16 say nLimiteCredito picture "@E 99999.99" color "g/n"
      
               @ nLinha,01 get nCodigo       picture "9999" valid !Empty(nCodigo)
               read
      
               if LastKey() == 27
                  nOpcao := Alert("Finalizar a compra?", {"Finalizar", "Voltar"})
                  if nOpcao == 1
                     exit
                  endif
                  loop
               endif
      
               // Buscar produto
               if nCodigo == nCodigoProduto1
                  cDescricao := cDescricaoProduto1
                  nPreco := nPrecoProduto1
                  nMaximoDesconto := nMaximoDescontoProduto1
                  nEstoque := nEstoqueProduto1
               elseif nCodigo == nCodigoProduto2
                  cDescricao := cDescricaoProduto2
                  nPreco := nPrecoProduto2
                  nMaximoDesconto := nMaximoDescontoProduto2
                  nEstoque := nEstoqueProduto2
               elseif nCodigo == nCodigoProduto3
                  cDescricao := cDescricaoProduto3
                  nPreco := nPrecoProduto3
                  nMaximoDesconto := nMaximoDescontoProduto3
                  nEstoque := nEstoqueProduto3
               elseif nCodigo == nCodigoProduto4
                  cDescricao := cDescricaoProduto4
                  nPreco := nPrecoProduto4
                  nMaximoDesconto := nMaximoDescontoProduto4
                  nEstoque := nEstoqueProduto4
               else
                  Alert("Codigo invalido.")
                  loop
               endif
      
               @ nLinha,09 say cDescricao
               @ nLinha,28 say nPreco picture "@E 99.99"
      
               @ nLinha,47 get nQuantidade            picture "999"  valid nQuantidade > 0
               @ nLinha,60 get nPorcentagemDesconto   picture "99"
               read
      
               if LastKey() == 27
                  nOpcao := Alert("Finalizar a compra?", {"Finalizar", "Voltar"})
                  if nOpcao == 1
                     exit
                  endif
                  loop
               endif
      
               if nPorcentagemDesconto > nMaximoDesconto
                  Alert("Desconto maximo atingido.")
                  @ nLinha,01 clear to nLinha,80
                  loop
               endif
      
               if nValorTotal > nLimiteCredito
                  Alert("Voce atingiu o limite de credito.")
                  @ nLinha,01 clear to nLinha,80
                  loop
               endif
      
               if nQuantidade > nEstoque
                  Alert("Nao ha quantidade suficiente.")
                  @ nLinha,01 clear to nLinha,80
                  loop
               endif
               
               // Tirar do estoque
               if nCodigo == nCodigoProduto1
                  nEstoqueProduto1 -= nQuantidade
               elseif nCodigo == nCodigoProduto2
                  nEstoqueProduto2 -= nQuantidade
               elseif nCodigo == nCodigoProduto3
                  nEstoqueProduto3 -= nQuantidade
               elseif nCodigo == nCodigoProduto4
                  nEstoqueProduto4 -= nQuantidade
               endif
      
               if !(nPorcentagemDesconto == 0)
                  nSubtotal := nQuantidade * nPreco
                  nSubtotal := nSubtotal - (nSubtotal * (nPorcentagemDesconto / 100))
               else
                  nSubtotal := nQuantidade * nPreco
               endif
      
               nValorTotal += nSubtotal
               nLimiteCredito -= nSubtotal
      
               @ nLinha,65 say nSubtotal  picture "@E 99999.99"
               @ 17,16 say nValorTotal    picture "@E 99999.99"
               @ 18,16 say nLimiteCredito picture "@E 99999.99" color "g/n"
      
               if nLinha >= 15
                  @ 20,01 say "Pressione qualquer tecla para continuar.."
                  InKey(0)
                  @ 10,01 clear to 25,80
                  nLinha := 10
               else
                  nLinha++
               endif
               
            enddo // Loop de produtos

            nPedidos++

         enddo // Loop de pedido
            
      elseif nOpcaoMenu == 2 // Sair

         nOpcao := Alert("Fazer logout?", {"Sim", "Nao"})
         if nOpcao == 1
            exit
         endif

      endif
   
   enddo // Loop de Menu
      
enddo // Loop de login

clear
