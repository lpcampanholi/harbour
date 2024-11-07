set message to 23 center
set wrap on

clear

nOpcao := 2 // Inicia o Menu em "Consultar"

@ 01,01 prompt "Cadastrar"  message "CadastrarSenhas"
@ 02,01 prompt "Consultar"  message "Consultar Senhas"
@ 03,01 prompt "Sair"       message "Sair do programa"
menu to nOpcao
// ESC -> 0

if nOpcao == 0
    nOpcao := 3
endif
