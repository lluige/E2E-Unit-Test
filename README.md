# Test Cases E2E - Robot Framework


| Módulo / Funcionalidade | Descrição do Caso de Teste      | Entrada / Ação                                                           | Saída Esperada                                          | Status |
| ----------------------- | ------------------------------- | ------------------------------------------------------------------------ | ------------------------------------------------------- | ------ |
| Cadastro                | Cadastro de novo usuário        | Preencher formulário com nome, email válido e dados adicionais           | Mensagem **Account Created**; usuário pode fazer logout | ✅ OK   |
| Login                   | Login com usuário válido        | Inserir email e senha válidos                                            | Nome do usuário aparece no topo da página               | ✅ OK   |
| Login                   | Login com credenciais inválidas | Inserir email e senha incorretos                                         | Mensagem de erro de login                               |    |
| Carrinho de Compras     | Adicionar produto ao carrinho   | Selecionar produto e clicar em **Add to Cart**                           | Produto aparece no carrinho                             |    |
| Checkout                | Checkout com login existente    | Login válido, adicionar produto, preencher endereço e dados de pagamento | Mensagem de pedido confirmado                           |    |
| Carrinho de Compras     | Remover produto do carrinho     | Adicionar dois produtos, remover um                                      | Apenas o produto restante permanece no carrinho         |    |
| Pesquisa                | Pesquisa de produto             | Usar campo de pesquisa para procurar item                                | Resultados correspondentes aparecem listados            |    |
| Logout                  | Logout após compra              | Concluir pedido e clicar em Logout                                       | Retorno à página de login                               |    |
