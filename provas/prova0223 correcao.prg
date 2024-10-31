// Luís Plinio Gabriel Campanholi dos Santos

set epoch to 1940
set date to british

clear

cVendedor                       := Space(30)
dCotacao                        := Date()

cNome                           := Space(30)
nIdade                          := 0
cSexo                           := Space(1)
nPrimeiraCNH                    := 0

cMarca                          := Space(20)
nAnoFabricacao                  := 0
cTipoVeiculo                    := Space(1)
nMotor                          := 0
nValorVeiculo                   := 0
cUsoVeiculo                     := Space(1)

nTempoDeCarteira                := 0
nIdadeVeiculo                   := 0
nTaxaIdadeVeiculo               := 0

nValorBaseSeguradora1           := 0
nValorBaseSeguradora2           := 0
nPorcetagemAumentoSeguradora1   := 0
nPorcetagemAumentoSeguradora2   := 0
nValorFinalSeguradora1          := 0
nValorFinalSeguradora2          := 0

cCorSeguradora1                 := Space(3)
cCorSeguradora2                 := Space(3)

// CABEÇALHO
@ 00,00 to 04,70

@ 01,02 say Replicate(" ", 25) + "COTACAO DE SEGUROS"
@ 03,01 say "Vendedor: "
@ 03,45 say "Data da cotacao: "

@ 03,11 get cVendedor picture "@!" valid !Empty(cVendedor)
@ 03,53 get dCotacao               valid !Empty(dCotacao) .and. dCotacao <= Date()
read

clear

// DADOS PESSOAIS
@ 00,00 to 06,70

@ 01,01 say Replicate(" ", 25) + "DADOS PESSOAIS"
@ 03,01 say "Nome..............: "
@ 03,55 say "Idade: "
@ 04,01 say "Sexo..............: "
@ 04,23 say "[M]asculino [F]eminino"
@ 05,01 say "Ano Primeira CNH..: "

@ 03,21 get cNome           picture "@!"    valid !Empty(cNome)
@ 03,63 get nIdade          picture "999"   valid nIdade >= 0 .and. nIdade <= 120
@ 04,21 get cSexo           picture "!@"    valid cSexo == "M" .or. cSexo == "F"
@ 05,21 get nPrimeiraCNH    picture "9999"  valid nPrimeiraCNH >= 1900 .and. nPrimeiraCNH <= Year(Date())
read

clear

// DADOS DO VEÍCULO
@ 00,00 to 09,70

@ 01,01 say Replicate(" ", 25) + "DADOS DO VEICULO"
@ 03,01 say "Marca..............: "
@ 04,01 say "Ano de Fabricacao..: "
@ 05,01 say "Tipo...............: "
@ 05,24 say "[P]asseio [E]sportivo [L]uxo"
@ 06,01 say "Motor..............: "
@ 07,01 say "Valor (Fipe).......: "
@ 08,01 say "Uso................: "
@ 08,24 say "[P]articular pr[O]fissional"

@ 03,22 get cMarca          picture "@!"              valid !Empty(cMarca)
@ 04,22 get nAnoFabricacao  picture "9999"            valid !Empty(nAnoFabricacao) .and. nAnoFabricacao <= Year(Date())
@ 05,22 get cTipoVeiculo    picture "@!"              valid cTipoVeiculo == "P" .or. cTipoVeiculo == "E" .or. cTipoVeiculo == "L"
@ 06,22 get nMotor          picture "9.9"             valid nMotor > 0.0 .and. nMotor <= 9.9
@ 07,22 get nValorVeiculo   picture "@E 9999999.99"   valid nValorVeiculo > 0 .and. nValorVeiculo < 10000000
@ 08,22 get cUsoVeiculo     picture "@!"              valid cUsoVeiculo = "P" .or. cUsoVeiculo = "O"
read

clear

nTempoDeCarteira        := Year(dCotacao) - nPrimeiraCNH
nIdadeVeiculo           := Year(dCotacao) - nAnoFabricacao

// COTAÇÃO SEGURADORA 1
nValorBaseSeguradora1           := nValorVeiculo * 0.06
nTaxaIdadeVeiculoSeguradora1    := nIdadeVeiculo * 0.005

if nIdade < 25 .or. nIdade > 65
    nPorcetagemAumentoSeguradora1 += 0.10
endif

if cSexo == "M"
    nPorcetagemAumentoSeguradora1 += 0.10
else
    nPorcetagemAumentoSeguradora1 -= 0.05
endif

if nTempoDeCarteira < 3
    nPorcetagemAumentoSeguradora1 += 0.15
endif

if nTempoDeCarteira >= 8
    nPorcetagemAumentoSeguradora1 -= 0.10
endif

if cTipoVeiculo == "E"
    nPorcetagemAumentoSeguradora1 += 0.10
endif

if cTipoVeiculo == "L"
    nPorcetagemAumentoSeguradora1 += 0.20
endif

if nMotor > 2.0
    nPorcetagemAumentoSeguradora1 += 0.15
endif

if nTaxaIdadeVeiculoSeguradora1 >= 0.10
    nPorcetagemAumentoSeguradora1 += 0.10
else
    nPorcetagemAumentoSeguradora1 += nTaxaIdadeVeiculoSeguradora1
endif

if cUsoVeiculo == "O"
    nPorcetagemAumentoSeguradora1 += 0.10
