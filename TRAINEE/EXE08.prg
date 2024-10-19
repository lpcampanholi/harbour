clear

nValorProdutoA := 10
nValorProdutoB := 5.25
nValorProdutoC := 20

nQuantidadeProdutoA := 0
nQuantidadeProdutoB := 0
nQuantidadeProdutoC := 0

nValorTotal := 0

@ 01,01 say "Valor Produto A: " + Transform( nValorProdutoA, "@E 999.99" )
@ 02,01 say "Valor Produto B: " + Transform( nValorProdutoB, "@E 999.99" )
@ 03,01 say "Valor Produto C: " + Transform( nValorProdutoC, "@E 999.99" )
@ 04,01 say ""

@ 05,01 say "Qtde Produto A:  "
@ 06,01 say "Qtde Produto B:  "
@ 07,01 say "Qtde Produto C:  "
@ 08,01 say ""

@ 05,18 get nQuantidadeProdutoA picture "999"
@ 06,18 get nQuantidadeProdutoB picture "999"
@ 07,18 get nQuantidadeProdutoC picture "999"
read

nValorTotal = (nQuantidadeProdutoA * nValorProdutoA) + (nQuantidadeProdutoB * nQuantidadeProdutoB) + (nQuantidadeProdutoC * nValorProdutoC)

@ 09,01 say "Total a pagar:   " +  Transform( nValorTotal, "@E 999.99" )
