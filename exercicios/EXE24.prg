// Faça um programa que pergunte ao usuário uma fruta, repita até que a fruta digitada seja "BANANA"

do while .t.

    clear

    @ 01,01 say "          Acerte a fruta!"
    @ 02,01 say "------------------------------------"

    cFruta := Space(20)
    
    @ 03,01 say "Digite uma fruta: "
    @ 03,19 get cFruta picture "@!" valid !Empty(cFruta)
    read

    if LastKey() == 27
        nOpcao := Alert("Deseja sair?", {"Sim", "Nao"})
        if nOpcao == 1
            exit
        endif
        loop
    endif

    if cFruta = "BANANA"
        @ 04,01 say "Acertou a fruta! Parabens!"
        InKey(0)
        exit
    else
        @ 04,01 say "Resposta errada! Tente novamente!"
        InKey(0)
    endif
    
    @ 04,01 clear to 05,40

enddo

clear
