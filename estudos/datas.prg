PROCEDURE main
   LOCAL dPagamento
  ? "DATAS"

  /* 
  1 - CTOD - Padrão americado, deve-se usar junto o set date british
  2- STOD - O set data não influencia no valor da Data, porém para exibir com o dia/mes/ano tem que usar o set date british.
  3- 0d - Formato mais novo. Informa que é um valor data.
  */

  set date british // Altera a data para o padrão britânico
  set century on // mostra o ano com 4 casas
  // cTod é "Caractere to Date"
  ? "Data com formato CTOD e:" , cTod("07/01/2023")
  ? "Data com formato STOD e:" , sTod("20230107")
  ? "Data com formato 0d:" , 0d20230107

  ? "---------------------------"
  ? "DATA COM ADICAO E SUBTRACAO"

  dPagamento := cTod("01/02/2023")
  ? "A data de pagamento e:" , dPagamento
  dPagamento += 2 // dPagamento := dPagamento + 2
  ? "Agora a data de pagamento tem mais dois dias:" , dPagamento
  ?
  dPagamento -= 2 // dPagamento := dPagamento - 2
  ? "Agora a data de pagamento tem menos dois dias:" , dPagamento
  /*
  dPagamento /= 2 // Gera um erro
  ? "A divisão com data gera um erro", dPagamento
  dPagamento *= 2 //Gera um erro
  */
RETURN
