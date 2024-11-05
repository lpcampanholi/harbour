// Luís Plinio Gabriel Campanholi dos Santos

set epoch to 1940
set date to british

do while .t.
        
clear

nEmpregados                     := 0
nEmpregadosAnalisados           := 0
nContador                       := 1
nAposentadosHomens              := 0
nAposentadosMulheres            := 0
nTotalAposentados               := 0
nValorTotalRemuneracao          := 0
nPorcentagemHomensAposentados   := 0
nPorcentagemMulheresAposentadas := 0
nMulheresIdadeMaisQue85         := 0
nHomensAdmitidosAntesDe2006     := 0
nHomensReceberamAdicional       := 0
nMulheresReceberamReducao       := 0

@ 01,01 say "                        CONTROLE_INSS"
@ 02,01 say "------------------------------------------------------------------"
@ 03,01 say "Numero de colaboradores a serem analisados: "

@ 03,45 get nEmpregados picture "99" valid nEmpregados > 0
read

if LastKey() == 27
    nOpcao := Alert("Deseja sair da aplicacao?", {"Sim", "Nao"})
    if nOpcao == 1
        exit
    endif
    loop
endif

@ 05,01 say "                  CADASTRO DE COLABORADORES"
@ 06,01 say "------------------------------------------------------------------"

