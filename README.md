# SG Trainee

## Console SG Trainee
* `mode 80,25`  
  Define o modo de exibição da tela.

* `Q EXE01.prg`  
  Abre o arquivo `EXE01.prg` no Q

* `del .`  
  Deleta todos os arquivos no diretório atual

* `exit`  
  Sai do programa

* `del <arquivo>`  
  Deleta um arquivo específico

* `cls`  
  Limpa a tela do console

* Compilar o programa usando o comando:  
  `HBMK2 EXE01.prg`

* Executar arquivo
  `EXE01.exe`

## Editor Q
- **Sair do editor:** `Alt + X`
- **Salvar:** `Ctrl + K`, depois `S`
- **Configurar:**
1. Pressione `Esc` para abrir o Menu.
2. Selecione `Backups` e deixe como `OFF`.
3. Escolha `Save current Settings` e confirme com `Yes`.

## Str()
Converte um valor para String. Usado na concatenação.
```h
@ 01,01 say "A soma entre o numero 1 e o numero 2 e: " + Str( nNumero1 + nNumero2 )
```

## Criar caixa
```h
@ 00,00 to 02,45         // caixa simples
@ 00,00 to 02,45 double  // caixa dupla
```

## AllTrim()
Remove espaços em branco do início e do fim de uma string.
```h
@ 01,01 say "Total: " + AllTrim( Str( nTotal ) )
```

## get
``` h
  @ 01,01 get nNumero1
  @ 02,01 get nNumero2
  @ 03,01 get nNumero3
  read  // Pausa a execução do programa
```

## picture
Para números  
```h
@ 01,01 get nIdade picture "999"
@ 02,01 get nPeso  picture "999.999"
@ 03,01 get nPreco picture "@E 999.999"
read

@ 01,01 say "Valor Total: " + Transform( nValor, "@E 999.99" )
```

## Transform()
```h
Transform( nNumero1, "@E 999.99" )
```

## valid
```h
@ 01,01 get nIdade       picture "999"       valid nIdade >= 0
@ 02,01 get nQuantidade  picture "999.99"    valid nQuantidade >= 0
@ 03,01 get nPreco       picture "@E 999.99" valid nPreco >= 0
@ 04,01 get nTemperatura picture "999.99"    valid nTemperatura >= -10 .and. nTemperatura <= 50
```
## Inicializacao e Validacao de Strings

```h
cNome := Space(40)

@ 01,01 say "Nome: "
@ 01,07 get cNome picture "@!" valid !Empty(cNome)
```

## clear to
```h
@ 00,00 to 24,79 double
@ 01,01 clear to 23,78
```

## Datas
```h
set epoch to 1940
set date brit // --> set date to british
set century on // não será usado no curso
clear

dAtual      := Date() + 7       // Retorna a data atual do sistema
dNascimento := CToD("")         // Caractere to Date
dFixa       := CToD("01/01/12") // 

@ 01,01 get dNascimento valid dNascimento <= dAtual
read
```

## Empty()
```h
cNome       := Space(10)
nIdade      := 0
dNascimento := CToD("")

? Empty(cNome)        // .T.
? Empty(nIdade)       // .T.
? Empty(dNascimento)  // .T.
```

## DToC()
22/10 - Terça-feira
```h
@ 01,01 say "A data de nascimento e " + DToC(dNascimento)
```

## if
23/10 - Quarta-feira

* Estrutura:
```
if <condicao>
  codigo
elseif <condicao>
  codigo
else <condicao>
  codigo
endif
```
E
* Exemplo:  
```h
nIdade := 0

@ 01,01 say "A"

if nIdade >= 18
   @ 02,01 say "B"
endif
```

## set color
```h
set color to "b/g" // letra /fundo
// clear
@ 00,00 to 03,10 color "r/gr"
@ 01,01 say "OI"
@ 02,01 say "OI" color "r/gr"
set color to "n/w"
@ 05,05 to 08,08
```

"n" = preto  
"w" = branco  
"b" = azul  
"g" = verde  
"r" = vermelho  
"gr" = amarelo  

## InKey()
```h
@ 01,01 say "A"
InKey(0)
@ 02,01 say "B"
```

## Funções de Data
28/10/2024
```h
dExemplo    := Date()
nAno        := Year(dExemplo) // 2024
nMes        := Month(dExemplo) // 10
nDia        := Day(dExemplo) // 28
nDiaSemana  := DoW(dExemplo) // 2
```
1- Dom, 2- Seg, ..., 7-Sab

## $ (Contido)
funciona como == .or. ==
```h
@ 01,01 say "a" $ "abc" // .t.
@ 02,01 say "a" $ "BCA" // .f.
@ 03,01 say "ca" $ "bca" // .t.
@ 04,01 say "aBc" $ "abc" // .f.
```

## do while
```h
cNome       := Space(20)
nContador   := 1
nLinha      := 2

@ 01,01 say "NOME: "
@ 01,07 get cNome picture "@!" valid !Empty(cNome)
read

do while nContador <= 10
    @ nLinha++,01 say cNome
    nContador++
enddo
```

## exit / loop
```h
do while .t.
  if nIdade < 18
    exit
  else
    loop
  endif
enddo
```

## LastKey()
```h
  if LastKey() == 27 // ESC
    exit
  endif
```

## alert
ALERT(cMensagem, aOpcoes)
```h
do while .t.

    @ 01,01 get nIdade picture "99" valid nIdade > 0
    read

    if LasKey() == 27
        nOpcao := Alert("Deseja sair?", {"Sim", "Nao"})
        if nOpcao == 1
            exit
        endif
        loop
    endif

enddo

```
## Len()

```h
cNome := Space(20)
nTamanho := Len(cNome) // 20

@ 01,01 get cNome picture "@!" valid !Empty(cNome)
read

nTamanho := Len(cNome) // 20
cNome := AllTrim(cNome)
nTamanho := Len(cNome) // 6
```

## SubStr()

```h
cNome := Space(20)

@ 01,01 get cNome picture "@!" valid !Empty(cNome) // ANGELO HENRIQUE
read

cPrimeiroNome := SubStr(cNome, 1, 6) // ANGELO

// Primeiro parâmetro: String
// Segundo parâmetro: Posição inicial
// Terceiro parâmetro: Quantas posições pegar
```

## Prompt

```h
set message to 23 center
set wrap on
nOpcao := 2 // Inicia o Menu em "Consultar"

@ 01,01 prompt "Cadastrar"  message "CadastrarSenhas"
@ 02,01 prompt "Consultar"  message "Consultar Senhas"
@ 03,01 prompt "Sair"       message "Sair do programa"
menu to nOpcao
// ESC -> 0

```
