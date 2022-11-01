/*CRIAÇÃO DAS TABELAS*/

CREATE TABLE uf (
    `uf_sigla` CHAR(2) PRIMARY KEY,
    `uf_nome` VARCHAR(30)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE cidade (
    `cid_codi` INTEGER PRIMARY KEY,
    `uf_sigla` CHAR(2),
    `cid_nome` VARCHAR(30)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE pessoa (
    `pes_codi` INTEGER PRIMARY KEY,
    `cidade_cid_codi` INTEGER,
    `pes_nome` VARCHAR(30)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE ator (
    `pessoa_pes_codi` INTEGER
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE ator_filme (
    `ator_pessoa_pes_codi` INTEGER,
    `filme_fil_codi` INTEGER
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE filme (
    `fil_codi` INTEGER PRIMARY KEY,
    `fil_nome` VARCHAR(30),
    `fil_ano` CHAR(4)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE diretor (
    `pessoa_pes_codi` INTEGER
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE diretor_filme (
    `diretor_pessoa_pes_codi` INTEGER,
    `filme_fil_codi` INTEGER,
    `tipo_direcao_tp_dir_codi` INTEGER
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE tipo_direcao (
    `tp_dir_codi` INTEGER PRIMARY KEY,
    `tp_dir_nome` VARCHAR(15)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;













/*CONSTRAINTS*/

ALTER TABLE cidade ADD CONSTRAINT FK_cidade
    FOREIGN KEY (uf_sigla)
    REFERENCES uf (uf_sigla);
 
ALTER TABLE pessoa ADD CONSTRAINT FK_pessoa
    FOREIGN KEY (cidade_cid_codi)
    REFERENCES cidade (cid_codi);
 
ALTER TABLE ator ADD CONSTRAINT FK_ator
    FOREIGN KEY (pessoa_pes_codi)
    REFERENCES pessoa (pes_codi);
 
ALTER TABLE ator_filme ADD CONSTRAINT FK_ator_filme_1
    FOREIGN KEY (ator_pessoa_pes_codi)
    REFERENCES pessoa (pes_codi);
	
ALTER TABLE ator_filme ADD CONSTRAINT FK_ator_filme_2
    FOREIGN KEY (filme_fil_codi)
    REFERENCES filme (fil_codi);
 
ALTER TABLE diretor ADD CONSTRAINT FK_diretor
    FOREIGN KEY (pessoa_pes_codi)
    REFERENCES pessoa (pes_codi);
 
ALTER TABLE diretor_filme ADD CONSTRAINT FK_diretor_filme_1
    FOREIGN KEY (diretor_pessoa_pes_codi)
    REFERENCES pessoa (pes_codi);
	
ALTER TABLE diretor_filme ADD CONSTRAINT FK_diretor_filme_2
    FOREIGN KEY (filme_fil_codi)
    REFERENCES filme (fil_codi);
	
ALTER TABLE diretor_filme ADD CONSTRAINT FK_diretor_filme
    FOREIGN KEY (tipo_direcao_tp_dir_codi)
    REFERENCES tipo_direcao (tp_dir_codi);





/*INSERÇÃO DE DADOS*/

/*TABELA FILME*/

INSERT INTO filme (fil_codi, fil_nome, fil_ano) VALUES (1, 'Mulher Maravilha', '2017');
INSERT INTO filme (fil_codi, fil_nome, fil_ano) VALUES (2, 'Alita: Anjo de Combate', '2019');
INSERT INTO filme (fil_codi, fil_nome, fil_ano) VALUES (3, 'Escolha Perfeita', '2012');
INSERT INTO filme (fil_codi, fil_nome, fil_ano) VALUES (4, 'Já Estou Com Saudades', '2015');
INSERT INTO filme (fil_codi, fil_nome, fil_ano) VALUES (5, 'Jogos Vorazes', '2012');

/*TABELA UF*/

INSERT INTO uf (uf_sigla, uf_nome) VALUES ('RS', 'Rio Grande do Sul');

/*TABELA CIDADE*/

INSERT INTO cidade (cid_codi, uf_sigla, cid_nome) VALUES (1, 'RS', 'Imbé');
INSERT INTO cidade (cid_codi, uf_sigla, cid_nome) VALUES (2, 'RS', 'Tramandaí');
INSERT INTO cidade (cid_codi, uf_sigla, cid_nome) VALUES (3, 'RS', 'Osório');

/*TABELA PESSOA*/

INSERT INTO pessoa (pes_codi, cidade_cid_codi, pes_nome) VALUES (1, 1, 'Lucas');
INSERT INTO pessoa (pes_codi, cidade_cid_codi, pes_nome) VALUES (2, 1, 'José');
INSERT INTO pessoa (pes_codi, cidade_cid_codi, pes_nome) VALUES (3, 1, 'Marina');
INSERT INTO pessoa (pes_codi, cidade_cid_codi, pes_nome) VALUES (4, 1, 'Rita');
INSERT INTO pessoa (pes_codi, cidade_cid_codi, pes_nome) VALUES (5, 1, 'Sebastião');
INSERT INTO pessoa (pes_codi, cidade_cid_codi, pes_nome) VALUES (6, 3, 'Mariana');
INSERT INTO pessoa (pes_codi, cidade_cid_codi, pes_nome) VALUES (7, 2, 'João');
INSERT INTO pessoa (pes_codi, cidade_cid_codi, pes_nome) VALUES (8, 2, 'Paulo');
INSERT INTO pessoa (pes_codi, cidade_cid_codi, pes_nome) VALUES (9, 3, 'Julio');
INSERT INTO pessoa (pes_codi, cidade_cid_codi, pes_nome) VALUES (10, 1, 'Silvia');