do while nContador <= nEmpregados

    cNome                       := Space(30)
    cSexo                       := Space(1)
    dNascimento                 := CtoD("")
    dAdmissao                   := CtoD("")
    dDemissao                   := CtoD("")
    nSalarioBase                := 0
    nAdicionalNoturno           := 0 // %
    nAdicionalInsalubridade     := 0 // %
    nIdade                      := 0
    nAnosTrabalhados            := 0
    nRemuneracaoAposentadoria   := 0
    nPorcentagem                := 0
    lAposentado                 := .f.
    lRecebeuAdicional           := .f.
    lRecebeuReducao             := .f.
        
    @ 07,01 say "Colaborador numero " + AllTrim(Str(nContador))
    @ 09,01 say "Nome.........................: "
    @ 10,01 say "Sexo.........................: "
    @ 11,01 say "Data de nascimento...........: "
    @ 12,01 say "Data de admissao.............: "
    @ 13,01 say "Data de demissao.............: "
    @ 14,01 say "Salario base.................: "
    @ 15,01 say "Adicional noturno (%)........: "
    @ 16,01 say "Adicional insalubridade (%)..: "

    @ 09,32 get cNome                    picture "@!"            valid !Empty(cNome)
    @ 10,32 get cSexo                    picture "@!"            valid cSexo == "M" .or. cSexo == "F"
    @ 11,32 get dNascimento                                      valid !Empty(dNascimento)
    @ 12,32 get dAdmissao                                        valid !Empty(dAdmissao)
    @ 13,32 get dDemissao                                        valid !Empty(dDemissao)
    @ 14,32 get nSalarioBase             picture "@E 99999.99"   valid nSalarioBase > 0
    @ 15,32 get nAdicionalNoturno        picture "@E 99.9"       valid nAdicionalNoturno >= 0
    @ 16,32 get nAdicionalInsalubridade  picture "@E 99.9"       valid nAdicionalInsalubridade >= 0
    read

    if LastKey() == 27
        nOpcao := Alert("O que deseja fazer?", {"Cancelar", "Retornar", "Processar"})
        if nOpcao == 1 .or. nOpcao == 3
            exit
        endif
        loop
    endif

    // Verificação Idade

    nIdade := Year(Date()) - Year(dNascimento) // verificação da data da Idade

    nMesAniversario := Month(dNascimento)
    nMesAtual       := Month(Date())
    nDiaAniversario := Day(dNascimento)
    nDiaAtual       := Day(Date())

    if nMesAtual <= nMesAniversario .and. nDiaAtual < nDiaAniversario
        nIdade--
    endif
    
    nAnosTrabalhados := Year(dDemissao) - Year(dAdmissao)

    // Adicionais
    nPorcentagem := (nAdicionalNoturno / 100) + (nAdicionalInsalubridade / 100)

    if Year(dAdmissao) <= 2010 .and. Year(dDemissao) >= 2010
        nPorcentagem += 0.06
        lRecebeuAdicional := .t.
    endif

    if Year(dAdmissao) <= 2015 .and. Year(dDemissao) >= 2015
        nPorcentagem += 0.06
        lRecebeuAdicional := .t.
    endif

    if Year(dAdmissao) >= 2012 .and. Year(dDemissao) <= 2020
        nPorcentagem -= 0.02
        lRecebeuReducao := .t.
    endif

    // Aposentou?
    if cSexo == "M" .and. nIdade >= 59 .and. nAnosTrabalhados >= 27
        nAposentadosHomens++
        lAposentado := .t.
        @ 18,01 say "Colaborador APOSENTADO! PARABENS!!!"
    endif
        
    if cSexo == "F" .and. nIdade >= 55 .and. nAnosTrabalhados >= 22
        nAposentadosMulheres++
        lAposentado := .t.
        @ 18,01 say "Colaboradora APOSENTADA! PARABENS!!!"
    endif

    if lAposentado == .f.
        @ 18,01 say "Infelizmente nao conseguiu se aposentar :("
    endif
        
    // Cálculo Remuneração da aposentadoria
    if lAposentado
        nRemuneracaoAposentadoria := nSalarioBase * nPorcentagem
        nValorTotalRemuneracao += nRemuneracaoAposentadoria
        @ 19,01 say "Valor aposentadoria: " + AllTrim(Str(nRemuneracaoAposentadoria))
    endif
    InKey(0)

    // Estatísticas
    if cSexo == "F" .and. nIdade >= 85
        nMulheresIdadeMaisQue85++
    endif

    if cSexo == "M" .and. Year(dAdmissao) < 2006
        nHomensAdmitidosAntesDe2006++
    endif

    if cSexo == "M" .and. lRecebeuAdicional
        nHomensReceberamAdicional++
    endif

    if cSexo == "F" .and. lRecebeuReducao
        nMulheresReceberamReducao++
    endif
        
    // Loop
    nContador++
    nEmpregadosAnalisados++
    @ 07,01 clear to 25,80 // nao precisa do clear to
    enddo

    if nOpcao == 1
        loop
    endif

    clear

    nTotalAposentados := nAposentadosHomens + nAposentadosMulheres
    nPorcentagemHomensAposentados := (nAposentadosHomens / nTotalAposentados) * 100
    nPorcentagemMulheresAposentadas := (nAposentadosMulheres / nTotalAposentados) * 100

    @ 01,01 say "                           RELATORIO"
    @ 02,01 say "------------------------------------------------------------------"
    @ 03,01 say "Total de colaboradores analisados....: "
    @ 04,01 say "Total de colaboradores aposentados...: "
    @ 05,01 say "Porcentagem de homens aposentados....: "
    @ 05,46 say "%"
    @ 06,01 say "Porcentagem de mulheres aposentadas..: "
    @ 06,46 say "%"
    @ 07,01 say "Valor total da remuneracao: "
    @ 08,01 say "Quantidade de Mulheres com idade superior a 85 anos.........: "
    @ 09,01 say "Quantidade de Homens admitidos antes do ano de 2006.........: "
    @ 10,01 say "Quantidade de homens que receberam algum tipo de adicional..: "
    @ 11,01 say "Quantidade de mulheres que receberam algum tipo de reducao..: "

    @ 03,40 say nEmpregadosAnalisados           picture "99"
    @ 04,40 say nTotalAposentados               picture "99"
    @ 05,40 say nPorcentagemHomensAposentados   picture "@E 99.99"
    @ 06,40 say nPorcentagemMulheresAposentadas picture "@E 99.99"
    @ 07,29 say nValorTotalRemuneracao          picture "@E 999999.99"
    @ 08,63 say nMulheresIdadeMaisQue85         picture "99"
    @ 09,63 say nHomensAdmitidosAntesDe2006     picture "99"
    @ 10,63 say nHomensReceberamAdicional       picture "99"
    @ 11,63 say nMulheresReceberamReducao       picture "99"

    InKey(0)

enddo

clear
