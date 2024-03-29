-- PERFORMANCE - CREATE INDEX
CREATE INDEX IDX_NOME_CERVEJA ON CERVEJA (NOME);

CREATE INDEX IDX_NOME_CLIENTE_CPF ON CLIENTE (NOME, CPF_CNPJ);

CREATE INDEX IDX_CODIGO_VENDA_CLIENTE_USUARIO
ON VENDA (CODIGO, CODIGO_CLIENTE, CODIGO_USUARIO);

CREATE INDEX IDX_CODIGO_USUARIO_NOME ON USUARIO (CODIGO, NOME);

CREATE INDEX IDX_ITEM_VENDA ON ITEM_VENDA (CODIGO, CODIGO_CERVEJA, CODIGO_VENDA);