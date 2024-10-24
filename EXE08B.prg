set epoch to 1940
set date to british

clear

cNomeCliente            := Space(40)
nIdadeCliente           := 0
dAtual                  := Date()
dCompra                 := Date()
cEnderecoEntrega        := Space(20)
dEntrega                := CToD("")
cNomeProduto1           := Space(20)
cNomeProduto2           := Space(20)
cNomeProduto3           := Space(20)
nQuantidadeProduto1     := 0
nQuantidadeProduto2     := 0
nQuantidadeProduto3     := 0
nPrecoProduto1          := 0
nPrecoProduto2          := 0
nPrecoProduto3          := 0
nValorProduto1          := 0
nValorProduto2          := 0
nValorProduto3          := 0
nTotalCompra            := 0

@ 00,00 to 16,57 double

@ 01,01 say "INFORMACOES DA COMPRA"

@ 02,01 say "NOME..........: "
@ 03,01 say "IDADE.........: "
@ 04,01 say "DATA DA COMPRA: "

@ 02,17 get cNomeCliente    picture "@!"        valid !Empty(cNomeCliente)
@ 03,17 get nIdadeCliente   picture "@E 999"    valid nIdadeCliente > 0 .and. nIdadeCliente <= 120
@ 04,17 get dCompra                             valid dCompra <= dAtual
read
dEntrega            := dCompra + 3

@ 05,01 say Replicate("-", 47)

@ 06,01 say "SEQ"
@ 06,05 say "PRODUTO"
@ 06,26 say "QTD"
@ 06,33 say "PRECO"
@ 06,41 say "VALOR"

@ 07,01 say "1"
@ 07,05 get cNomeProduto1       picture "@!"        valid !Empty( cNomeProduto1 )
@ 07,26 get nQuantidadeProduto1 picture "@E 999.99" valid nQuantidadeProduto1 > 0
@ 07,33 get nPrecoProduto1      picture "@E 999.99" valid nPrecoProduto1 >= 0
read

nValorProduto1 := nQuantidadeProduto1 * nPrecoProduto1
@ 07,41 say nValorProduto1 picture "@E 999.99"

@ 08,01 say "2"
@ 08,05 get cNomeProduto2       picture "@!"        valid !Empty(cNomeProduto2)
@ 08,26 get nQuantidadeProduto2 picture "@E 999.99" valid nQuantidadeProduto2 > 0
@ 08,33 get nPrecoProduto2      picture "@E 999.99" valid nPrecoProduto2 >= 0
read

nValorProduto2 := nQuantidadeProduto2 * nPrecoProduto2
@ 08,41 say nValorProduto2 picture "@E 999.99"

@ 09,01 say "3"
@ 09,05 get cNomeProduto3       picture "@!"        valid !Empty(cNomeProduto3)
@ 09,26 get nQuantidadeProduto3 picture "@E 999.99" valid nQuantidadeProduto3 > 0
@ 09,33 get nPrecoProduto3      picture "@E 999.99" valid nPrecoProduto3 >= 0
read

nValorProduto3 := nQuantidadeProduto3 * nPrecoProduto3
@ 09,41 say nValorProduto3 picture "@E 999.99"

@ 10,01 say Replicate("-", 47)
nTotalCompra := nValorProduto1 + nValorProduto2 + nValorProduto3
@ 11,01 say "VALOR TOTAL: "
@ 11,39 say nTotalCompra picture "@E 99999.99"
@ 12,01 say Replicate("-", 47)

@ 13,01 say "INFORMACOES DE ENTREGA"
@ 14,01 say "ENDERECO DE ENTREGA: "
@ 15,01 say "DATA DE ENTREGA....: "

@ 14,22 get cEnderecoEntrega picture "@!" valid !Empty(cEnderecoEntrega)
@ 15,22 get dEntrega                      valid dEntrega >= dCompra + 3
read

// CUPOM

@ 01,01 clear to 15,56

@ 01,01 say "CLIENTE: " + cNomeCliente
@ 01,30 say "IDADE: " + Transform( nIdadeCliente, "@E 999" ) + " anos"
@ 02,01 say "DATA DA COMPRA: " + DToC( dCompra )

@ 03,01 say Replicate( "-", 47 )
@ 04,01 say "ITENS"
@ 05,01 say Replicate( "-", 47 )

@ 06,01 say "SEQ|"
@ 06,05 say "PRODUTO"
@ 06,26 say "| QTD|"
@ 06,33 say "PRECO|"
@ 06,41 say "VALOR|"

@ 07,01 say "1 "
@ 07,05 say cNomeProduto1
@ 07,26 say "|" + Transform( nQuantidadeProduto1, "@E 999.99" )
@ 07,33 say "|" + Transform( nPrecoProduto1, "@E 999.99" )
@ 07,41 say "|" + Transform( nValorProduto1, "@E 999.99" )

@ 08,01 say "2 "
@ 08,05 say cNomeProduto2
@ 08,26 say "|" + Transform( nQuantidadeProduto2, "@E 999.99" )
@ 08,33 say "|" + Transform( nPrecoProduto2, "@E 999.99" )
@ 08,41 say "|" + Transform( nValorProduto2, "@E 999.99" )

@ 09,01 say "3 "
@ 09,05 say cNomeProduto3
@ 09,26 say "|" + Transform( nQuantidadeProduto3, "@E 999.99" )
@ 09,33 say "|" + Transform( nPrecoProduto3, "@E 999.99" )
@ 09,41 say "|" + Transform( nValorProduto3, "@E 999.99" )

@ 10,01 say Replicate( "-", 47 )
@ 11,01 say "VALOR TOTAL: "
@ 11,39 say nTotalCompra picture "@E 99999.99"
@ 12,01 say Replicate( "-", 47 )

@ 13,01 say "ENDERECO: " + cEnderecoEntrega
@ 14,01 say "DATA DE ENTREGA: " + DToC( dEntrega )
@ 15,01 say "Obrigado, volte sempre!"
@ 16,01 say ""
