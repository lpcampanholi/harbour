clear

do while .t.

    nIdade := 0

    @ 01,01 get nIdade picture "99" valid nIdade > 0
    read
    
    if LastKey() == 27
        nOpcao := Alert("Deseja sair?", {"Sim", "Nao"})
        if nOpcao == 1
            exit
        endif
        loop
    endif

    @ 02,01 say "Idade....:" + Str(nIdade)

enddo
