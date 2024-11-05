/*
Contrua um algoritmo que receba o código de um produto e o classifique de acordo com a tabela abaixo:

CÓDIGO CLASSIFICAÇÃO
----------------------------------------
1       Alimento não-perecível
2 a 4   Alimento perecível
5 e 6   Vestuário
7       Higiene pessoal
8 a 15  Limpeza e utensílios domésticos
Qualquer outro código inválido
*/

do while .t.

    clear
    
    nCodigoProduto := 0
    
    @ 01,01 say "Insira o codigo do produto: "
    @ 02,01 say "---------------------------------"
    
    @ 01,29 get nCodigoProduto picture "99" valid nCodigoProduto > 0
    read

    if LastKey() == 27
        nOpcao := Alert("Deseja sair?", {"Sim", "Nao"})
        if nOpcao == 1
            exit
        endif
        loop
    endif

    @ 03,01 say "Categoria:"
    
    if nCodigoProduto == 1
        @ 04,01 say "Alimento nao perecivel"
    elseif nCodigoProduto >= 2 .and. nCodigoProduto <= 4
        @ 04,01 say "Alimento perecivel"
    elseif nCodigoProduto == 5 .or. nCodigoProduto == 6
        @ 04,01 say "Vestuario"
    elseif nCodigoProduto == 7
        @ 04,01 say "Higiene pessoal"
    elseif nCodigoProduto >= 8 .and. nCodigoProduto <= 15
        @ 04,01 say "Limpeza e utensilios domesticos"
    else
        @ 04,01 say "Codigo invalido!"
    endif

    InKey(0)

enddo

clear
