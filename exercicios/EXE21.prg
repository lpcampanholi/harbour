// Faça um algoritmo que leia o nome e o peso de seis pessoas e imprima o nome e o peso do mais magro e mais gordo.

do while .t.

    clear
    
    nPessoas    := 0
    nMaiorPeso  := 0
    nMenorPeso  := 9999
    nOpcao      := 0
    cMaisPesado := Space(20)
    cMaisLeve   := Space(20)
  
    @ 01,01 say "            Entrevista de Peso"
    @ 02,01 say "---------------------------------------------"
    @ 03,01 say "Quantas pessoas gostaria de entrevistar? "
    @ 04,01 say "---------------------------------------------"
  
    @ 03,42 get nPessoas picture "99" valid nPessoas > 0
    read

    if LastKey() == 27
        nOpcao := Alert("Sair da aplicacao?", {"Sim", "Nao"})
        if nOpcao == 1
            exit
        endif
        loop
    endif
  
    do while nPessoas > 0
  
        nPeso := 0
        cNome := Space(20)
  
        @ 05,01 say "Nome....: "
        @ 06,01 say "Peso....: "
        @ 06,19 say "kg"
  
        @ 05,11 get cNome picture "@!"          valid !Empty(cNome)
        @ 06,11 get nPeso picture "@E 999.999"  valid !Empty(nPeso)
        read
    
        if LastKey() == 27
            nOpcao := Alert("O que deseja fazer?", {"Cancelar", "Retornar", "Processar"})
            if nOpcao == 1 .or. nOpcao == 3
                exit
            endif
            loop
        endif

        if nPeso > nMaiorPeso
            nMaiorPeso := nPeso
            cMaisPesado := cNome
        endif

        if nPeso < nMenorPeso
            nMenorPeso := nPeso
            cMaisLeve := cNome
        endif
  
        nPessoas--

    enddo

    if nOpcao == 1
        loop
    endif

    @ 07,01 say "---------------------------------------------"
    @ 08,01 say "Pessoa mais pesada..: "
    @ 09,01 say "Peso: "
    @ 10,01 say "Pessoa mais leve....: "
    @ 11,01 say "Peso: "
    @ 12,01 say "---------------------------------------------"

    @ 08,23 say cMaisPesado
    @ 09,07 say AllTrim(Str(nMaiorPeso)) + " Kg"
    @ 10,23 say cMaisLeve
    @ 11,07 say AllTrim(Str(nMenorPeso)) + " Kg"

    InKey(0)

enddo

clear
