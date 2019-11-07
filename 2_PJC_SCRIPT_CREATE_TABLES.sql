CREATE TABLE estilo ( -- 01
	codigo	BIGINT,
	nome	VARCHAR (50),
	CONSTRAINT pk_codigo_estilo PRIMARY KEY (codigo)
);

CREATE TABLE cerveja ( -- 02
	codigo 				BIGINT,
	sku 				VARCHAR(50),
	nome				VARCHAR(80),
	descricao			TEXT,
	valor				DECIMAL(10,2),
	teor_alcoolico		DECIMAL(10,2),
	comissao			DECIMAL(10,2),
	sabor				VARCHAR(50),
	origem				VARCHAR(50),
	codigo_estilo		BIGINT,
	quantidade_estoque	INT,
	foto				VARCHAR(100),
	content_type		VARCHAR(100),
	CONSTRAINT pk_codigo_cerveja PRIMARY KEY (codigo),
	FOREIGN KEY (codigo_estilo) REFERENCES estilo (codigo)
); commit

CREATE TABLE usuario ( -- 03
	codigo				BIGINT,
	nome				VARCHAR(50),
	email				VARCHAR(50),
	senha				VARCHAR(120),
	ativo				CHAR(1), -- tinyint
	data_nascimento		DATE,
	CONSTRAINT pk_codigo_usuario PRIMARY KEY (codigo)
);

CREATE TABLE estado ( -- 04
	codigo		BIGINT,
	nome		VARCHAR(50),
	sigla		VARCHAR(2),
	CONSTRAINT pk_codigo_estado PRIMARY KEY (codigo)
);

CREATE TABLE cidade ( -- 05
	codigo			BIGINT,
	nome			VARCHAR(50),
	codigo_estado	BIGINT,
	CONSTRAINT pk_codigo_cidade PRIMARY KEY (codigo),
	FOREIGN KEY (codigo_estado) REFERENCES estado (codigo)
);

CREATE TABLE cliente ( -- 06
	codigo			BIGINT,
	nome			VARCHAR(80),
	tipo_pessoa		VARCHAR(15),
	cpf_cnpj		VARCHAR(30),
	telefone		VARCHAR(20),
	email			VARCHAR(50),
	logradouro		VARCHAR(50),
	numero			VARCHAR(15),
	complemento		VARCHAR(20),
	cep				VARCHAR(15),
	codigo_cidade	BIGINT,
	CONSTRAINT pk_codigo_cliente PRIMARY KEY (codigo),
	FOREIGN KEY (codigo_cidade) REFERENCES cidade (codigo)
);

CREATE TABLE venda ( -- 07
	codigo	  			BIGINT,
	data_criacao		TIMESTAMP, -- datatime
	valor_frete			DECIMAL(10,2),
	valor_desconto		DECIMAL(10,2),
	valor_total			DECIMAL(10,2),
	status				VARCHAR(30),
	observacao			VARCHAR(200),
	data_hora_entrega	TIMESTAMP, -- datatime
	codigo_cliente		BIGINT,
	codigo_usuario		BIGINT,
	CONSTRAINT pk_codigo_venda PRIMARY KEY (codigo),
	FOREIGN KEY (codigo_usuario) REFERENCES usuario (codigo),
	FOREIGN KEY (codigo_cliente) REFERENCES cliente (codigo)
);

CREATE TABLE item_venda ( -- 08
	codigo			BIGINT,
	quantidade		INT,
	valor_unitario	DECIMAL(10,2),
	codigo_cerveja	BIGINT,
	codigo_venda	BIGINT,
	CONSTRAINT pk_codigo_item_venda PRIMARY KEY (codigo),
	FOREIGN KEY (codigo_cerveja) REFERENCES cerveja (codigo),
	FOREIGN KEY (codigo_venda) REFERENCES venda (codigo)
);

CREATE TABLE permissao ( -- 09
	codigo		BIGINT,
	nome		VARCHAR(50),
	CONSTRAINT pk_codigo_permissao PRIMARY KEY (codigo)
);

CREATE TABLE grupo ( -- 10
	codigo		BIGINT,
	nome		VARCHAR(50),
	CONSTRAINT pk_codigo_grupo PRIMARY KEY (codigo)
);

CREATE TABLE grupo_permissao ( -- 11
	codigo_grupo 	 BIGINT,
	codigo_permissao BIGINT,
	FOREIGN KEY (codigo_grupo) REFERENCES grupo (codigo),
	FOREIGN KEY (codigo_permissao) REFERENCES permissao (codigo)
);

CREATE TABLE usuario_grupo ( -- 12
	codigo_usuario	BIGINT,
	codigo_grupo	BIGINT,
	FOREIGN KEY (codigo_usuario) REFERENCES usuario (codigo),
	FOREIGN KEY (codigo_grupo) REFERENCES grupo (codigo)
);

CREATE TABLE schema_version ( -- 13
	installed_rank 	INT,
	version_		VARCHAR(50),
	description		VARCHAR(200),
	type_			VARCHAR(20),
	script			VARCHAR(1000),
	checksum		INT,
	installed_by	VARCHAR(100),
	installed_on	TIMESTAMP,
	execution_time	INT,
	success			CHAR(1) -- tinyint
);