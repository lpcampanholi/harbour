set epoch to 1940
set date to british

do while .t.
   
   clear
    
   cNome         := Space(30)
   dCompra       := Date()
   dEntrega      := CtoD("")
   nLimiteTotal  := 0
   nLimite       := 0
   nValorTotal   := 0
   cCorLimite    := "g/n"
   cEndereco     := Space(30)
   
   @ 01,01 say Replicate(" ", 17) + "Supermercado Itamarati"
   @ 03,01 say "Nome: "
   @ 03,40 say "Data: "
   @ 04,01 say "Limite: "
   
   @ 03,06 get cNome        picture "@!"          valid !Empty(cNome)
   @ 03,46 get dCompra                            valid !Empty(dCompra) .and. dCompra <= Date()
   @ 04,09 get nLimiteTotal picture "@E 9999.99"  valid !Empty(nLimiteTotal) .and. nLimiteTotal > 0
   read

   if LastKey() == 27
      nOpcao := Alert("Deseja sair?", {"Sim", "Nao"})
      if nOpcao == 1
          exit
      endif
      loop
  endif

  nLimite  := nLimiteTotal
   
   @ 05,01 say Replicate("-", 53)
   @ 06,01 say "Cod  Produto                    Qtd   Preco   Valor"
   @ 07,01 say Replicate("-", 53)
   @ 13,01 say Replicate("-", 53)
   @ 14,01 say "Total...: "
   @ 14,11 say nValorTotal picture "@E 9999.99"
   @ 15,01 say "Limite..: "
   @ 15,11 say nLimite picture "@E 9999.99" color cCorLimite
   @ 16,01 say Replicate("-", 53)

   // CADASTRO PRODUTOS
   dEntrega := dCompra + 3
   nCodigo  := 1
   nLinha   := 8

   do while .t.
      cProduto      := Space(20)
      nPreco        := 0
      nQuantidade   := 0
      nValor        := 0
      
      @ nLinha,01 say nCodigo       picture "999"
      @ nLinha,06 get cProduto      picture "@!"          valid !Empty(cProduto)
      @ nLinha,33 get nQuantidade   picture "999"         valid nQuantidade > 0 .and. nQuantidade <= 999
      @ nLinha,39 get nPreco        picture "@E 9999.99"  valid nPreco > 0 .and. nPreco <= 9999.99
      read
      
      if LastKey() == 27
         nOpcao := Alert("Deseja finalizar a compra?", {"Finalizar Compra", "Cancelar Compra"})
         if nOpcao == 1 .or. nOpcao == 2
            exit
         endif
         loop
      endif
      
      nValor := nPreco * nQuantidade
      nValorTotal += nValor
      nLimite -= nValor
      nCodigo++
      
      if nLimite < nValorTotal
         cCorLimite := "r/n"
      endif
      
      @ nLinha,47 say nValor        picture "@E 9999.99"
      @ 14,11     say nValorTotal   picture "@E 9999.99"
      @ 15,11     say nLimite       picture "@E 9999.99" color cCorLimite
      
      if nLinha >= 12
         nLinha := 8
         @ 08,01 clear to 12,53
      else
         nLinha++
      endif
      
   enddo

   if nOpcao == 2
      loop
   endif

   // ENTREGA
   @ 17,01 say Replicate(" ", 17) + "Informacoes de Entrega"
   @ 18,01 say Replicate("-", 53)
   @ 19,01 say "Endereco.........: "
   @ 20,01 say "Data de Entrega..: "
   
   @ 19,20 get cEndereco picture "@!" valid !Empty(cEndereco)
   @ 20,20 get dEntrega               valid !Empty(dEntrega) .and. dEntrega >= dCompra + 3
   read

   @ 22,01 say Replicate("-", 53)
   @ 23,01 say Replicate(" ", 12) + "Compra realizada com sucesso!"
   InKey(0)

enddo

clear
