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

## Str
Converte um valor para String. Usado na concatenação.
```h
@ 01,01 say "A soma entre o numero 1 e o numero 2 e: " + Str( nNumero1 + nNumero2 )
```

## Criar caixa
```h
@ 00,00 to 02,45         // caixa simples
@ 00,00 to 02,45 double  // caixa dupla
```

## AllTrim
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
## Valicao de Strings

```h
cNome := Space(40)

@ 01,01 say "Nome: "
@ 01,07 get cNome picture "@!" valid !Empty(cNome)
```

## Limpar só uma parte da tela
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
