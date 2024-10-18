Aqui está a explicação detalhada dos comandos usados no seu código Harbour:

1. **`set scoreboard off`**: Desativa a exibição do "scoreboard" (barra de status), o que normalmente desativa o modo de exibição de mensagens no topo ou no rodapé da tela.

2. **`set date brit`**: Define o formato da data para o formato britânico (DD/MM/AAAA).

3. **`set epoch to 1940`**: Define o "epoch", ou seja, o ano de referência para a data, para 1940. Isso é útil em campos de data abreviados, onde só se usa dois dígitos para o ano.

4. **`set message to 21 center`**: Define a linha da tela onde as mensagens serão exibidas. No caso, a linha 21, e a mensagem será centralizada.

5. **`set wrap on`**: Habilita o modo de quebra de linha automática. Quando um texto ultrapassar o comprimento da linha, ele será automaticamente quebrado na próxima linha.

6. **Declaração de variáveis `cUsuario1` a `cUsuario15`, `dAtual`, `cDataAtual` e `cDisponibilidade`**:
   - Essas são variáveis de string (`cUsuario1`, `cUsuario2`, etc.), onde serão armazenadas informações sobre os usuários e a disponibilidade.
   - **`dAtual := date()`**: Atribui a data atual à variável `dAtual`.
   - **`cDataAtual := DtoC(dAtual)`**: Converte a data para o formato de string usando a função `DtoC` (Data to Character).

7. **`do while .t.`**: Inicia um laço de repetição que continuará indefinidamente até ser interrompido. O `.t.` significa que a condição é sempre verdadeira.

8. **`set color to W/BG+`**: Define a cor do texto para branco sobre fundo cinza claro.

9. **`clear`**: Limpa a tela, removendo todo o conteúdo.

10. **`@`**: Este é o comando para posicionar elementos na tela em coordenadas específicas.
    - Exemplo: **`@ 00,70 say PadR(cDataAtual,10)`**: Exibe a data atual na linha 0, coluna 70, utilizando a função `PadR` para alinhar o texto à direita em um campo de 10 caracteres.

11. **`nLinha`, `nColuna`, `nOpcao`**: Variáveis que controlam a posição dos elementos na tela e a opção escolhida pelo usuário no menu.

12. **Desenho de caixas e linhas com `@ nLinha, nColuna to nLinha+7, nColuna+27`**: Esse comando desenha uma caixa (ou retângulo) na tela, utilizando coordenadas para definir os cantos superior esquerdo e inferior direito.

13. **`prompt` e `message`**: Exibe opções de menu e mensagens de ajuda na tela. Exemplo: **`@ ++nLinha,++nColuna prompt 'Manutencao de Usuarios' message 'Manutencao de Usuarios'`**.

14. **`menu to nOpcao`**: Exibe o menu e atribui a escolha do usuário à variável `nOpcao`.

15. **`lastkey()`**: Retorna o código da última tecla pressionada. Aqui, é usado para verificar se a tecla ESC (código 27) foi pressionada para sair.

16. **Blocos de controle com `if`, `elseif`, `endif`, e `exit`**: Comandos tradicionais de controle de fluxo. Exemplo: **`if nOpcao == 1`** determina se a opção escolhida é a de manutenção de usuários.

17. **Formulários de entrada de dados com `@ nLinha, nColuna get`**:
    - **`get`** é usado para capturar a entrada do usuário. Exemplo: **`@ nLinha, nColuna get cUsuario picture '999' valid !empty(cUsuario)`**: Exibe um campo de entrada para o código do usuário, formatado com o modelo '999' (aceitando apenas números) e validando se o campo não está vazio.

18. **`read`**: Executa a leitura da entrada de dados após a exibição dos campos.

19. **Manipulação de strings com `substr()` e `space()`**:
    - **`substr()`**: Retorna uma parte de uma string, usada para capturar partes de informações como nome, idade, etc. Exemplo: **`substr(cUsuario1,4,60)`** obtém os caracteres do nome a partir da posição 4.
    - **`space(n)`**: Retorna uma string com `n` espaços em branco. Exemplo: **`cNomeUsuario := space(60)`**.

20. **Controle de loops com `loop`**: Usado para voltar ao início de um laço. Aqui, é utilizado para refazer a interação caso algum dado inválido seja inserido.

21. **Exibição de mensagens de sucesso com `padc()`**:
    - **`@ 21,02 say padc('Alteracoes realizadas com sucesso!!!',74) color ('G/N')`**: Exibe uma mensagem de sucesso centralizada na linha 21, com cor verde sobre fundo preto.

22. **Cores em tela com `color`**: O comando **`color`** é usado para definir as cores do texto e do fundo. Exemplo: **`color ('W/N')`** define branco sobre fundo preto.

23. **`alert()`**: Exibe uma caixa de alerta com uma mensagem. Exemplo: **`alert('Limite de usuarios atingido!')`**.

Este é um resumo dos principais comandos e funcionalidades usadas no código Harbour fornecido. O código envolve manipulação de dados em tela, entrada de dados do usuário, controle de menus e estruturas de repetição.