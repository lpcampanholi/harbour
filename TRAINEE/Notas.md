# SG Trainee

## Comandos Console SG Trainee
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

## Harbour
* `Str()`  
  Converte um valor para String

* `AllTrim()`  
  Remove espaços em branco do início e do fim de uma string

* `@ 00,00 to 02,45`  
  Criar caixa

* 
```
  @ 01,01 get nNumero1 picture "999"
```

Picture é para os números

```harbour
  @ 01,01 get nIdade picture "999"
  @ 02,01 get nPeso  picture "999.999"
  @ 03,01 get nPreco picture "@E 999.999"
  read

  @ 01,01 say "Valor Total: " + Transform( nValor, "@E 999.99" )
```
* `Transform( nNumero1, "@E 999.99" )`
