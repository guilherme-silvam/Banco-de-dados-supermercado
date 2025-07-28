# Modelagem de Banco de Dados - Supermercado

Este projeto apresenta a modelagem de um banco de dados para um supermercado, incluindo tabelas, relacionamentos e tipos de dados definidos para suportar operações de vendas, controle de estoque, clientes e funcionários.

---

## 📊 Modelo Entidade-Relacionamento (DER)

Abaixo está o diagrama que representa a modelagem do banco de dados:

![Modelo de Banco de Dados](./9cfa9999-e71c-45fd-af6f-6ea98dffcad2.png)

---

## 🗂 Estrutura das Tabelas

### **Categorias**
- `id_categoria` (INT, PK)
- `nome` (VARCHAR(100), NOT NULL)

### **Produtos**
- `id_produto` (INT, PK)
- `nome` (VARCHAR(100), NOT NULL)
- `descricao` (TEXT)
- `preco` (DECIMAL(10,2), NOT NULL)
- `estoque` (INT, NOT NULL)
- `id_categoria` (INT, FK → Categorias)

### **Clientes**
- `id_cliente` (INT, PK)
- `nome` (VARCHAR(100), NOT NULL)
- `cpf` (VARCHAR(14), UNIQUE, NOT NULL)
- `telefone` (VARCHAR(20))
- `email` (VARCHAR(100))

### **Funcionários**
- `id_funcionario` (INT, PK)
- `nome` (VARCHAR(100), NOT NULL)
- `cargo` (VARCHAR(50))
- `salario` (DECIMAL(10,2))

### **Vendas**
- `id_venda` (INT, PK)
- `data_venda` (DATETIME, DEFAULT CURRENT_TIMESTAMP)
- `id_cliente` (INT, FK → Clientes)
- `id_funcionario` (INT, FK → Funcionários)

### **Itens_Venda**
- `id_item` (INT, PK)
- `id_venda` (INT, FK → Vendas)
- `id_produto` (INT, FK → Produtos)
- `quantidade` (INT, NOT NULL)
- `preco_unitario` (DECIMAL(10,2), NOT NULL)

---

## 🔗 Relacionamentos
- **Categorias** → **Produtos** (1:N)  
- **Clientes** → **Vendas** (1:N)  
- **Funcionários** → **Vendas** (1:N)  
- **Vendas** → **Itens_Venda** (1:N)  
- **Produtos** → **Itens_Venda** (1:N)  

---

## 📌 Observações
- O modelo foi projetado para manter integridade referencial e evitar redundância de dados.
- Pode ser facilmente implementado em qualquer SGBD relacional (MySQL, PostgreSQL, SQL Server, etc.).
