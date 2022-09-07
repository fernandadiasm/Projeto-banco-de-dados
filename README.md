## Projeto de Banco de Dados: Ecommerce

Levantamento de alguns requisitos para a modelagem do Banco de Dados:

Narrativa do produto:
- vendo por uma única plataforma online.
- Não pode ser vendido por terceiros.
- Cada produto possui um fornecedor.
- Um ou mais produtos podem compor um pedido.

Narrativa do cliente:
- O cliente pode se cadastrar no site com seu CPF ou CNPJ, ou seja, posso vender para pessoa física ou jurídica.
- O endereço do cliente irá determinar o valor do frete.
- Um cliente pode comprar mais de um pedido. Este tem um período de carência para devolução do produto.

Narrativa do pedido:
- Os pedidos são criados por clientes e possuem informações de compra, endereço e status da entrega.
- Um produto ou mais compoem o pedido.
- O pedido pode ser cancelado.