endif

if Month(dCotacao) == 3
    nPorcetagemAumentoSeguradora1 -= 0.10
endif

nValorFinalSeguradora1 = nValorBaseSeguradora1 + (nValorBaseSeguradora1 * nPorcetagemAumentoSeguradora1)

// COTAÇÃO SEGURADORA 2
nValorBaseSeguradora2           := nValorVeiculo * 0.07
nTaxaIdadeVeiculoSeguradora2    := nIdadeVeiculo * 0.008

if nIdade < 23 .or. nIdade > 60
    nPorcetagemAumentoSeguradora2 += 0.15
endif

if nIdade >= 30 .or. nIdade <= 50
    nPorcetagemAumentoSeguradora2 -= 0.08
endif

if cSexo == "M"
    nPorcetagemAumentoSeguradora2 -= 0.06
else
    nPorcetagemAumentoSeguradora2 += 0.12
endif

if nTempoDeCarteira < 2
    nPorcetagemAumentoSeguradora2 += 0.20
endif

if nTempoDeCarteira >= 5
    nPorcetagemAumentoSeguradora2 -= 0.08
endif

if cTipoVeiculo == "E"
    nPorcetagemAumentoSeguradora2 += 0.15
endif

if cTipoVeiculo == "L"
    nPorcetagemAumentoSeguradora2 += 0.18
endif

if nMotor >= 1.5
    nPorcetagemAumentoSeguradora2 += 0.10
endif

if nTaxaIdadeVeiculoSeguradora2 >= 0.08
    nPorcetagemAumentoSeguradora2 += nTaxaIdadeVeiculoSeguradora2
else
    nPorcetagemAumentoSeguradora2 += nIdadeVeiculo * 0.08
endif

if cUsoVeiculo == "O"
    nPorcetagemAumentoSeguradora2 += 0.12
endif

if Month(dCotacao) == 9
    nPorcetagemAumentoSeguradora2 -= 0.08
endif

nValorFinalSeguradora2 = nValorBaseSeguradora2 + (nValorBaseSeguradora2 * nPorcetagemAumentoSeguradora2)

// VALIDAÇÃO CORES
if nValorFinalSeguradora1 > nValorFinalSeguradora2
    cCorSeguradora1 := "w/g"
    cCorSeguradora2 := "w/r"
else
    cCorSeguradora2 := "w/g"
    cCorSeguradora1 := "w/r"
endif

// RELATÓRIO COTAÇÕES
@ 02,00 to 08,34 color cCorSeguradora1
@ 02,01 clear to 08,33 color cCorSeguradora1
@ 03,01 say "SEGUROS E CIA"
@ 04,01 say Replicate("-", 33)
@ 05,01 say "Mensal......: " + Transform(nValorFinalSeguradora1 / 12, "@E 99999.99") color cCorSeguradora1
@ 06,01 say "Trimestral..: " + Transform(nValorFinalSeguradora1 / 3, "@E 99999.99") color cCorSeguradora1
@ 07,01 say "Anual.......: " + Transform(nValorFinalSeguradora1, "@E 99999.99") color cCorSeguradora1

@ 02,37 to 08,71 color cCorSeguradora2
@ 02,01 clear to 08,33 color cCorSeguradora1
@ 03,38 say "AUTO SEGUROS SA"
@ 04,38 say Replicate("-", 33)
@ 05,38 say "Mensal......: " + Transform(nValorFinalSeguradora2 / 12, "@E 99999.99") color cCorSeguradora2
@ 06,38 say "Trimestral..: " + Transform(nValorFinalSeguradora2 / 3, "@E 99999.99") color cCorSeguradora2
@ 07,38 say "Anual.......: " + Transform(nValorFinalSeguradora2, "@E 99999.99") color cCorSeguradora2

// DATA VALIDADE COTACAO
nAno                    := Year(dCotacao)
nMes                    := Month(dCotacao)
nProximoMes             := 0
cMes                    := Space(10)
dPrimeiroDiaProximoMes  := CtoD("")
dUltimoDiaMes           := CtoD("")

if nMes == 1
    cMes := "Janeiro"
elseif nMes == 2
    cMes := "Fevereiro"
elseif nMes == 3
    cMes := "Marco"
elseif nMes == 4
    cMes := "Abril"
elseif nMes == 5
    cMes := "Maio"
elseif nMes == 6
    cMes := "Junho"
elseif nMes == 7
    cMes := "Julho"
elseif nMes == 8
    cMes := "Agosto"
elseif nMes == 9
    cMes := "Setembro"
elseif nMes == 10
    cMes := "Outubro"
elseif nMes == 11
    cMes := "Novembro"
elseif nMes == 12
    cMes := "Dezembro"
endif

// Verifica se é Dezembro
if nMes == 12
    nProximoMes := 1
    nAno += 1
else
    nProximoMes := nMes + 1
endif

// Monta a data do último dia do mês
dPrimeiroDiaProximoMes := CtoD("01/" + StrZero(nProximoMes, 2) + "/" + AllTrim(Str(nAno)))
dUltimoDiaMes := dPrimeiroDiaProximoMes - 1

@ 10,01 say "Cotacao valida ate " + AllTrim(Str((Day(dUltimoDiaMes)))) + " de " + AllTrim(cMes) + " de " + AllTrim(Str(nAno))
