Table "Categorias" {
  "id_categoria" INT [pk]
  "nome" VARCHAR(100) [not null]
}

Table "Produtos" {
  "id_produto" INT [pk]
  "nome" VARCHAR(100) [not null]
  "descricao" TEXT
  "preco" DECIMAL(10,2) [not null]
  "estoque" INT [not null]
  "id_categoria" INT
}

Table "Clientes" {
  "id_cliente" INT [pk]
  "nome" VARCHAR(100) [not null]
  "cpf" VARCHAR(14) [unique, not null]
  "telefone" VARCHAR(20)
  "email" VARCHAR(100)
}

Table "Funcionarios" {
  "id_funcionario" INT [pk]
  "nome" VARCHAR(100) [not null]
  "cargo" VARCHAR(50)
  "salario" DECIMAL(10,2)
}

Table "Vendas" {
  "id_venda" INT [pk]
  "data_venda" DATETIME [default: `CURRENT_TIMESTAMP`]
  "id_cliente" INT
  "id_funcionario" INT
}

Table "Itens_Venda" {
  "id_item" INT [pk]
  "id_venda" INT
  "id_produto" INT
  "quantidade" INT [not null]
  "preco_unitario" DECIMAL(10,2) [not null]
}

Ref:"Categorias"."id_categoria" < "Produtos"."id_categoria"

Ref:"Clientes"."id_cliente" < "Vendas"."id_cliente"

Ref:"Funcionarios"."id_funcionario" < "Vendas"."id_funcionario"

Ref:"Vendas"."id_venda" < "Itens_Venda"."id_venda"

Ref:"Produtos"."id_produto" < "Itens_Venda"."id_produto"
