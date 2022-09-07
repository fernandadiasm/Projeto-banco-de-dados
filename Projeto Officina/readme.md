## Proposta
Realizar a modelagem de dados de um sistema de controle e gerenciamento de execução de ordens de serviço em uma oficina mecânica.

### Narrativa da oficina:
- Clientes levam veículos à oficina para serem consertados ou para passarem por revisões periódicas.
- Cada veículo é designado a uma equipe de mecânicos que identifica os serviços a serem executados e preenche uma ordem de serviço com data de entrega.
- A partir da ordem de serviço, calcula-se o valor de cada serviço, consultando uma tabela de referência de mão de obra.
- O valor de cada peça também irá compor a ordem de serviço.
- O cliente autoriza a execução dos serviços.
- A mesma equipe avalia e executa os serviços.
- Os mecânicos possuem código, nome, endereço e especialidade.
- Cada ordem de serviço possui: número, data de emissão, valor, status e uma data para conclusão dos trabalhos.
- Uma ordem de serviço pode ser composta por vários serviços e um mesmo serviço pode estar contido em mais de uma ordem de serviço.
- Uma ordem de serviços pode ter vários tipos de peça e uma peça pode estar presente em mais de uma ordem de serviço.