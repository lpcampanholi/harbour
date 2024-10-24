clear

cNomeProdutoA := Space(20)
cNomeProdutoB := Space(20)
cNomeProdutoC := Space(20)
nPrecoProdutoA := 0
nPrecoProdutoB := 0
nPrecoProdutoC := 0
nQuantidadeProdutoA := 0
nQuantidadeProdutoB := 0
nQuantidadeProdutoC := 0
nValorTotal := 0

@ 00,00 to 07,36 double

@ 01,08 say "CADASTRO DE PRODUTOS"

@ 03,04 say "Nome do Produto"
@ 03,25 say "Valor"
@ 03,32 say "Qtde"

@ 04,01 say "A: "
@ 05,01 say "B: "
@ 06,01 say "C: "

@ 04,04 get cNomeProdutoA       picture "@!"         valid !Empty(cNomeProdutoA)
@ 04,25 get nPrecoProdutoA      picture "@E 999.99"  valid nPrecoProdutoA >= 0
@ 04,32 get nQuantidadeProdutoA picture "@E 999"     valid nQuantidadeProdutoA > 0
read

@ 05,04 get cNomeProdutoB       picture "@!"         valid !Empty(cNomeProdutoB)
@ 05,25 get nPrecoProdutoB      picture "@E 999.99"  valid nPrecoProdutoB >= 0
@ 05,32 get nQuantidadeProdutoB picture "@E 999"     valid nQuantidadeProdutoB > 0
read

@ 06,04 get cNomeProdutoC       picture "@!"         valid !Empty(cNomeProdutoC)
@ 06,25 get nPrecoProdutoC      picture "@E 999.99"  valid nPrecoProdutoC >= 0
@ 06,32 get nQuantidadeProdutoC picture "@E 999"     valid nQuantidadeProdutoC > 0
read

// nValorTotal = (nQuantidadeProdutoA * nValorProdutoA) + (nQuantidadeProdutoB * nQuantidadeProdutoB) + (nQuantidadeProdutoC * nValorProdutoC)

// @ 09,01 say "Total a pagar:   " +  Transform( nValorTotal, "@E 999.99" )
