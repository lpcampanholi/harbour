REQUEST HB_CODEPAGE_UTF8 //chamada para aceitar acentos

procedure main
   hb_cdpselect("UTF8") //chamada para aceitar acentos

   ? "Ola mundo"

   ? "ola"
   ? 'ola'
   ? [ola]
   ? "Exemplo","com virgula"
   ? "ola"+"mundo"

   // concatenacao com , adiciona espaco automaticamente

   ? "esta string vai ser escrita " + ;
      "em tres linhas " + ;
      "mas aparece em apenas uma linhas."

   // nao precisa usar ; no final das frases
   // O ; � usado para quebrar linhas

   ? "ola pessoal!"; ? "Como voces estao?"; ? "Espero que bem."

   ? "25" + "25"
   ? 25 + 25

   // DATAS

   /* 
   1 - CTOD - Padr�o americado, deve-se usar junto o set date british
   2- STOD - O set data n�o influencia no valor da Data, por�m para exibir com o dia/mes/ano tem que usar o set date british.
   3- 0d - Formato mais novo. Informa que � um valor data.
   */

   set date british // Altera a data para o padr�o brit�nico
   set century on // mostra o ano com 4 casas
   // cTod � "Caractere to Date"
   ? "Data com formato CTOD e:" , cTod("07/01/2023")
   ? "Data com formato STOD e:" , sTod("20230107")
   ? "Data com formato 0d:" , 0d20230107

RETURN
