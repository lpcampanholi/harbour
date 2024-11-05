// Faça um programa que pergunte ao usuário um número de 1 a 10, repita até que o número digitado seja 5. Imprima "acertou" ou "errou".

do while .t.

    clear

    nNumero := 0

    @ 01,01 say "          Acerte o numero!"
    @ 02,01 say "---------------------------------------"
    @ 03,01 say "Dica: o numero esta entre 1 e 10."
    @ 04,01 say "Numero: "

    @ 04,09 get nNumero picture "99" valid nNumero > 0 .and. nNumero <= 10
    read

    if LastKey() == 27
        nOpcao := Alert("Deseja sair?", {"Sim", "Nao"})
        if nOpcao == 1
            exit
        endif
        loop
    endif

    if nNumero == 5
        @ 05,01 say "---------------------------------------"
        @ 06,01 say "Acertou, parabens!!"
        InKey(0)
        exit
    else
        @ 05,01 say "---------------------------------------"
        @ 06,01 say "Errou! Tente novamente! :("
        InKey(0)
    endif

    @ 05,01 clear to 06,50

enddo

clear
