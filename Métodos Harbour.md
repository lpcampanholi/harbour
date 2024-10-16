### 1. **Métodos de Arrays**
Harbour oferece várias funções para trabalhar com arrays, permitindo manipular e acessar seus elementos.

- **`AADD(aArray, value)`**: Adiciona um novo elemento ao final de um array.
  
  ```harbour
  LOCAL aArray := {1, 2, 3}
  AADD(aArray, 4)
  ? aArray // {1, 2, 3, 4}
  ```

- **`ALEN(aArray)`**: Retorna o tamanho (número de elementos) do array.

  ```harbour
  LOCAL aArray := {10, 20, 30}
  ? ALEN(aArray) // 3
  ```

- **`ADEL(aArray, nIndex)`**: Remove um elemento de um array no índice especificado.

  ```harbour
  LOCAL aArray := {1, 2, 3, 4}
  ADEL(aArray, 2)
  ? aArray // {1, 3, 4}
  ```

- **`ASIZE(aArray, nNewSize)`**: Redimensiona um array para o tamanho especificado.

  ```harbour
  LOCAL aArray := {1, 2, 3}
  ASIZE(aArray, 5)
  ? ALEN(aArray) // 5
  ```

- **`AEVAL(aArray, { |x| <block> })`**: Avalia um bloco de código para cada elemento do array.

  ```harbour
  LOCAL aArray := {1, 2, 3, 4}
  AEVAL(aArray, { |x| ? x * 2 }) // Imprime 2, 4, 6, 8
  ```

### 2. **Métodos de Strings**
O Harbour tem uma variedade de funções para manipular strings, permitindo operações como concatenação, substituição e formatação.

- **`LEN(cString)`**: Retorna o comprimento de uma string.

  ```harbour
  LOCAL cTexto := "Harbour"
  ? LEN(cTexto) // 7
  ```

- **`SUBSTR(cString, nStart, nLen)`**: Extrai uma parte da string, começando em `nStart` e com o comprimento `nLen`.

  ```harbour
  LOCAL cTexto := "Harbour"
  ? SUBSTR(cTexto, 2, 3) // "arb"
  ```

- **`UPPER(cString)`**: Converte a string para maiúsculas.

  ```harbour
  LOCAL cTexto := "Harbour"
  ? UPPER(cTexto) // "HARBOUR"
  ```

- **`LOWER(cString)`**: Converte a string para minúsculas.

  ```harbour
  LOCAL cTexto := "HARBOUR"
  ? LOWER(cTexto) // "harbour"
  ```

- **`ALLTRIM(cString)`**: Remove espaços em branco do início e do final da string.

  ```harbour
  LOCAL cTexto := "  Harbour  "
  ? ALLTRIM(cTexto) // "Harbour"
  ```

- **`STRTRAN(cString, cFind, cReplace)`**: Substitui todas as ocorrências de `cFind` por `cReplace` em uma string.

  ```harbour
  LOCAL cTexto := "Hello World"
  ? STRTRAN(cTexto, "World", "Harbour") // "Hello Harbour"
  ```

- **`VAL(cString)`**: Converte uma string que contém um número para um valor numérico.

  ```harbour
  LOCAL cTexto := "123"
  ? VAL(cTexto) // 123
  ```

### 3. **Métodos de Números**
Para manipulação de números, o Harbour também oferece várias funções úteis:

- **`INT(nNumero)`**: Retorna a parte inteira de um número.

  ```harbour
  LOCAL nValor := 123.456
  ? INT(nValor) // 123
  ```

- **`ROUND(nNumero, nDec)`**: Arredonda um número para `nDec` casas decimais.

  ```harbour
  LOCAL nValor := 123.456
  ? ROUND(nValor, 2) // 123.46
  ```

- **`ABS(nNumero)`**: Retorna o valor absoluto de um número.

  ```harbour
  LOCAL nValor := -5
  ? ABS(nValor) // 5
  ```

- **`MAX(nNum1, nNum2)`**: Retorna o maior valor entre dois números.

  ```harbour
  LOCAL nNum1 := 10, nNum2 := 20
  ? MAX(nNum1, nNum2) // 20
  ```

- **`MIN(nNum1, nNum2)`**: Retorna o menor valor entre dois números.

  ```harbour
  LOCAL nNum1 := 10, nNum2 := 20
  ? MIN(nNum1, nNum2) // 10
  ```

- **`LOG(nNumero)`**: Retorna o logaritmo natural de um número.

  ```harbour
  LOCAL nValor := 10
  ? LOG(nValor) // logaritmo de 10
  ```

- **`EXP(nNumero)`**: Retorna a exponencial de um número (e^n).

  ```harbour
  LOCAL nValor := 2
  ? EXP(nValor) // e^2
  ```

### Exemplos de Uso:

#### Manipulação de Array:
```harbour
PROCEDURE Main()
   LOCAL aArray := {10, 20, 30}
   AADD(aArray, 40)   // Adiciona 40 ao array
   FOR n := 1 TO ALEN(aArray)
      ? aArray[n]
   NEXT
RETURN
```

#### Manipulação de String:
```harbour
PROCEDURE Main()
   LOCAL cTexto := " Hello Harbour "
   ? "Comprimento da string:", LEN(cTexto)
   ? "String sem espaços:", ALLTRIM(cTexto)
   ? "Maiúsculas:", UPPER(cTexto)
   ? "Substituição:", STRTRAN(cTexto, "Harbour", "Mundo")
RETURN
```

#### Manipulação de Número:
```harbour
PROCEDURE Main()
   LOCAL nValor := 123.456
   ? "Parte inteira:", INT(nValor)
   ? "Arredondado:", ROUND(nValor, 2)
   ? "Valor absoluto de -50:", ABS(-50)
RETURN
```