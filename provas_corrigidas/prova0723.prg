// Luís Plinio Gabriel Campanholi dos Santos

set epoch to 1940
set date to british
set message to 23 center
set wrap on

nOpcao                        := 0
nOrdemDeServico               := 0
cFormasDePagamentoRealizadas  := ""

// Usuarios
cUsuario1         := "ADMIN"
cSenhaUsuario1    := "123"

do while .t. // Loop login
   
   clear

   @ 01,01 say "            ASSISTENCIA TECNICA"
   @ 02,01 say "---------------------------------------------"
   
   cUsuario := Space(20)
   cSenha   := Space(20)
   
   @ 03,01 say "Usuario..: "
   @ 04,01 say "Senha....: "
   
   @ 03,12 get cUsuario  valid !Empty(cUsuario)
   @ 04,12 get cSenha    valid !Empty(cSenha)
   read
   
   if LastKey() == 27
      nOpcao := Alert("Deseja sair?", {"Sim", "Nao"})
      if nOpcao == 1
         exit
      endif
      loop
   endif
   
   // Validação usuário
   if (cUsuario = cUsuario1 .and. cSenha = cSenhaUsuario1)
      
      do while .t. // Loop menu

         clear

         @ 01,01 say "            ASSISTENCIA TECNICA"
         @ 02,01 say "---------------------------------------------"

         nOpacaoMenu := 1

         @ 03,01 prompt "Efetuar pedidos"    message "Fazer novo pedido"
         @ 04,01 prompt "Sair"               message "Sair do programa"
         menu to nOpcaoMenu
   
         if Empty(nOpcaoMenu)
            nOpcaoMenu := 2
         endif
   
         if nOpcaoMenu == 1 // Ordem de Serviço

            do while .t.
               
               clear
               
               cNomeCliente                 := Space(40)
               dOrdemServico                := Date()
               cNomeTecnico                 := Space(30)
               cDescricaoEquipamento        := Space(40)
               dCompraEquipamento           := CToD("")
               cEntregaDomicilio            := Space(1)
               nLimiteCredito               := 0
               cEndereco                    := Space(40)
               cBairro                      := Space(20)
               cReferencia                  := Space(30)
               cTelefone                    := Space(15)
               cProdutosOuServicos          := Space(1)
               cFormaDePagamento            := Space(1)
               cSenhaSupervisor             := Space(20)
               nLinhaProduto                := 07
               nLinhaServico                := 16
               nTaxaDeEntrega               := 0.03
               nSubtotalTodosProdutos       := 0
               nSubtotalTodosServicos       := 0
               nValorTotalOrdemDeServico    := 0
               nComissaoDoTecnico           := 0
               nTempoVidaEquipamento        := 0 // Em anos
               
               @ 01,01 say "                        NOVA ORDEM DE SERVICO"
               @ 02,01 say "--------------------------------------------------------------------------"
               @ 03,01 say "Ordem de Servico " + Transform(nOrdemDeServico, "99999999")
               @ 04,01 say "--------------------------------------------------------------------------"
               @ 05,01 say "Nome do cliente...........: "
               @ 06,01 say "Data Ordem de Serviço.....: "
               @ 07,01 say "Nome do Tecnico...........: "
               @ 08,01 say "Descricao do equipamento..: "
               @ 09,01 say "Data da compra............: "
               @ 10,01 say "Entrega em domicilio......?  [S]im [N]ao       Limite de credito:"
               
               @ 05,29 get cNomeCliente            picture "@!"            valid !Empty(cNomeCliente)
               @ 06,59 get dOrdemServico                                   valid !Empty(dOrdemServico) .and. dOrdemServico <= Date()
               @ 07,29 get cNomeTecnico            picture "@!"            valid !Empty(cNomeTecnico)
               @ 08,29 get cDescricaoEquipamento   picture "@!"            valid !Empty(cDescricaoEquipamento)
               @ 09,29 get dCompraEquipamento                              valid !Empty(dCompraEquipamento) .and. dCompraEquipamento <= Date()
               @ 10,29 get cEntregaDomicilio       picture "@!"            valid cEntregaDomicilio $ "SN"
               @ 10,42 get nLimiteCredito          picture "@E 99999.99"   valid nLimiteCredito > 0
               read
               
               if LastKey() == 27
                  nOpcao := Alert("Cancelar Ordem de Servico?", {"Sim", "Nao"})
                  if nOpcao == 1
                     exit
                  endif
                  loop
               endif

               // Tempo de vida do equipamento
               nTempoVidaEquipamento := Year(dCompraEquipamento) - Year(Date())

               nMesCompraEquipamento   := Month(dCompraEquipamento)
               nMesAtual               := Month(Date())
               nDiaCompraEquipamento   := Day(dCompraEquipamento)
               nDiaAtual               := Day(Date())

               if nMesAtual <= nMesCompraEquipamento .and. nDiaAtual < nDiaCompraEquipamento
                  nTempoVidaEquipamento--
              endif

               // Entrega
               if cEntregaDomicilio == "S"
                  @ 11,01 say "--------------------------------------------------------------------------"
                  @ 12,01 say "                          DADOS DE ENTREGA"
                  @ 13,01 say "--------------------------------------------------------------------------"
                  @ 14,01 say "Endereco....: "
                  @ 15,01 say "Bairro......: "
                  @ 16,01 say "Referencia..: "
                  @ 17,01 say "Telefone....: "

                  @ 14,15 get cEndereco      picture "@!"      valid !Empty(cEndereco)
                  @ 15,15 get cBairro        picture "@!"      valid !Empty(cBairro)
                  @ 16,15 get cReferencia    picture "@!"      valid !Empty(cReferencia)
                  @ 17,15 get cTelefone      picture "@!"      valid !Empty(cTelefone)
                  read

                  if LastKey() == 27
                     nOpcao := Alert("Cancelar Ordem de Servico?", {"Sim", "Nao"})
                     if nOpcao == 1
                        exit
                     endif
                     loop
                  endif
               endif

               @ 20,01 say "Digite qualquer tecla para continuar.."
               InKey(0)

               clear
                              
               // Tela de cadastro de produtos e serviços
                  @ 01,01 say "O que deseja cadastrar?....  [P]RODUTOS [S]ERVICOS"
                  @ 03,01 say "                               PRODUTOS"
                  @ 04,01 say "--------------------------------------------------------------------------"
                  @ 05,01 say "Descricao do produto        Quantidade  Preco Unit.  Desconto(%)  Subtotal"
                  @ 06,01 say "--------------------------------------------------------------------------"
               // @ 07,01 cadastro de produto
               // @ 08,01 cadastro de produto
               // @ 09,01 cadastro de produto
               // @ 10,01 cadastro de produto
                  @ 11,01 say "--------------------------------------------------------------------------"
                  @ 12,01 say "                               SERVICOS"
                  @ 13,01 say "--------------------------------------------------------------------------"
                  @ 14,01 say "Descricao do servico  Comissao Tec.(%)  Valor        Desconto(%)  Subtotal"
                  @ 15,01 say "--------------------------------------------------------------------------"
               // @ 16,01 cadastro de serviço
               // @ 17,01 cadastro de serviço
               // @ 18,01 cadastro de serviço
               // @ 19,01 cadastro de serviço
                  @ 20,01 say "--------------------------------------------------------------------------"
                  @ 21,01 say "Valor total..: "
                  @ 22,01 say "Limite.......: "
                  @ 21,16 say nValorTotalOrdemDeServico     picture "@E 99999.99"
                  @ 22,16 say nLimiteCredito                picture "@E 99999.99" color "g/n"

               do while .t. // Produtos e Serviços
                  
                  // Produto ou Serviço?
                  @ 01,29 get cProdutosOuServicos  picture "@!" valid cProdutosOuServicos $ "PS"
                  read
                  if LastKey() == 27
                     nOpcao := Alert("Cancelar Ordem de Servico?", {"Sim", "Nao"})
                     if nOpcao == 1
                        exit
                     endif
                     loop
                  endif

                  if cProdutosOuServicos == "P" // Cadastro de Produtos

                     do while .t. // Loop produtos

                        cDescricaoProduto             := Space(25)
                        nQuantidadeProduto            := 0
                        nPrecoProduto                 := 0
                        nPorcentagemDescontoProduto   := 0
                        nSubtotalProduto              := 0
                        lGarantiaProdutos             := .f.
            
                        @ nLinhaProduto,01 get cDescricaoProduto           picture "@!"            valid !Empty(cDescricaoProduto)
                        @ nLinhaProduto,29 get nQuantidadeProduto          picture "999"           valid nQuantidade > 0
                        @ nLinhaProduto,54 get nPrecoProduto               picture "@E 9999.99"
                        @ nLinhaProduto,60 get nPorcentagemDescontoProduto picture "99"
                        read
            
                        if LastKey() == 27
                           nOpcao := Alert("Voltar para o tipo de cadastro?", {"Voltar", "Continuar"})
                           if nOpcao == 1
                              exit
                           endif
                           loop
                        endif
                        
                        // Subtotal Produto
                        if !(nPorcentagemDesconto == 0)
                           nSubtotalProduto := nQuantidadeProduto * nPrecoProduto
                           nSubtotalProduto -= nSubtotalProduto * (nPorcentagemDesconto / 100)
                        else
                           nSubtotalProduto := nQuantidadeProduto * nPrecoProduto
                        endif

                        // Garantia
                        if nTempoVidaEquipamento <= 2
                           Alert("O produto esta na garantia! O produto nao tera custo.")
                           nSubtotalProduto := 0
                        endif
            
                        nValorTotalOrdemDeServico += nSubtotalProduto
                        nLimiteCredito -= nSubtotalProduto
            
                        @ nLinhaProduto,67 say nSubtotalProduto  picture "@E 99999.99"
                        @ 21,01 say "Valor total..: "
                        @ 22,01 say "Limite.......: "
                        @ 21,16 say nValorTotalOrdemDeServico     picture "@E 99999.99"
                        @ 22,16 say nLimiteCredito                picture "@E 99999.99" color "g/n"

                        // Limite de crédito
                        if nValorTotalOrdemDeServico >= nLimiteCredito
                           Alert("Limite de credito atingido.")
                           @ 23,01 say "Senha do Supervisor..: "
                           
                           @ 23,24 get cSenhaSupervisor picture "@!" valid !Empty(cSenhaSupervisor) color "w/w"
                           read
                           if cSenhaSupervisor = "123LIBERA"
                              Alert("Compra liberada.")
                              loop
                           else
                              Alert("Senha incorreta.")
                              exit
                           endif
                        endif
            
                        if nLinhaProduto >= 10
                           @ 25,01 say "Pressione qualquer tecla para continuar.."
                           InKey(0)
                           @ 07,01 clear to 10,80
                           @ 16,01 clear to 19,80
                           nLinhaProduto := 07
                        else
                           nLinhaProduto++
                        endif
                     
                     enddo // Loop de produtos
                  
                  elseif cProdutosOuServicos == "S" // Cadastro de Serviços

                     do while .t. // Loop de serviços

                        cDescricaoServico             := Space(25)
                        nValorServico                 := 0
                        nPorcentagemComissaoTecnico   := 0
                        nPorcentagemDescontoServico   := 0
                        nSubtotalServico              := 0
                        lGarantiaServicos             := .f.
            
                        @ nLinhaServico,01 get cDescricaoServico              picture "@!"            valid !Empty(cDescricaoProduto)
                        @ nLinhaServico,29 get nPorcentagemComissaoTecnico    picture "999"           valid nQuantidade > 0
                        @ nLinhaServico,54 get nValorServico                  picture "@E 9999.99"
                        @ nLinhaServico,60 get nPorcentagemDescontoServico    picture "99"
                        read
            
                        if LastKey() == 27
                           nOpcao := Alert("Voltar para o tipo de cadastro?", {"Voltar", "Continuar"})
                           if nOpcao == 1
                              exit
                           endif
                           loop
                        endif

                        // Subtotal Serviço
                        if !(nPorcentagemDesconto == 0)
                           nSubtotalServico := nValorServico * (nPorcentagemDesconto / 100)
                        else
                           nSubtotalServico := nValorServico
                        endif

                        // Garantia
                        if nTempoVidaEquipamento <= 1
                           Alert("O produto esta na garantia! O servico nao tera custo.")
                           nSubtotalServico := 0
                        endif

                        nValorTotalOrdemDeServico += nSubtotalServico
                        nLimiteCredito -= nSubtotalServico
                        nComissaoDoTecnico += Subtotal * (nPorcentagemComissaoTecnico / 100)
            
                        @ nLinhaServico,67 say nSubtotalServico   picture "@E 99999.99"
                        @ 21,01 say "Valor total..: "
                        @ 22,01 say "Limite.......: "
                        @ 21,16 say nValorTotalOrdemDeServico     picture "@E 99999.99"
                        @ 22,16 say nLimiteCredito                picture "@E 99999.99" color "g/n"

                        // Limite de crédito
                        if nValorTotalOrdemDeServico >= nLimiteCredito
                           Alert("Limite de credito atingido.")
                           @ 23,01 say "Senha do Supervisor..: "
                           
                           @ 23,24 get cSenhaSupervisor picture "@!" valid !Empty(cSenhaSupervisor) color "w/w"
                           read
                           if cSenhaSupervisor = "123LIBERA"
                              Alert("Compra liberada.")
                              loop
                           else
                              Alert("Senha incorreta.")
                              exit
                           endif
                        endif

                        // Controle de linha
                        if nLinhaServico >= 19
                           @ 25,01 say "Pressione qualquer tecla para continuar.."
                           InKey(0)
                           @ 16,01 clear to 19,80
                           @ 25,01 clear to 25,01
                           nLinhaServico := 16
                        else
                           nLinhaServico++
                        endif
                     
                     enddo // Loop de serviços
                     
                  endif
                  
               enddo // Loop Produtos e Serviços
               
               @ 25,01 say "Pressione qualquer tecla para continuar.."
               InKey(0)
               
               do while .t. // Forma de pagamento

                  clear

                  nCNPJ       := 0
                  nNumeroNota := 0
                  dNota       := CToD("")
                  
                  @ 01,01 say "                           FORMA DE PAGAMENTO"
                  @ 02,01 say "--------------------------------------------------------------------------"
                  @ 03,01 say "Forma de pagamento:  [D]INHEIRO, C[H]EQUE, [C]ARTAO"

                  @ 03,21 get cFormaDePagamento picture "@!" valid cFormaDePagamento $ "DHC"
                  read

                  if LastKey() == 27
                     nOpcao := Alert("Cancelar a ordem de servico?", {"Sim", "Nao"})
                     if nOpcao == 1
                        exit
                     endif
                     loop
                  endif

                  // Verificar forma de pagamento
                  if cFormaDePagamento $ cFormasDePagamentoRealizadas
                     Alert("Voce ja pagou desta forma. Selecione outra forma de pagamento")
                     loop
                  endif

                  // Taxa de entrega em domicílio
                  if cEntregaDomicilio == "S"
                     nValorTotalOrdemDeServico *= nTaxaDeEntrega
                  endif

                  @ 10,01 say "--------------------------------------------------------------------------"
                  @ 11,01 say "Valor total da ordem de servico..: "
                  @ 12,01 say "Limite de credito................: "
                  @ 13,01 say "Comissao do tecnico..............: "
                  @ 14,01 say "--------------------------------------------------------------------------"
                  @ 11,36 say nValorTotalOrdemDeServico
                  @ 12,36 say nLimiteCredito
                  @ 13,36 say nComissaoDoTecnico

                  if nValorTotalOrdemDeServico == 0
                     Alert("A ordem de servico e gratuita. Preencha os dados da nota fiscal")
                     @ 15,01 say "--------------------------------------------------------------------------"
                     @ 16,01 say "                       DADOS PARA NOTA FISCAL"
                     @ 17,01 say "--------------------------------------------------------------------------"
                     @ 18,01 say "CNPJ............: "
                     @ 19,01 say "Numero da nota..: "
                     @ 20,01 say "Data da nota....: "

                     @ 18,19 get nCNPJ          picture "99999999999999"   valid !Empty(nCNPJ)
                     @ 19,19 get nNumeroNota    picture "9999999999"       valid !Empty(nNumeroNota)
                     @ 20,19 get dNota                                     valid !Empty(dNota)
                     read

                     if LastKey() == 27
                        nOpcao := Alert("Cancelar a ordem de servico?", {"Sim", "Nao"})
                        if nOpcao == 1
                           exit
                        endif
                        loop
                     endif
                  endif
                  
                  @ 21,01 say "--------------------------------------------------------------------------"
                  @ 22,01 say "               ORDEM DE SERVICO REALIZADA COM SUCESSO!"
                  @ 23,01 say "--------------------------------------------------------------------------"
                  @ 25,01 say "Pressione qualquer tecla para continuar.."

                  InKey(0)

                  exit

               enddo // Loop forma de pagamento

               nOrdemDeServico++

            enddo // Loop Ordem de Serviço
            
         elseif nOpcaoMenu == 2 // Sair

            nOpcao := Alert("Fazer logout?", {"Sim", "Nao"})
            if nOpcao == 1
               exit
            endif

         endif
   
      enddo // Loop de Menu

   else
      Alert("Dados incorretos. Tente novamente. Dica: Tente 'ADMIN' senha '123'")
      loop
   endif
      
enddo // Loop de login

clear
