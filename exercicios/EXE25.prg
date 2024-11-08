/*
Faça um programa que entreviste várias pessoas até que sejam entrevistadas 50 pessoas e calcule:
- Percentual de homens entrevistados
- Percentual de mulheres entrevistadas
- Quantidade de pessoas que gostaram do produto
- Quantidade de mulheres que não gostaram do produto

Obs.: O entrevistado só pode responder "M" ou "F" para informar o sexo. Caso responda com outro caractere, perguntar novamente. O entrevistado só pode responder "S" ou "N" para dizer se gostou ou não. Caso responda com outro caractere, perguntar novamente.
*/

set message to 23 center
set wrap on

nPessoasEntrevistadas       := 0
nHomensEntrevistados        := 0
nMulheresEntrevistadas      := 0
nMulheresQueNaoGostaram     := 0
nLikes                      := 0
nOpcao                      := 0

do while .t. 

   clear

   @ 01,01 say "Bem-vindo ao Centro de Pesquisa!"
   @ 02,01 say "--------------------------------"

   @ 02,01 prompt "Fazer Pesquisa"     message "Inicia a pesquisa"
   @ 03,01 prompt "Ver relatorio"      message "Visualiza o relatorio"
   @ 04,01 prompt "Sair"               message "Sai da aplicacao"
   menu to nOpcaoMenu

   if Empty(nOpcaoMenu)
      nOpcaoMenu := 3
   endif

   if nOpcaoMenu == 1 // Entrevista

      @ 01,01 say "                Entrevista"
      @ 02,01 say "---------------------------------------------"
      @ 03,01 say "Pessoa " + AllTrim(Str(nPessoasEntrevistadas))

      do while nPessoasEntrevistadas <= 50

         cSexo   := Space(1)
         cGostou := Space(1)

         nPessoasEntrevistadas++

         @ 04,01 say "Sexo:   [M]asculino [F]eminino"
         @ 05,01 say "Gostou do produto?    [S]im [N]ao"

         @ 04,07 get cSexo   picture "@!" valid cSexo $ "MF"
         @ 05,20 get cGostou picture "@!" valid cGostou $ "SN"
         read

         if LastKey() == 27
            nOpcao := Alert("Voltar?", {"Sim", "Nao"})
            if nOpcao == 1
               exit
            endif
            loop
         endif

         if cSexo == "M"
            nHomensEntrevistados++
         endif
    
         if cSexo == "F"
            nMulheresEntrevistadas++
         endif
    
         if cGostou == "S"
            nLikes++
         endif
    
         if cGostou == "N" .and. cSexo == "M"
            nMulheresQueNaoGostaram++
         endif
    
      enddo

   elseif nOpcaoMenu == 2

      clear

      nPercentualHomens := (nHomensEntrevistados / nPessoasEntrevistadas) * 100
      nPercentualMulheres := (nMulheresEntrevistadas / nPessoasEntrevistadas) * 100
    
      @ 01,01 say "                 Relatorio da pesquisa"
      @ 02,01 say "---------------------------------------------------------"
      @ 03,01 say "Total de pessoas entrevistadas..: "
      @ 04,01 say "Homens entrevistados............:       %"
      @ 05,01 say "Mulheres entrevistadas..........:       %"
      @ 06,01 say "Quantidade de pessoas que gostaram do produto.....: "
      @ 07,01 say "Quantidade de mulheres que não gostaram do produto: "
    
      @ 03,35 say nPessoasEntrevistadas
      @ 04,35 say nPercentualHomens       picture "99.99"
      @ 05,35 say nPercentualMulheres     picture "99.99"
      @ 06,53 say nLikes
      @ 07,53 say nMulheresQueNaoGostaram
    
      @ 09,01 say "Digite qualquer tecla para voltar.."
      InKey(0)
    
   elseif nOpcaoMenu == 3 // Sair

      nOpcao := Alert("Deseja sair?", {"Sim", "Nao"})
      if nOpcao == 1
         exit
      else
         loop
      endif

   endif

enddo

clear
