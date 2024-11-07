/*
Faça um programa que entreviste várias pessoas até que sejam entrevistadas 50 pessoas e calcule:
- Percentual de homens entrevistados
- Percentual de mulheres entrevistadas
- Quantidade de pessoas que gostaram do produto
- Quantidade de mulheres que não gostaram do produto

Obs.: O entrevistado só pode responder "M" ou "F" para informar o sexo. Caso responda com outro caractere, perguntar novamente. O entrevistado só pode responder "S" ou "N" para dizer se gostou ou não. Caso responda com outro caractere, perguntar novamente.
*/

do while .t. 
    
    clear

    nPessoas := 0

    @ 01,01 say "        Entrevista"
    @ 02,01 say "--------------------------"
    @ 03,01 say "Pessoa " + Str(nPessoa)

    do while nPessoas <= 50
        
        cSexo   := Space(1)
        cGostou := Space(1)

        @ 03,01 say "Sexo:   [M]asculino [F]eminino"
        @ 04,01 say "Gostou do produto?    [S]im [N]ao"
    
        @ 05,20 get cSexo   picture "9" valid cSexo $ "MF"
        @ 06,34 get cGostou picture "9" valid cGostou $ "SM"
        read

        if LastKey() == 27
            nOpcao := Alert("O que deseja fazer?", {"Cancelar", "Retornar", "Processar"})
            if nOpcao == 1
                exit
            endif
            loop
        endif

    enddo

    if nOpcao == 1
        loop
    endif

    clear

    @ 01,01 say "           Relatorio"
    @ 02,01 say "--------------------------------"
    @ 03,01 say "Pessoas entrevistadas: "
    @ 04,01 say "Homens: "
    @ 05,01 say "Mulheres: "

enddo

