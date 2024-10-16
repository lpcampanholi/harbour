REQUEST HB_CODEPAGE_UTF8 //chamada para aceitar acentos

PROCEDURE main
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
   // O ; é usado para quebrar linhas

   ? "ola pessoal!"; ? "Como voces estao?"; ? "Espero que bem."

   ? "25" + "25"
   ? 25 + 25
RETURN
