DROP DATABASE IF EXISTS siga;
CREATE DATABASE IF NOT EXISTS siga;
USE siga;

-- ----------------------------------------------------------------------------
-- Pessoa
-- Criado por: Grupo 6A
-- TODO: popular as tabelas Endereço e E-mail
-- TODO: criar TAs

DROP TABLE IF EXISTS tbl_pessoa;
CREATE TABLE IF NOT EXISTS tbl_pessoa
  (
     pessoa_id    VARCHAR(15) NOT NULL,
     tipo_doc     VARCHAR(15) NOT NULL,
     rg_pessoa    VARCHAR(9),
     prenome      VARCHAR(50),
     sobrenome    VARCHAR(50),
     raca         VARCHAR(50),
     sexo         VARCHAR(30),
     cidade_nasc  VARCHAR(60),
     pais_nasc    VARCHAR(30),
     uf_nasc      VARCHAR(30),
     data_nasc    DATE,
     pai_filiacao VARCHAR(30),
     mae_filiacao VARCHAR(30),
     PRIMARY KEY (pessoa_id)
  );

-- VIEW TBL_PESSOA, MOSTRA ALGUMAS INFORMACOES SOBRE CADA PESSOA
DROP VIEW IF EXISTS v_pessoa;
CREATE VIEW v_pessoa AS
SELECT pessoa_ID, tipo_doc, prenome, sobrenome, pais_nasc
FROM tbl_pessoa;


-- PROCEDURE TBL_PESSOA EXIBE INFO SOBRE PESSOA A PARTIR DO PESSOA_ID
DROP PROCEDURE IF EXISTS exibe_pessoa_info;
delimiter //
CREATE PROCEDURE exibe_pessoa_info(
IN pessoa_i VARCHAR(15))
BEGIN
	SELECT tipo_doc, prenome, sobrenome FROM tbl_pessoa WHERE pessoa_i = pessoa_id;
END //
delimiter ;

-- TRIGER
-- Trigger para tbl_pessoa, nao permite o update de data de nascimento

DROP TRIGGER IF EXISTS t_before_update_pessoa_nascimento ;
delimiter $$
CREATE TRIGGER t_before_update_pessoa_nascimento
	BEFORE UPDATE
	ON tbl_pessoa
	FOR EACH ROW
	BEGIN

		IF NEW.data_nasc <> OLD.data_nasc THEN
			signal sqlstate '45000' set message_text = "Voce nao pode alterar a data de nascimento" ;

		END IF;

	END$$

delimiter ;

-- funcao que retorna o nome de uma pessoa, dado seu documento
-- FUNCTION
DROP function IF EXISTS fn_nome_pessoaid;
delimiter $$
CREATE function fn_nome_pessoaid(pessoaid VARCHAR(15))
returns VARCHAR(50)
begin
  DECLARE nome VARCHAR(50);

  SELECT prenome
  INTO   nome
  FROM   tbl_pessoa
  WHERE  pessoaid = pessoa_id;

  RETURN nome;
end$$
delimiter ;


DROP TABLE IF EXISTS tbl_email;
CREATE TABLE IF NOT EXISTS tbl_email
  (
     pessoa VARCHAR(15) NOT NULL,
     email  VARCHAR(60),
     CONSTRAINT pk_email PRIMARY KEY (pessoa, email),
     CONSTRAINT email_fk_pessoa FOREIGN KEY (pessoa) REFERENCES tbl_pessoa (pessoa_id)
  );


DROP TABLE IF EXISTS tbl_endereco;
CREATE TABLE IF NOT EXISTS tbl_endereco
  (
     pessoa          VARCHAR(15) NOT NULL,
     cep_end         VARCHAR(30),
     pais_end        VARCHAR(60),
     uf_end          VARCHAR(60),
     cidade_end      VARCHAR(30),
     bairro_end      VARCHAR(30),
     complemento_end VARCHAR(30),
     rua_end         VARCHAR(30),
     ddd_end_tel     VARCHAR(30),
     prefixo_end_tel VARCHAR(30),
     numero_end_tel  VARCHAR(30),
     ramal_end_tel   VARCHAR(30),
     tipo_end        VARCHAR(30),
     CONSTRAINT pk_endereco PRIMARY KEY (pessoa, cep_end),
     CONSTRAINT end_fk_pessoa FOREIGN KEY (pessoa) REFERENCES tbl_pessoa (pessoa_id)
  );


INSERT INTO tbl_pessoa (pessoa_id, tipo_doc, rg_pessoa, prenome, sobrenome, raca, sexo, cidade_nasc, pais_nasc, UF_nasc, data_nasc, pai_filiacao, mae_filiacao)
VALUES

-- Docentes
('24174616256', 'CPF', '890321829', 'José', 'Silva', 'Branca', 'Masculino', 'São Carlos', 'Brasil', 'SP', '1990-12-31', 'João Silva', 'Maria Machado'),
('40078919665', 'CPF', '820321829', 'Raimundo', 'Carvalho', 'Branca', 'Masculino', 'Pirapora do Bom Jesus', 'Brasil', 'SP', '1989-09-24', 'Joselyto Carvalho', 'Maria Castelo'),
('72003800670', 'CPF', '890331829', 'Alice', 'Moreira', 'Branca', 'Feminino', 'São Paulo', 'Brasil', 'SP', '1992-01-23', 'Fernando Moreira', 'Ana Santos'),
('72799547230', 'CPF', '890321829', 'Roberta', 'Schmitt', 'Branca', 'Feminino', 'Belo Horizonte', 'Brasil', 'MG', '1988-04-04', 'José Schmitt', 'Carla Pereira'),
('11104385910', 'CPF', '894221829', 'Legolas', 'Silva', 'Elfo', 'Masculino', 'Terra Média', 'Brasil', 'AC', '1991-02-28', 'Sívio Silva', 'Sílva Silva'),

-- Estudantes
('90778718530', 'CPF', '890441829', 'Alice', 'Alves', 'Branca', 'Feminino', 'Belo Horizonte', 'Brasil', 'MG', '1988-04-04', 'José Schmitt', 'Carla Pereira'),
('99982994204', 'CPF', '890551829', 'Bob', 'Braga', 'Branca', 'Feminino', 'Belo Horizonte', 'Brasil', 'MG', '1988-04-04', 'José Schmitt', 'Carla Pereira'),
('02835384308', 'CPF', '890661829', 'Carol', 'Cardoso', 'Branca', 'Feminino', 'Belo Horizonte', 'Brasil', 'MG', '1988-04-04', 'José Schmitt', 'Carla Pereira'),
('91994871601', 'CPF', '890771829', 'Dave', 'Dias', 'Branca', 'Feminino', 'Belo Horizonte', 'Brasil', 'MG', '1988-04-04', 'José Schmitt', 'Carla Pereira'),
('77426047792', 'CPF', '890881829', 'Eve', 'Esteves', 'Branca', 'Feminino', 'Belo Horizonte', 'Brasil', 'MG', '1988-04-04', 'José Schmitt', 'Carla Pereira'),
('54523707227', 'CPF', '550321829', 'Frank', 'Fernandes', 'Branca', 'Feminino', 'Belo Horizonte', 'Brasil', 'MG', '1988-04-04', 'José Schmitt', 'Carla Pereira');


-- ----------------------------------------------------------------------------
-- Docente
-- Criado por: Grupo 6A
-- TODO: modificar os outros campos, mas manter os CPFs!

DROP TABLE IF EXISTS tbl_docente;
CREATE TABLE tbl_docente
  (
     pessoa          VARCHAR(15) NOT NULL,
     titularidade    VARCHAR(50),
     alivio          VARCHAR(30),
     CONSTRAINT pk_docente PRIMARY KEY (pessoa),
     CONSTRAINT docente_fk_pessoa FOREIGN KEY (pessoa) REFERENCES tbl_pessoa (pessoa_id)
  );



DROP TABLE IF EXISTS tbl_carga_horaria;
CREATE TABLE tbl_carga_horaria
  (
     pessoa           VARCHAR(15) NOT NULL,
     semestre_inicio  DATE,
     semestre_termino DATE,
     ano_inicio       VARCHAR(8),
     ano_termino      VARCHAR(8),
     horas_aula       INT,
     CONSTRAINT pk_carga PRIMARY KEY (pessoa, semestre_inicio),
     CONSTRAINT carga_fk_pessoa FOREIGN KEY (pessoa) REFERENCES tbl_pessoa (pessoa_id)
  );

-- TABELA LICENCA
DROP TABLE IF EXISTS tbl_licenca;
CREATE TABLE IF NOT EXISTS tbl_licenca
  (
     pessoa_id    VARCHAR(15) NOT NULL,
     tipo         VARCHAR(40),
     documento    VARCHAR(15),
     data_inicio  DATE,
     data_final   DATE,
     CONSTRAINT pk_licenca PRIMARY KEY (pessoa_id,data_inicio,data_final),
     CONSTRAINT licenca_fk FOREIGN KEY (pessoa_id) REFERENCES tbl_pessoa(pessoa_id)

  );


INSERT INTO tbl_docente (pessoa, titularidade, alivio) VALUES
('24174616256', 'titular', 'alivio integral'),
('40078919665', 'titular', 'alivio integral'),
('72003800670', 'titular', 'alivio parcial'),
('72799547230', 'titular', 'alivio integral'),
('11104385910', 'titular', 'alivio parcial');

-- POPULANDO EMAIL
INSERT INTO tbl_email (pessoa,email) VALUES
-- Docente
('24174616256','professorMat@usp.br'),
('40078919665','raimundo@ufscar.br'),
('72003800670', 'alice@dc.ufscar.br'),
('72799547230','Robertask8@hotmail.com'),
('11104385910','LegolasLOTR@gmail.com'),
-- Estudante
('90778718530','AliceMaravilha@ufscar.br'),
('99982994204','Esponja@dc.ufscar.br'),
('02835384308','Carol@dc.ufscar.br'),
('91994871601','Dave@dc.ufscar.br'),
('77426047792','vaporeon@ufscar.br'),
('54523707227','Frankson@usp.br');


-- POPULANDO ENDERECO
INSERT INTO tbl_endereco (pessoa,cep_end, pais_end, uf_end, cidade_end, bairro_end, complemento_end, rua_end, ddd_end_tel, prefixo_end_tel, numero_end_tel, ramal_end_tel, tipo_end) VALUES
-- Docente
('24174616256', '14782000','Brasil','SP','Sao carlos','Cidade Jardim','perto do carrefour','rua margaridas 510','16','21','32428000','2','casa'),
('40078919665', '14782000','Brasil','SP','Sao carlos','Cidade Jardim','academia pares','rua margaridas 222','16','21','32228000','2','apartamento 15'),
('72003800670', '14122000','Brasil','SP','Araraquara','Jose xavier','lanchonete bom lanche','rua 15 de novembro 345','16','21','31228000','2','casa'),
('72799547230', '11122000','Brasil','SP','Araraquara','Santo agostinho','academia max gym','rua das margaridas 456','16','21','35528000','2','casa'),
('11104385910', '32142000','Brasil','SP','Ibate','Sao diego','restaurante ya san','rua dos canarios 600','16','21','35528000','2','apartamento 34'),
-- Estudante
('99982994204','89782000','Brasil','SP','Jaboticabal','Itapua','proximo a borracharia','rua mascarenhas 510','17','15','87428870','1','casa'),
('90778718530','8965000','Brasil','SP','Jaboticabal','araras','proximo ao santander','rua cajuzeiros 810','17','15','87498770','1','casa'),
('02835384308','8879600','Brasil','SP','Jaboticabal','marechal deodoro','proximo ao santander','rua pitangas 110','17','15','87467770','1','casa'),
('91994871601','8855600','Brasil','SP','Campinas','santa tereza','proximo a unicamp','rua dos bandeirantes 170','19','15','87400770','1','casa'),
('77426047792','9755600','Brasil','SP','Campinas','santa monica','proximo ao pinguin','rua dos coroneis 980','19','15','87497860','1','casa'),
('54523707227','9759900','Brasil','SP','Campinas','santa monica','proximo ao shopping','rua dos mulatos 116','19','15','87456860','1','casa');


DROP TABLE IF EXISTS tbl_carga_horaria;
CREATE TABLE tbl_carga_horaria
  (
     pessoa           VARCHAR(15) NOT NULL,
     semestre_inicio  DATE,
     semestre_termino DATE,
     ano_inicio       VARCHAR(8),
     ano_termino      VARCHAR(8),
     horas_aula       INT,
     CONSTRAINT pk_carga PRIMARY KEY (pessoa, semestre_inicio,ano_inicio),
     CONSTRAINT carga_fk_pessoa FOREIGN KEY (pessoa) REFERENCES tbl_pessoa (pessoa_id)
  );

INSERT INTO tbl_carga_horaria (pessoa,semestre_inicio,semestre_termino,ano_inicio,ano_termino,horas_aula) VALUES
-- Docente
('24174616256','2016-02-10','2016-07-01','2016','2016',60),
('40078919665','2014-02-13','2016-02-01','2014','2016',240),
('72003800670','2015-06-10','2015-11-01','2015','2015',80),
('72799547230','2016-02-10','2016-07-01','2016','2016',60),
('11104385910','2015-02-10','2015-07-01','2015','2015',60);


-- ----------------------------------------------------------------------------
-- Membro
-- Criado por: Wellyson (4A)
-- membro(PK(FK_Docente(pessoa)), categoria, data_eleicao, periodo_inicio, periodo_fim) está na 3FN porque:
-- Está na 1FN: porque todos os atributos são atômicos (o atributo composto “período” foi dividido em “período_inicio” e “periodo_fim”);
-- Está na 2FN: porque só há uma chave primária (e portanto, não existe atributo não chave que é dependente de somente uma parte da chave primária);
-- Está na 3FN: porque não existem atributos não chave que sejam dependentes de outros atributos não chave.

DROP TABLE IF EXISTS tbl_membro;
CREATE TABLE tbl_membro
  (
     id            VARCHAR(15) NOT NULL,
     categoria      VARCHAR(64) NOT NULL,
     data_eleicao   DATE NOT NULL,
     periodo_inicio DATE NOT NULL,
     periodo_fim    DATE NOT NULL,
     CONSTRAINT membro_pk PRIMARY KEY (id),
     CONSTRAINT membro_fk_docente FOREIGN KEY (id) REFERENCES tbl_docente (pessoa)
  );


-- ----------------------------------------------------------------------------
-- Reunião
-- Criado por: André Rocha (4A)

DROP TABLE IF EXISTS tbl_reuniao;
CREATE TABLE tbl_reuniao
  (
     numero INT(5) NOT NULL,
     data   DATE NOT NULL,
     CONSTRAINT reuniao_pk PRIMARY KEY (numero)
  );

INSERT INTO tbl_reuniao(numero, data) VALUES
(1, '2016-02-12'),
(2, '2016-02-15'),
(3, '2016-02-23'),
(4, '2016-05-06'),
(5, '2016-05-22'),
(6, '2016-06-11'),
(7, '2016-06-17'),
(8, '2016-06-25'),
(9, '2016-07-08');

-- View para mostrar somente as reuniões do mês 05/2016-07
DROP VIEW IF EXISTS view_reuniao;
CREATE VIEW view_reuniao
AS
  SELECT * FROM tbl_reuniao
  WHERE tbl_reuniao.data < '2016-06' AND tbl_reuniao.data > '2016-04';


-- ----------------------------------------------------------------------------
-- Ata
-- Criado por: Wellyson (4A)
-- ata(PK(FK_Reuniao(numero)), decisoes, pauta, topicos, resumo) está na 3FN:
-- Está na 1FN: porque todos os atributos são atômicos;
-- Está na 2FN: porque só há uma chave primária (e portanto, não existe atributo não chave que é dependente de somente uma parte da chave primária);
-- Está na 3FN: porque não existem atributos não chave que sejam dependentes de outros atributos não chave.

DROP TABLE IF EXISTS tbl_ata;
CREATE TABLE tbl_ata
  (
     numero_reuniao INT(5) NOT NULL,
     decisoes       VARCHAR(256) NOT NULL,
     pauta          VARCHAR(256) NOT NULL,
     topicos        VARCHAR(256) NOT NULL,
     resumo         VARCHAR(256) NOT NULL,
     CONSTRAINT ata_pk PRIMARY KEY (numero_reuniao),
     CONSTRAINT ata_fk_reuniao FOREIGN KEY (numero_reuniao) REFERENCES tbl_reuniao (numero)
  );

-- ----------------------------------------------------------------------------
-- Contribuição
-- Criado por: Lucas Bataglia (4A)
-- Contribuição(PK(FK_Membro(id), FK_ata(numero_reuniao)) está na 3FN:
-- Está na 1FN: porque todos os atributos são atômicos;
-- Está na 2FN: Não existe atributo não chave que é dependente de somente uma parte da chave primária);
-- Está na 3FN: porque não existem atributos não chave que sejam dependentes de outros atributos não chave.

DROP TABLE IF EXISTS tbl_ata;
CREATE TABLE tbl_ata
  (
     numero_reuniao INT(5) NOT NULL,
     decisoes       VARCHAR(256) NOT NULL,
     pauta          VARCHAR(256) NOT NULL,
     topicos        VARCHAR(256) NOT NULL,
     resumo         VARCHAR(256) NOT NULL,
     CONSTRAINT ata_pk PRIMARY KEY (numero_reuniao),
     CONSTRAINT ata_fk_reuniao FOREIGN KEY (numero_reuniao) REFERENCES tbl_reuniao (numero)
  );


-- ----------------------------------------------------------------------------
-- Participa
-- Criado por: Lucas Bataglia (4A)
-- Participa ( PK(FK_Membro(id), FK_reuniao(numero_reuniao))) está na 3FN:
-- Está na 1FN: porque todos os atributos são atômicos;
-- Está na 2FN: Não existe atributo não chave que é dependente de somente uma parte da chave primária);
-- Está na 3FN: porque não existem atributos não chave que sejam dependentes de outros atributos não chave.

DROP TABLE IF EXISTS tbl_participa;
CREATE TABLE tbl_participa
  (
     id             VARCHAR(15) NOT NULL,
     numero_reuniao INT(5) NOT NULL,
     CONSTRAINT participa_pk PRIMARY KEY (id, numero_reuniao),
     CONSTRAINT part_fk_reuniao FOREIGN KEY (numero_reuniao) REFERENCES tbl_reuniao (numero),
     CONSTRAINT part_fk_membro FOREIGN KEY (id) REFERENCES tbl_membro (id)
  );


-- ----------------------------------------------------------------------------
-- Estudante
-- Criado por: Pedro Padoveze

DROP TABLE IF EXISTS tbl_estudante;
CREATE TABLE IF NOT EXISTS tbl_estudante
  (
     ano_conclusao INT(4),
     ensino_medio  VARCHAR(80),
     ra            INT(6),
     pessoa_id     VARCHAR(15) NOT NULL,
     CONSTRAINT fk_pessoa_id FOREIGN KEY (pessoa_id) REFERENCES tbl_pessoa (pessoa_id),
     CONSTRAINT estudante_pk PRIMARY KEY (ra)
  );

INSERT INTO tbl_estudante (ra, ensino_medio, ano_conclusao, pessoa_id) VALUES
(524896, "Escola Primaria Carlos Gomes", 2012, '90778718530'),
(425169, "Escola Primaria Carlos Gomes", 2010, '99982994204'),
(334578, "Colegio Municipal do Municipio de São Carlos", 2009, '02835384308'),
(654321, "Colegio CBA", 2015, '91994871601'),
(112358, "Colegio Fibonacci", 2004, '54523707227'),
(123456, "Colegio ABC", 2005, '77426047792');

-- ----------------------------------------------------------------------------
-- Departamento
-- Criado por: Rodrigo Teixeira Garcia (5A)

DROP TABLE IF EXISTS  tbl_departamento;
CREATE TABLE IF NOT EXISTS tbl_departamento
  (
     centro VARCHAR(10) NOT NULL,
     campi  VARCHAR(20) NOT NULL,
     nome   VARCHAR(50) NOT NULL,
     sigla  VARCHAR(10) NOT NULL,
     PRIMARY KEY (sigla)
  );


-- View que conta o numero de departamentos
DROP view IF EXISTS v_departamento_numero;
CREATE OR replace VIEW v_departamento_numero
AS
  SELECT nome     AS nome,
         Count(*) AS qtd_depart
  FROM   tbl_departamento
  GROUP  BY nome;


-- View que exibe cada departamento com seu respectivo campus e centro
DROP view IF EXISTS v_departamentos;
CREATE OR REPLACE view v_departamentos
AS
  SELECT nome, campi, sigla, centro
  FROM   tbl_departamento;


INSERT INTO tbl_departamento(centro, campi, nome, sigla) VALUES
("CCET", "São Carlos", "Departamento de Computação", "DC"),
("CCET", "Sorocaba", "Departamento de Computação", "DComp"),
("CCA", "Araras", "Desenvolvimento Rural", "DDR"),
("CCET", "São Carlos", "Departamento de Matemática", "DM"),
("CCET", "São Carlos", "Departamento de Física", "DF");

-- ----------------------------------------------------------------------------
-- Disciplina
-- Criado por: Vitor Rocha (5A)

DROP TABLE IF EXISTS tbl_disciplina;
CREATE TABLE IF NOT EXISTS tbl_disciplina
  (
     codigo                  VARCHAR(20) NOT NULL,
     nome                    VARCHAR(40),
     ementa                  TEXT,
     creditospraticos        INT,
     creditosteoricos        INT,
     departamento            VARCHAR(10) NOT NULL,
     CONSTRAINT fk_depto_disc FOREIGN KEY (departamento) REFERENCES tbl_departamento (sigla),
     CONSTRAINT pk_disc PRIMARY KEY (codigo)
  );

INSERT INTO tbl_disciplina (codigo, nome, ementa, creditosTeoricos, creditosPraticos, departamento) VALUES
('02.522-4', 'Laboratorio de Banco de Dados', '', 0, 2, 'DC'),
('02.521-6', 'Banco de Dados', '', 4, 0, 'DC'),
('02.507-0', 'Construcao de Algoritmos e Programacao', '', 4, 4, 'DComp'),
('02.502-0', 'Programacao de Computadores', '', 2, 2, 'DComp'),
('08.910-9', 'Calculo 1', '', 4, 0, "DM"),
('02.034-6', 'Teoria dos Grafos', '', 4, 0, "DC"),
('06.201-4', 'Comunicação e Depressão', '', 4, 0, "DDR"),
('100.054-0', 'ACIEPE - Inclusão Digital', '', 0, 4, "DC");

-- ----------------------------------------------------------------------------
-- Atividade Complementar
-- Criado por: Rodrigo Teixeira Garcia (5A)

DROP TABLE IF EXISTS tbl_atividade_complementar;
CREATE TABLE IF NOT EXISTS tbl_atividade_complementar (
    tipo VARCHAR(50) NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL,
    id INT NOT NULL,
    ra_ativ INT NOT NULL,
    codigo_disciplina VARCHAR(20),
    CONSTRAINT fk_disciplina FOREIGN KEY (codigo_disciplina) REFERENCES tbl_disciplina (codigo),
    FOREIGN KEY (ra_ativ)
        REFERENCES tbl_estudante (ra),
    PRIMARY KEY (id, ra_ativ)
);

-- View para contagem das atividades complementares
DROP view IF EXISTS v_atividade_numero;
CREATE OR REPLACE view v_atividade_numero
AS
  SELECT tipo AS tipo,
         Count(*)     AS qtd_ativ
  FROM   tbl_atividade_complementar
  GROUP  BY tipo;


-- View para exibição de qual atividade cada aluno realiza
DROP view IF EXISTS v_atividade_aluno;
CREATE OR replace VIEW v_atividade_aluno
AS
  SELECT a.tipo,
         e.ra
  FROM   tbl_atividade_complementar AS a,
         tbl_estudante AS e
  WHERE  a.ra_ativ = e.ra;

-- PROCEDURE
--
-- Feito por: Rodrgio Teixeira (414387)
--
-- Adiciona uma atividade complementar no currículo de um determinado aluno
-- acrescendo o id em 1 e atualizando os créditos do mesmo aluno

DROP PROCEDURE IF EXISTS pr_add_ativ_complementar;
DELIMITER $$
CREATE PROCEDURE pr_add_ativ_complementar(ra INT, tipo VARCHAR(50), carga INT, descricao VARCHAR(100), disciplina VARCHAR(20))
BEGIN
	DECLARE id INT;

	SELECT MAX(tbl_atividade_complementar.id)
	INTO id
	FROM tbl_atividade_complementar
	WHERE tbl_atividade_complementar.ra_ativ = ra;

	IF ISNULL(id) THEN
		SET id = 0;
	END IF;

	INSERT INTO tbl_atividade_complementar(tipo, descricao, carga_horaria, id, ra_ativ, codigo_disciplina) VALUES
	(tipo, descricao, carga, id+1, ra, disciplina);

	CALL pr_atualizar_creditos(ra);

END$$
DELIMITER ;

INSERT INTO tbl_atividade_complementar(tipo, descricao, carga_horaria, id, ra_ativ) VALUES
("Empresa Júnior", "Empresa ambientada no contexto universitário", 60, 1, 524896),
("Atlética", "Organização que visa eventos de integração entre os alunos", 40, 1, 425169),
("DCE", "Diretório Central dos Estudantes. Órgão para representação dos estudantes", 60, 1, 334578),
("PET", "Programa de Ensino Tutorial. Desenvolvimento de projetos com auxílio de bolsa e supervisionado", 60, 1, 123456),
("IC", "Iniciação Científica. Desenvolvimento de projeto com auxílio ou não de bolsa", 60, 1, 654321);

INSERT INTO tbl_atividade_complementar(tipo, descricao, carga_horaria, id, ra_ativ, codigo_disciplina) VALUES
("ACIEPE", "Inclusão Digital", 60, 2, 334578, '100.054-0');

-- ----------------------------------------------------------------------------
-- Técnico Administrativo
-- Criado por: Guilherme Lemos (4A)
-- TecnicoAdministrativo(PK(FK_Pessoa(id))) está na 3FN:
-- Está na 1FN: porque todos os atributos são atômicos;
-- Está na 2FN: porque só há uma chave primária (e portanto, não existe atributo não chave que é dependente de somente uma parte da chave primária);
-- Está na 3FN: porque não existem atributos não chave que sejam dependentes de outros atributos não chave.

DROP TABLE IF EXISTS tbl_tecnico_administrativo;
CREATE TABLE tbl_tecnico_administrativo
  (
     id VARCHAR(15) NOT NULL,
     CONSTRAINT tecnico_pk PRIMARY KEY (id),
     CONSTRAINT tecnico_fk_id FOREIGN KEY (id) REFERENCES tbl_pessoa (pessoa_id)
  );


INSERT INTO tbl_tecnico_administrativo(id) VALUES
('24174616256');

-- ----------------------------------------------------------------------------
-- Calendário
-- Criado por: Vinicius Carvalho (6A)

DROP TABLE IF EXISTS tbl_calendario;
CREATE TABLE IF NOT EXISTS tbl_calendario (
    ano INT NOT NULL,
    semestre INT NOT NULL,
    tipo VARCHAR(10),
    data_ini DATE,
    data_ter DATE,
    CONSTRAINT pk_calendario PRIMARY KEY (ano , semestre)
);

INSERT INTO tbl_calendario(ano, semestre, tipo, data_ini, data_ter) VALUES
(2016, 1, "Acadêmico", '2016-02-01', '2016-07-30'),
(2016, 2, "Acadêmico", '2016-08-01', '2016-12-15'),
(2017, 1, "Acadêmico", '2017-02-01', '2017-07-30'),
(2017, 2, "Acadêmico", '2017-08-01', '2017-12-15'),
(2018, 1, "Acadêmico", '2018-02-01', '2018-07-30');

-- View que altera o formato de exibição das datas no calendário
DROP VIEW IF EXISTS v_calendario;
CREATE VIEW v_calendario AS
    SELECT
        tbl_calendario.ano AS ano,
        tbl_calendario.semestre AS semestre,
        DATE_FORMAT(tbl_calendario.data_ini, '%d-%c-%Y') AS data_ini,
        DATE_FORMAT(tbl_calendario.data_ter, '%d-%c-%Y') AS data_ter
    FROM
        tbl_calendario;

-- Procedure que verifica a duração de um semestre acadêmico
-- Exemplo: CALL pr_periodo_academico(2016, 2);

DROP PROCEDURE IF EXISTS pr_periodo_academico;
delimiter $$
CREATE PROCEDURE pr_periodo_academico(  IN ano_p    INT,
                                    IN semestre_p   INT)
BEGIN
DECLARE inicio  DATE;
DECLARE fim   DATE;
  SET inicio = (SELECT data_ini FROM tbl_calendario WHERE ano = ano_p AND semestre = semestre_p);
  SET fim = (SELECT data_ter FROM tbl_calendario WHERE ano = ano_p AND semestre = semestre_p);
  SELECT data_ini, data_ter FROM tbl_calendario WHERE data_ini = inicio AND data_ter = fim AND tipo = 'Acadêmico';
END$$
delimiter ;

-- Trigger que evita que uma data de término seja menor que uma data de início de um semestre em tbl_calendario
-- Exemplo: INSERT INTO tbl_calendario(ano, semestre, tipo, data_ini, data_ter) VALUES (2016, 2, "Acadêmico", '2016-08-01', '2015-12-15');
DROP TRIGGER IF EXISTS tr_ordem_datas_cal;
delimiter $$
CREATE TRIGGER tr_ordem_datas_cal
  BEFORE INSERT ON tbl_calendario
FOR EACH row
begin
  IF new.data_ter <= new.data_ini THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Data de termino precisa ser maior que a data de inicio.';
  end IF;
end$$
delimiter ;

-- ----------------------------------------------------------------------------
-- Turma
-- Criado por: Vitor Rocha (5A)

DROP TABLE IF EXISTS tbl_turma;
CREATE TABLE IF NOT EXISTS tbl_turma
  (
     codigoturma      VARCHAR(1) NOT NULL,
     codigodisciplina VARCHAR(20) NOT NULL,
     numerodevagas    INT(3),
     horario          VARCHAR(20),
     dia              VARCHAR(20),
     ano              INT(11) NOT NULL,
     semestre         INT(11) NOT NULL,
     CONSTRAINT turma_fk_calendario FOREIGN KEY (ano, semestre) REFERENCES tbl_calendario (ano, semestre),
     CONSTRAINT fk_turma_codigodisciplina FOREIGN KEY (codigodisciplina) REFERENCES tbl_disciplina (codigo),
     CONSTRAINT pk_turma PRIMARY KEY (codigodisciplina, codigoturma, semestre, ano)
  );

-- primeiro semestre 2016
INSERT INTO tbl_turma (semestre, ano, codigoTurma, codigoDisciplina, numeroDeVagas, horario, dia) VALUES
(1, 2016, 'A', '02.522-4', 25, '14:00', 'terca-feira'),
(1, 2016, 'B', '02.522-4', 25, '16:00', 'terca-feira'),
(1, 2016, 'C', '02.522-4', 25, '08:00', 'quarta-feira'),
(1, 2016, 'A', '02.521-6', 50, '14:00', 'quinta-feira'),
(1, 2016, 'A', '02.507-0', 25, '8:00', 'segunda-feira'),
(1, 2016, 'B', '02.507-0', 25, '8:00', 'quarta-feira'),
(1, 2016, 'C', '02.507-0', 25, '8:00', 'sexta-feira'),
(1, 2016, 'A', '02.502-0', 25, '8:00', 'sexta-feira'),
(1, 2016, 'A', '02.034-6', 25, '14:00', 'quarta-feira'),
(1, 2016, 'A', '08.910-9', 50, '8:00', 'segunda-feira'),
(1, 2016, 'B', '08.910-9', 50, '8:00', 'segunda-feira'),
(1, 2016, 'C', '08.910-9', 50, '8:00', 'segunda-feira'),
(1, 2016, 'D', '08.910-9', 50, '8:00', 'segunda-feira'),
(1, 2016, 'E', '08.910-9', 50, '8:00', 'segunda-feira'),
(1, 2016, 'F', '08.910-9', 50, '8:00', 'segunda-feira'),
(1, 2016, 'G', '08.910-9', 50, '8:00', 'segunda-feira'),
(1, 2016, 'H', '08.910-9', 50, '8:00', 'segunda-feira'),
(1, 2016, 'I', '08.910-9', 50, '8:00', 'segunda-feira'),
(1, 2016, 'J', '08.910-9', 50, '8:00', 'segunda-feira'),
(1, 2016, 'K', '08.910-9', 50, '8:00', 'segunda-feira'),
(1, 2016, 'L', '08.910-9', 50, '8:00', 'segunda-feira'),
(1, 2016, 'M', '08.910-9', 50, '8:00', 'segunda-feira'),
(1, 2016, 'N', '08.910-9', 50, '8:00', 'segunda-feira'),
(1, 2016, 'O', '08.910-9', 50, '8:00', 'segunda-feira'),
(1, 2016, 'Z', '08.910-9', 50, '8:00', 'segunda-feira'),
(1, 2016, 'A', '100.054-0', 30, 'Horário Livre', 'Horário Livre');

-- segundo semestre 2016
INSERT INTO tbl_turma (semestre, ano, codigoTurma, codigoDisciplina, numeroDeVagas, horario, dia) VALUES
(2, 2016, 'A', '08.910-9', 50, '8:00', 'sexta-feira'),
(2, 2016, 'B', '08.910-9', 50, '8:00', 'sexta-feira'),
(2, 2016, 'C', '08.910-9', 50, '8:00', 'sexta-feira'),
(2, 2016, 'D', '08.910-9', 50, '8:00', 'sexta-feira'),
(2, 2016, 'E', '08.910-9', 50, '8:00', 'sexta-feira'),
(2, 2016, 'F', '08.910-9', 50, '8:00', 'sexta-feira'),
(2, 2016, 'G', '08.910-9', 50, '8:00', 'sexta-feira'),
(2, 2016, 'H', '08.910-9', 50, '8:00', 'sexta-feira'),
(2, 2016, 'I', '08.910-9', 50, '8:00', 'sexta-feira'),
(2, 2016, 'J', '08.910-9', 50, '8:00', 'sexta-feira'),
(2, 2016, 'K', '08.910-9', 50, '8:00', 'sexta-feira'),
(2, 2016, 'L', '08.910-9', 50, '8:00', 'sexta-feira'),
(2, 2016, 'M', '08.910-9', 50, '8:00', 'sexta-feira'),
(2, 2016, 'N', '08.910-9', 50, '8:00', 'sexta-feira'),
(2, 2016, 'O', '08.910-9', 50, '8:00', 'sexta-feira'),
(2, 2016, 'Z', '08.910-9', 50, '8:00', 'sexta-feira'),
(2, 2016, 'A', '06.201-4', 30, '8:00', 'sexta-feira');

-- ----------------------------------------------------------------------------
-- Conselho
-- Criado por: Guilherme Lemos (4A)
-- Conselho(PK(DataInicioVigencia,DataFimVigencia), sigla, tipo) está na 3FN:
-- Está na 1FN: porque todos os atributos são atômicos, já que o atributo PeríodoVigencia foi separado em dataInicioVigencia e dataFimVigencia;
-- Está na 2FN: Não existe atributo não chave que é dependente de somente uma parte da chave primária;
-- Está na 3FN: porque não existem atributos não chave que sejam dependentes de outros atributos não chave.

DROP TABLE IF EXISTS tbl_conselho;
CREATE TABLE tbl_conselho
  (
     sigla              CHAR(8) NOT NULL,
     tipo               CHAR(20) NOT NULL,
     datainiciovigencia DATE NOT NULL,
     datafimvigencia    DATE NOT NULL,
     CONSTRAINT conselho_pk PRIMARY KEY (datainiciovigencia, datafimvigencia)
  );

INSERT INTO tbl_conselho (sigla, tipo, dataInicioVigencia, dataFimVigencia) VALUES
('CoG', 'Graduação', '1998-01-31', '2016-12-31'),
('CoPG', 'Pós-Graduação', '2008-01-01', '2016-12-31'),
('CoP', 'Pesquisa', '2012-07-01', '2016-12-31');


-- ----------------------------------------------------------------------------
-- Estágio
-- Criado por: Julio Batista Silva (5A)

DROP TABLE IF EXISTS tbl_estagio;
CREATE TABLE IF NOT EXISTS tbl_estagio
  (
     pais_atuacao       CHAR(3) NOT NULL DEFAULT 'BRA' comment 'ISO 3166-1 alfa-3',
     termo_compromisso  MEDIUMTEXT NOT NULL,
     carta_avaliacao    MEDIUMTEXT NOT NULL,
     supervisor_empresa VARCHAR(128) NOT NULL,
     empresa            VARCHAR(128) NOT NULL,
     obrigatorio        TINYINT(1) NOT NULL,
     data_termino       DATE NOT NULL,
     data_inicio        DATE NOT NULL,
     estudante_ra       INT(6) NOT NULL,
     supervisor_id      VARCHAR(15) NOT NULL,
     CONSTRAINT pk_estagio PRIMARY KEY (data_inicio, estudante_ra),
     CONSTRAINT estagio_fk_estudante FOREIGN KEY (estudante_ra) REFERENCES tbl_estudante (ra),
     CONSTRAINT estagio_fk_supervisor FOREIGN KEY (supervisor_id) REFERENCES tbl_docente (pessoa)
  );


-- View que mostra quantos estágios foram feitos em cada país
DROP VIEW IF EXISTS v_estagio_paises;
CREATE OR REPLACE view v_estagio_paises
AS
  SELECT pais_atuacao AS pais_atuacao,
         Count(*)     AS qtd_estagios
  FROM   tbl_estagio
  GROUP  BY pais_atuacao;


-- View que mostra quantos estudantes estão atualmente empregados em cada empresa
DROP VIEW IF EXISTS v_estagio_empresas;
CREATE OR REPLACE view v_estagio_empresas
AS
  SELECT empresa  AS empresa,
         Count(*) AS qtd_estudantes
  FROM   tbl_estagio
  WHERE  data_termino >= Curdate()
  GROUP  BY empresa;


-- View que mostra onde e quando cada aluno (exibido por nome) fez o estágio obrigatório
DROP VIEW IF EXISTS v_estagio_obrigatorio;
CREATE OR REPLACE view v_estagio_obrigatorio
AS
  SELECT p.prenome      AS prenome,
         p.sobrenome    AS sobrenome,
         e.empresa      AS empresa,
         e.data_inicio  AS inicio,
         e.data_termino AS termino
  FROM   tbl_estagio AS e,
         tbl_estudante AS a,
         tbl_pessoa AS p
  WHERE  e.obrigatorio = 1
         AND e.estudante_ra = a.ra
         AND a.pessoa_id = p.pessoa_id;


-- View equivalente à tbl_estágio usando nomes em vez de RA e CPF
DROP VIEW IF EXISTS v_estagio_nomes;
CREATE OR REPLACE view v_estagio_nomes
AS
  SELECT pa.prenome     AS estudante_prenome,
         pa.sobrenome   AS estudante_sobrenome,
         pd.prenome     AS docente_prenome,
         pd.sobrenome   AS docente_sobrenome,
         e.empresa      AS empresa,
         e.pais_atuacao AS pais,
         e.obrigatorio  AS obrigatorio,
         e.data_inicio  AS inicio,
         e.data_termino AS termino
  FROM   tbl_estagio AS e
         JOIN tbl_estudante AS a
           ON a.ra = e.estudante_ra
         JOIN tbl_pessoa AS pa
           ON pa.pessoa_id = a.pessoa_id
         JOIN tbl_docente AS d
           ON d.pessoa = e.supervisor_id
         JOIN tbl_pessoa AS pd
           ON pd.pessoa_id = d.pessoa;


-- View com alunos que ainda não fizeram o estágio obrigatório
DROP VIEW IF EXISTS v_estagio_pendente;
CREATE OR replace VIEW v_estagio_pendente
AS
  SELECT a.ra        AS ra,
         p.prenome   AS prenome,
         p.sobrenome AS sobrenome
  FROM   tbl_estudante AS a
         inner join tbl_pessoa AS p
                 ON p.pessoa_id = a.pessoa_id
  WHERE  NOT EXISTS (SELECT *
                     FROM   tbl_estagio AS e
                     WHERE  e.estudante_ra = a.ra);


-- Procedure que modifica o nome de uma empresa.
-- Exemplo: call pr_rename_empresa('Embraer', 'Embraer S.A.');
DROP PROCEDURE IF EXISTS pr_rename_empresa;
delimiter $$
CREATE PROCEDURE pr_rename_empresa(IN p_nome_antigo VARCHAR(128),
                                   IN p_nome_novo   VARCHAR(128))
begin
  UPDATE tbl_estagio
  SET    empresa = p_nome_novo
  WHERE  empresa = p_nome_antigo;
end$$
delimiter ;


-- Função que retorna o nome de um aluno, dado seu RA
-- Criado por: Julio
-- Exemplo:
--     SELECT fn_prenome_from_ra(e.estudante_ra),
--            e.empresa
--     FROM   tbl_estagio AS e;
DROP function IF EXISTS fn_prenome_from_ra;
delimiter $$
CREATE function fn_prenome_from_ra(p_ra INT)
returns VARCHAR(50)
begin
  DECLARE nome VARCHAR(50);

  SELECT p.prenome
  INTO   nome
  FROM   tbl_pessoa AS p
         JOIN tbl_estudante AS a
           ON p.pessoa_id = a.pessoa_id
  WHERE  a.ra = p_ra;

  RETURN nome;
end$$
delimiter ;


-- Função que retorna o CPF de um aluno, dado seu RA
-- Exemplo: select fn_id_from_ra(654321);
DROP function IF EXISTS fn_id_from_ra;
delimiter $$
CREATE function fn_id_from_ra(p_ra INT)
returns VARCHAR(15)
begin
  DECLARE id VARCHAR(15);

  SELECT p.pessoa_id
  INTO   id
  FROM   tbl_pessoa AS p
         JOIN tbl_estudante AS a
           ON p.pessoa_id = a.pessoa_id
  WHERE  a.ra = p_ra;

  RETURN id;
end$$
delimiter ;


-- Trigger que evita que um aluno seja seu próprio orientador
-- Poderia acontecer no raro caso de um estudante também ser docente.
-- Exemplo: INSERT INTO tbl_estagio VALUES ('BRA', 'compromisso', 'carta', 'Mike', 'Facebook', '1', '2015-12-31', '2015-07-01', '654321', '91994871601');
DROP TRIGGER IF EXISTS tri_se_orienta_bi;
delimiter $$
CREATE TRIGGER tri_se_orienta_bi
  BEFORE INSERT ON tbl_estagio
FOR EACH row
begin
  IF new.supervisor_id = Fn_id_from_ra(new.estudante_ra) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Estudante não pode ser o seu próprio orientador.';
  end IF;
end$$
delimiter ;


INSERT INTO tbl_estagio (pais_atuacao, termo_compromisso, carta_avaliacao, supervisor_empresa, empresa, obrigatorio, data_termino, data_inicio, estudante_ra, supervisor_id) VALUES
('BRA', 'Texto do termo de compromisso do Facebook', 'Carta de avaliação do 112358', 'Mike Schroepfer', 'Facebook', '1', '2015-12-31', '2015-07-01', '112358', '11104385910'),
('USA', 'Texto do termo de compromisso da Google', 'Carta de avaliação do 112358', 'Larry Page', 'Google',          '0', '2016-06-30', '2016-01-01', '112358', '40078919665'),
('BRA', 'Texto do termo de compromisso da Oracle', 'Carta de avaliação do 123456', 'Larry Ellison', 'Oracle',       '1', '2013-06-30', '2013-01-01', '123456', '24174616256'),
('FIN', 'Texto do termo de compromisso da Nokia', 'Carta de avaliação do 123456', 'Rich Green', 'Nokia',            '0', '2014-12-31', '2014-07-01', '123456', '24174616256'),
('USA', 'Texto do termo de compromisso da IBM', 'Carta de avaliação do 123456', 'Mark Dean', 'IBM',                 '0', '2015-03-31', '2015-01-01', '123456', '11104385910'),
('KOR', 'Texto do termo de compromisso da Samsung', 'Carta de avaliação do 123456', 'Omar Khan', 'Samsung',         '0', '2016-06-30', '2016-01-01', '123456', '24174616256'),
('BRA', 'Texto do termo de compromisso da EMBRAER', 'Carta de avaliação do 334578', 'Mauro Kern', 'Embraer',        '1', '2016-12-30', '2016-01-01', '334578', '24174616256'),
('SWE', 'Texto do termo de compromisso da Ericsson', 'Carta de avaliação do 654321', 'Håkan Eriksson', 'Ericsson',  '0', '2014-12-31', '2014-07-01', '654321', '72003800670'),
('BRA', 'Texto do termo de compromisso da Microsoft', 'Carta de avaliação do 654321', 'Dave Campbell', 'Microsoft', '0', '2015-12-31', '2015-07-01', '654321', '72003800670'),
('BRA', 'Texto do termo de compromisso da EMBRAER', 'Carta de avaliação do 654321', 'Mauro Kern', 'Embraer',        '1', '2016-12-30', '2016-01-01', '654321', '24174616256');


-- ----------------------------------------------------------------------------
-- Curso
-- Criado por: Eduardo Marinho (5A)

DROP TABLE IF EXISTS  tbl_curso;
CREATE TABLE IF NOT EXISTS tbl_curso (
    sigla VARCHAR(10) NOT NULL,
    nome VARCHAR(30) NOT NULL,
    duracaomedia INT NOT NULL,
    duracaomaxima INT NOT NULL,
    PPPaprovado LONGTEXT NOT NULL,
    centro VARCHAR(10) NOT NULL,
    creditosNecessarios INT NOT NULL,
    creditosComplementares INT NOT NULL,
    creditosObrigatorios INT NOT NULL,
    creditosOptativos INT NOT NULL,
    PRIMARY KEY (sigla)
);


INSERT INTO tbl_curso (sigla, nome, duracaomedia, duracaomaxima, PPPaprovado, centro, creditosNecessarios, creditosComplementares, creditosObrigatorios, creditosOptativos) VALUES
("ENC", "Engenharia de Computação", 5, 9, "Texto do PPP", "CCET", 272, 0, 260, 12),
("BCC", "Ciência da Computação", 5, 9, "Texto do PPP", "CCET", 212, 4, 154, 54),
("EP", "Engenharia de Produção", 5, 9, "Texto do PPP", "CCET", 262, 0, 250, 12),
("EC", "Engenharia Civil", 5, 9, "Texto do PPP", "CCET", 270, 0, 258, 12),
("EQ", "Engenharia Química", 5, 9, "Texto do PPP", "CCET", 274, 0, 262, 12);


-- ----------------------------------------------------------------------------
-- Matricula
-- Criado por: Pedro Padoveze (5A)

DROP TABLE IF EXISTS  tbl_matricula;
CREATE TABLE IF NOT EXISTS tbl_matricula (
    ira INT(5),
    creditos_obrigatorios INT(3),
    creditos_optativos INT(3),
    creditos_complementares INT(3),
    perfil INT(2),
    ano_ingresso INT(4),
    ra INT(6) NOT NULL,
    sigla VARCHAR(10) NOT NULL,
    FOREIGN KEY (ra)
        REFERENCES tbl_estudante (ra),
    FOREIGN KEY (sigla)
        REFERENCES tbl_curso (sigla),
    PRIMARY KEY (ra , sigla)
);

INSERT INTO tbl_matricula (sigla, ra, ira, creditos_obrigatorios, creditos_optativos, creditos_complementares, perfil, ano_ingresso) VALUES
("BCC", 524896, 12854, 100, 20, 4, 7, 2013),
("EnC", 425169, 9856, 140, 20, 4, 11, 2011),
("EnC", 334578, 7569, 155, 16, 4, 13, 2010),
("EQ", 654321, 20000, 0, 0, 0, 1, 2016),
("EP", 112358, 12985, 125, 12, 4, 9, 2012);

-- FUNCTION
--
-- Feito por: Pedro Barbosa (407895)
--
-- Retorna o número (INT) de alunos que ingressaram em um determinado ano (parâmetro)

DROP FUNCTION IF EXISTS fn_numero_alunos_ano;
delimiter $$
CREATE FUNCTION fn_numero_alunos_ano(ano INT(4))
returns INT
BEGIN
	DECLARE aux INT;

	SELECT COUNT(*)
	INTO aux
	FROM tbl_matricula
	WHERE ano_ingresso = ano;

	RETURN aux;
END$$
delimiter ;

-- FUNCTION
--
-- Feito por: Pedro Barbosa (407895)
--
-- Retorna o RA mais recente (maior numéricamente)

DROP FUNCTION IF EXISTS fn_ultimo_ra;
delimiter $$
CREATE FUNCTION fn_ultimo_ra()
returns INT(6)
BEGIN
	DECLARE aux INT(6);

	SELECT MAX(ra)
	INTO aux
	FROM tbl_estudante;

	RETURN aux;
END$$
delimiter ;

-- PROCEDURE
--
-- Feito por: Pedro Barbosa (407895)
--
-- 	Faz a matrícula (ou rematrícula) de um aluno em um curso
-- utilizando os seguintes parâmetros:
--	-> ID
--	-> Sigla do Curso

DROP PROCEDURE IF EXISTS pr_fazer_matricula;
delimiter $$
CREATE PROCEDURE pr_fazer_matricula(id VARCHAR(15), sigla VARCHAR(10))
BEGIN
	DECLARE ra INT;

	SELECT MAX(tbl_estudante.ra)
	INTO ra
	FROM tbl_pessoa, tbl_estudante
	WHERE tbl_pessoa.pessoa_id = id
		AND tbl_pessoa.pessoa_id = tbl_estudante.pessoa_id;

	IF ISNULL(ra) THEN
		SET ra = fn_ultimo_ra()+1;
		INSERT INTO tbl_estudante (pessoa_id, ra) VALUES
		(id, ra);
	END IF;

	INSERT INTO tbl_matricula (sigla, ra, ira, creditos_obrigatorios, creditos_optativos, creditos_complementares, perfil, ano_ingresso) VALUES
	(sigla, ra, 20000, 0, 0, 0, 1, YEAR(CURDATE()));
END$$
delimiter ;

-- Procedure com CURSOR
--
-- Feito por: Pedro Barbosa (407895)
--
--	 A partir do RA, contabiliza e atualiza os creditos obrigatórios e optativos
-- completados pelo aluno em tbl_matricula.

DROP PROCEDURE IF EXISTS pr_atualizar_creditos;
delimiter $$
CREATE PROCEDURE pr_atualizar_creditos(ra VARCHAR(6))
BEGIN

	DECLARE obrigatorios INT DEFAULT 0;
	DECLARE optativos INT DEFAULT 0;
	DECLARE complementares INT DEFAULT 0;
	DECLARE acumulador INT;
	DECLARE codigo VARCHAR(20);

	DECLARE done INT DEFAULT FALSE;

	DECLARE cursor1 CURSOR FOR
		SELECT DISTINCT tbl_inscricao.codigoDisciplina, creditospraticos + creditosteoricos AS creditos
		FROM tbl_inscricao, tbl_disciplina, tbl_grade, tbl_matricula
		WHERE tbl_inscricao.ra = ra
		AND tbl_inscricao.codigoDisciplina = tbl_disciplina.codigo
		AND tbl_disciplina.codigo = tbl_grade.codigo
		AND tbl_inscricao.resultado = 'Aprovado'
		AND tbl_matricula.ra = ra
		AND tbl_matricula.sigla = tbl_grade.sigla
		AND tbl_grade.tipo = 'obrigatoria';

	DECLARE cursor2 CURSOR FOR
		SELECT DISTINCT tbl_inscricao.codigoDisciplina, creditospraticos + creditosteoricos AS creditos
		FROM tbl_inscricao, tbl_disciplina, tbl_grade, tbl_matricula
		WHERE tbl_inscricao.ra = ra
		AND tbl_inscricao.codigoDisciplina = tbl_disciplina.codigo
		AND tbl_disciplina.codigo = tbl_grade.codigo
		AND tbl_inscricao.resultado = 'Aprovado'
		AND tbl_matricula.ra = ra
		AND tbl_matricula.sigla = tbl_grade.sigla
		AND tbl_grade.tipo = 'optativa';

	DECLARE cursor3 CURSOR FOR
		SELECT id, carga_horaria
		FROM tbl_atividade_complementar
		WHERE ra_ativ = ra;

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

	-- CRÉDITOS OBRIGATÓRIOS

	OPEN cursor1;

	loopLoko: LOOP
		FETCH cursor1 INTO codigo, acumulador;
		IF done THEN
			LEAVE loopLoko;
		END IF;
		SET obrigatorios = obrigatorios + acumulador;

	END LOOP loopLoko;

	UPDATE tbl_matricula
    		SET tbl_matricula.creditos_obrigatorios = obrigatorios
   		WHERE tbl_matricula.ra = ra;

	CLOSE cursor1;

	-- CRÉDITOS OPTATIVOS

	SET done = FALSE;

	OPEN cursor2;

	loopLoko2: LOOP
		FETCH cursor2 INTO codigo, acumulador;
		IF done THEN
			LEAVE loopLoko2;
		END IF;
		SET optativos = optativos + acumulador;

	END LOOP loopLoko2;

	UPDATE tbl_matricula
    		SET tbl_matricula.creditos_optativos = optativos
   		WHERE tbl_matricula.ra = ra;

	CLOSE cursor2;

	-- CRÉDITOS COMPLEMENTARES

	SET done = FALSE;

	OPEN cursor3;

	loopLoko3: LOOP
		FETCH cursor3 INTO codigo, acumulador;
		IF done THEN
			LEAVE loopLoko3;
		END IF;
		SET complementares = complementares + acumulador/15;

	END LOOP loopLoko3;

	UPDATE tbl_matricula
    		SET tbl_matricula.creditos_complementares = complementares
   		WHERE tbl_matricula.ra = ra;

	CLOSE cursor3;

END$$
delimiter ;

-- ----------------------------------------------------------------------------
-- Pré-Requisito
-- Criado por: Vitor Rocha (5A)

DROP TABLE IF EXISTS tbl_pre_requisito;
CREATE TABLE IF NOT EXISTS tbl_pre_requisito (
    disciplina VARCHAR(20) NOT NULL,
    preRequisito VARCHAR(20) NOT NULL,
    CONSTRAINT fk_prereq1 FOREIGN KEY (disciplina)
        REFERENCES tbl_disciplina (codigo),
    CONSTRAINT fk_prereq2 FOREIGN KEY (preRequisito)
        REFERENCES tbl_disciplina (codigo),
    CONSTRAINT pk_prereq PRIMARY KEY (disciplina , preRequisito)
);

INSERT INTO tbl_pre_requisito (disciplina, preRequisito) VALUES
('02.522-4', '02.521-6'),
('02.502-0', '02.507-0');


-- ----------------------------------------------------------------------------
-- Grade
-- Criado por: Eduardo Marinho (5A)

DROP TABLE IF EXISTS tbl_grade;
CREATE TABLE tbl_grade (
    perfil INT NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    sigla VARCHAR(10) NOT NULL,
    codigo VARCHAR(20) NOT NULL,
    FOREIGN KEY (sigla)
        REFERENCES tbl_curso (sigla),
    FOREIGN KEY (codigo)
        REFERENCES tbl_disciplina (codigo),
    PRIMARY KEY (sigla , codigo)
);

INSERT INTO tbl_grade (codigo, sigla, perfil, tipo) VALUES
('02.522-4', 'ENC', 7, 'obrigatoria'),
('02.521-6', 'ENC', 6, 'obrigatoria'),
('02.507-0', 'ENC', 1, 'obrigatoria'),
('02.502-0', 'ENC', 2, 'obrigatoria'),
('08.910-9', 'ENC', 1, 'obrigatoria'),
('02.034-6', 'ENC', 4, 'optativa'),
('06.201-4', 'ENC', 4, 'optativa');

INSERT INTO tbl_grade (codigo, sigla, perfil, tipo) VALUES
('02.522-4', 'BCC', 7, 'obrigatoria'),
('02.521-6', 'BCC', 6, 'obrigatoria'),
('02.507-0', 'BCC', 1, 'obrigatoria'),
('02.502-0', 'BCC', 2, 'obrigatoria'),
('08.910-9', 'BCC', 1, 'obrigatoria'),
('02.034-6', 'BCC', 4, 'obrigatoria'),
('06.201-4', 'BCC', 4, 'optativa');

INSERT INTO tbl_grade (codigo, sigla, perfil, tipo) VALUES
('08.910-9', 'EP', 1, 'obrigatoria'),
('06.201-4', 'EP', 4, 'optativa'),
('08.910-9', 'EC', 1, 'obrigatoria'),
('06.201-4', 'EC', 4, 'optativa'),
('08.910-9', 'EQ', 1, 'obrigatoria'),
('06.201-4', 'EQ', 4, 'optativa');

-- ------------------------------------------------------------------
-- View que exibe quantos créditos há em cada perfil de cada curso
-- Criado por: Vitor Rocha e Pedro Barbosa

CREATE VIEW vcreditosporperfil
AS
  SELECT tbl_curso.nome                           AS nome_curso,
         perfil,
         Sum(creditosteoricos + creditospraticos) AS creditos
  FROM   tbl_curso,
         tbl_grade,
         tbl_disciplina
  WHERE  tbl_curso.sigla = tbl_grade.sigla
         AND tbl_grade.codigo = tbl_disciplina.codigo
  GROUP  BY nome_curso,
            perfil;

-- ----------------------------------------------------------------------------
-- Prédio
-- Criado por: Grupo 6A

DROP TABLE IF EXISTS tbl_predio;
CREATE TABLE IF NOT EXISTS tbl_predio (
    sigla VARCHAR(5) NOT NULL,
    descricao VARCHAR(50),
    imagem VARCHAR(120),
    localizacao_geografica VARCHAR(80),
    mapa_localizacao VARCHAR(80),
    primeira_sala INT(3) NOT NULL,
    ultima_sala INT(3) NOT NULL,
    CONSTRAINT pk_predio PRIMARY KEY (sigla)
);

INSERT INTO tbl_predio
VALUES ('AT-1','', 'http://www2.ufscar.br/servicos/img_ru.jpg', '','',3,17);
INSERT INTO tbl_predio
VALUES ('AT-2','', 'http://www2.ufscar.br/uploads/44445_portal_sao_carlos_norte_atual_3609123126331919332.jpg', '','',26,44);
INSERT INTO tbl_predio
VALUES ('AT-4','', 'http://www2.ufscar.br/vidaacademica/img_cienciaexata.jpg', '','',67,91);
INSERT INTO tbl_predio
VALUES ('AT-5','', '', '','',96,116);
INSERT INTO tbl_predio
VALUES ('AT-7','', 'http://www2.ufscar.br/vidaacademica/img_cienciaexata.jpg', '','',160,176);

-- views_tbl_predio
DROP VIEW IF EXISTS ats_intervalosala;
CREATE VIEW ats_intervalosala AS
SELECT sigla, primeira_sala, ultima_sala FROM tbl_predio;


-- ----------------------------------------------------------------------------
-- Sala
-- Criado por: Grupo 6A

DROP TABLE IF EXISTS tbl_sala;
CREATE TABLE IF NOT EXISTS tbl_sala (
    numero INT NOT NULL,
    predio VARCHAR(5) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    recursos VARCHAR(100) NOT NULL,
    caracteristicas VARCHAR(100) NOT NULL,
    capacidade_de_alunos INT NOT NULL,
    CONSTRAINT pk_sala PRIMARY KEY (numero , predio),
    CONSTRAINT sala_fk_predio FOREIGN KEY (predio)
        REFERENCES tbl_predio (sigla)
);


DROP view IF EXISTS v_salas_com_grande_capacidade;
CREATE VIEW view_salas_com_grande_capacidade AS
SELECT *
FROM tbl_sala
WHERE capacidade_de_alunos >= 50;


DROP view IF EXISTS view_salas_com_media_capacidade;
CREATE VIEW view_salas_com_media_capacidade AS
SELECT *
FROM tbl_sala
WHERE capacidade_de_alunos > 30 AND capacidade_de_alunos < 50;


DROP view IF EXISTS view_salas_com_pequena_capacidade;
CREATE VIEW view_salas_com_pequena_capacidade AS
SELECT *
FROM tbl_sala
WHERE capacidade_de_alunos <= 30;


INSERT INTO tbl_sala (numero,predio,tipo,recursos,caracteristicas,capacidade_de_alunos) VALUES
(11,"AT-1","aula teorica","55 carteiras. 1 projetor.","sala grande e com ar condicionado",55),
(12,"AT-1","aula teorica","55 carteiras. 1 projetor.","sala grande e com ar condicionado",55),
(13,"AT-1","aula teorica","55 carteiras. 1 projetor.","sala grande e com ar condicionado",55),
(14,"AT-1","aula teorica","55 carteiras. 1 projetor.","sala grande e com ar condicionado",55),
(15,"AT-1","aula teorica","55 carteiras. 1 projetor.","sala grande e com ar condicionado",55),
(16,"AT-1","aula teorica","55 carteiras. 1 projetor.","sala grande e com ar condicionado",55),
(17,"AT-1","aula teorica","55 carteiras. 1 projetor.","sala grande e com ar condicionado",55),
(31,"AT-2","aula teorica","60 carteiras.","sala grande",60),
(32,"AT-2","aula teorica","60 carteiras.","sala grande",60),
(33,"AT-2","aula teorica","60 carteiras.","sala grande",60),
(75,"AT-4","aula teorica","70 carteiras.","sala grande e com ventilador",70),
(72,"AT-4","aula teorica","30 carteiras.","sala grande com projetor",30),
(71,"AT-4","aula teorica","35 carteiras.","sala grande com projetor",35),
(160,"AT-7","aula teorica","70 carteiras.","sala grande e com ventilador",70),
(161,"AT-7","aula teorica","70 carteiras.","sala grande e com ventilador",70),
(162,"AT-7","aula teorica","70 carteiras.","sala grande e com ventilador",70),
(163,"AT-7","aula teorica","70 carteiras.","sala grande e com ventilador",70),
(164,"AT-7","aula teorica","70 carteiras.","sala grande e com ventilador",70),
(165,"AT-7","aula teorica","70 carteiras.","sala grande e com ventilador",70),
(166,"AT-7","aula teorica","70 carteiras.","sala grande e com ventilador",70),
(171,"AT-7","aula teorica","40 carteiras.","sala grande e com ventilador",40),
(172,"AT-7","aula teorica","40 carteiras.","sala grande e com ventilador",40),
(173,"AT-7","aula teorica","40 carteiras.","sala grande e com ventilador",40);

-- ----------------------------------------------------------------------------
-- Alocação
-- Criado por: Grupo 5A

DROP TABLE IF EXISTS tbl_alocacao;
CREATE TABLE IF NOT EXISTS tbl_alocacao (
    semestre INT(11) NOT NULL,
    ano INT(11) NOT NULL,
    codigoTurma VARCHAR(1) NOT NULL,
    codigoDisciplina VARCHAR(20) NOT NULL,
    numeroSala INT NOT NULL,
    siglaPredio VARCHAR(5) NOT NULL,
    CONSTRAINT alocacao_fk_turma FOREIGN KEY (codigoDisciplina , codigoTurma , semestre , ano)
        REFERENCES tbl_turma (codigoDisciplina , codigoTurma , semestre , ano),
    CONSTRAINT alocacao_fk_sala FOREIGN KEY (numeroSala , siglaPredio)
        REFERENCES tbl_sala (numero , predio),
    PRIMARY KEY (semestre , ano , codigoTurma , codigoDisciplina , numeroSala , siglaPredio)
);

-- Procedure
--
-- Feito por: Pedro Barbosa (407895)
--
--	 Aloca uma sala qualquer para uma turma de uma disciplina.
-- Tem como entrada os seguintes argumentos:
-- 	* Código da Turma
--	* Código da Disciplina
--	* Ano
--	* Semestre

DROP PROCEDURE IF EXISTS pr_alocar_sala;
delimiter $$
CREATE PROCEDURE pr_alocar_sala(cod_turma VARCHAR(1), cod_disciplina VARCHAR(20), d_ano INT, d_semestre INT)
BEGIN
	DECLARE num INT;
	DECLARE prd VARCHAR(5);

	DECLARE aux CURSOR FOR
		SELECT numero, predio
		FROM tbl_sala, tbl_turma
		WHERE tbl_turma.codigoturma = cod_turma
		AND tbl_turma.codigodisciplina = cod_disciplina
		AND tbl_sala.capacidade_de_alunos >= tbl_turma.numerodevagas
		AND (numero + predio) NOT IN(
		-- IGNORA AS SALAS INVÁLIDAS
			SELECT (tbl_alocacao.numeroSala + tbl_alocacao.siglaPredio)
			FROM tbl_turma turma, tbl_turma outras, tbl_alocacao, tbl_sala
			-- Seleciona a turma a qual a reserva será feita
			WHERE turma.codigoturma = cod_turma
			AND turma.codigodisciplina = cod_disciplina
			AND turma.ano = d_ano
			AND turma.semestre = d_semestre
			-- Seleciona as outras turmas no mesmo horario
			AND outras.ano = d_ano
			AND outras.semestre = d_semestre
			AND outras.dia = turma.dia
			AND outras.horario = turma.horario
			-- Seleciona as salas das outras turmas
			AND tbl_alocacao.ano = d_ano
			AND tbl_alocacao.semestre = d_semestre
			AND tbl_alocacao.codigoTurma = outras.codigoturma
			AND tbl_alocacao.codigoDisciplina = outras.codigodisciplina);

	OPEN aux;
	FETCH aux INTO num, prd;
	CLOSE aux;

	INSERT INTO tbl_alocacao(semestre, ano, codigoTurma, codigoDisciplina, numeroSala, siglaPredio) VALUES
	(d_semestre, d_ano, cod_turma, cod_disciplina, num, prd);

END$$
delimiter ;

-- ----------------------------------------------------------------------------
-- População da tabela Alocação

CALL pr_alocar_sala('A', '02.522-4', 2016, 1);
CALL pr_alocar_sala('B', '02.522-4', 2016, 1);
CALL pr_alocar_sala('C', '02.522-4', 2016, 1);
CALL pr_alocar_sala('A', '02.521-6', 2016, 1);
CALL pr_alocar_sala('B', '02.507-0', 2016, 1);
CALL pr_alocar_sala('C', '02.507-0', 2016, 1);
CALL pr_alocar_sala('A', '02.502-0', 2016, 1);
CALL pr_alocar_sala('A', '02.034-6', 2016, 1);
CALL pr_alocar_sala('A', '02.507-0', 2016, 1);
CALL pr_alocar_sala('A', '08.910-9', 2016, 1);
CALL pr_alocar_sala('B', '08.910-9', 2016, 1);
CALL pr_alocar_sala('C', '08.910-9', 2016, 1);
CALL pr_alocar_sala('D', '08.910-9', 2016, 1);
CALL pr_alocar_sala('E', '08.910-9', 2016, 1);
CALL pr_alocar_sala('F', '08.910-9', 2016, 1);
CALL pr_alocar_sala('G', '08.910-9', 2016, 1);
CALL pr_alocar_sala('H', '08.910-9', 2016, 1);
CALL pr_alocar_sala('I', '08.910-9', 2016, 1);
CALL pr_alocar_sala('J', '08.910-9', 2016, 1);
CALL pr_alocar_sala('K', '08.910-9', 2016, 1);
CALL pr_alocar_sala('L', '08.910-9', 2016, 1);
CALL pr_alocar_sala('M', '08.910-9', 2016, 1);
CALL pr_alocar_sala('N', '08.910-9', 2016, 1);
CALL pr_alocar_sala('O', '08.910-9', 2016, 1);
CALL pr_alocar_sala('Z', '08.910-9', 2016, 1);

CALL pr_alocar_sala('A', '08.910-9', 2016, 2);
CALL pr_alocar_sala('B', '08.910-9', 2016, 2);
CALL pr_alocar_sala('C', '08.910-9', 2016, 2);
CALL pr_alocar_sala('D', '08.910-9', 2016, 2);
CALL pr_alocar_sala('E', '08.910-9', 2016, 2);
CALL pr_alocar_sala('F', '08.910-9', 2016, 2);
CALL pr_alocar_sala('G', '08.910-9', 2016, 2);
CALL pr_alocar_sala('H', '08.910-9', 2016, 2);
CALL pr_alocar_sala('I', '08.910-9', 2016, 2);
CALL pr_alocar_sala('J', '08.910-9', 2016, 2);
CALL pr_alocar_sala('K', '08.910-9', 2016, 2);
CALL pr_alocar_sala('L', '08.910-9', 2016, 2);
CALL pr_alocar_sala('M', '08.910-9', 2016, 2);
CALL pr_alocar_sala('N', '08.910-9', 2016, 2);
CALL pr_alocar_sala('O', '08.910-9', 2016, 2);
CALL pr_alocar_sala('Z', '08.910-9', 2016, 2);
CALL pr_alocar_sala('A', '06.201-4', 2016, 2);

-- ----------------------------------------------------------------------------
-- Inscrição
-- Criado por: Grupo 5A

DROP TABLE IF EXISTS tbl_inscricao;
CREATE TABLE IF NOT EXISTS tbl_Inscricao (
    ra INT(6) NOT NULL,
    semestreTurma INT(1) NOT NULL,
    anoTurma INT(4) NOT NULL,
    codigoTurma VARCHAR(1) NOT NULL,
    codigoDisciplina VARCHAR(20) NOT NULL,
    media FLOAT,
    frequencia INT(3),
    resultado VARCHAR(20),
    prioridadeDeInscricao INT,
    statusDeSolicitacao VARCHAR(20),
    CONSTRAINT inscricao_fk_estudante FOREIGN KEY (ra)
        REFERENCES tbl_estudante (ra),
    CONSTRAINT inscricao_fk_turma FOREIGN KEY (codigoDisciplina , codigoTurma , semestreTurma , anoTurma)
        REFERENCES tbl_turma (codigoDisciplina , codigoTurma , semestre , ano),
    CONSTRAINT inscricao_pk PRIMARY KEY (ra , semestreTurma , anoTurma , codigoTurma , codigoDisciplina)
);

-- TRIGGERS
--
-- Feito por: Pedro Barbosa (407895)
--
--	Automáticamente atualiza os créditos completados do aluno
-- assim que houver qualquer mudança na tabela tbl_inscricao

DROP TRIGGER IF EXISTS tr_inscricao_insert;
delimiter $$
CREATE TRIGGER tr_inscricao_insert
  AFTER INSERT ON tbl_inscricao
FOR EACH row
BEGIN
	CALL pr_atualizar_creditos(new.ra);
END$$
delimiter ;

DROP TRIGGER IF EXISTS tr_inscricao_update;
delimiter $$
CREATE TRIGGER tr_inscricao_update
  AFTER UPDATE ON tbl_inscricao
FOR EACH row
BEGIN
	CALL pr_atualizar_creditos(new.ra);
END$$
delimiter ;


DROP TRIGGER IF EXISTS tr_inscricao_delete;
delimiter $$
CREATE TRIGGER tr_inscricao_delete
  AFTER DELETE ON tbl_inscricao
FOR EACH row
BEGIN
	CALL pr_atualizar_creditos(old.ra);
END$$
delimiter ;

-- INSERTS
-- primeiro semestre 2016
INSERT INTO tbl_inscricao (ra, semestreTurma, anoTurma, codigoTurma, codigoDisciplina, media, frequencia, resultado) VALUES
(524896, 1, 2016, 'A', '02.522-4', 10.0, 100, "Aprovado"),
(524896, 1, 2016, 'A', '02.502-0', 8.5, 90, "Aprovado"),
(524896, 1, 2016, 'A', '02.034-6', 7.2, 95, "Aprovado"),
(524896, 1, 2016, 'C', '08.910-9', 2.1, 100, "Reprovado");

INSERT INTO tbl_inscricao (ra, semestreTurma, anoTurma, codigoTurma, codigoDisciplina, media, frequencia, resultado) VALUES
(425169, 1, 2016, 'A', '02.522-4', 10.0, 95, "Aprovado"),
(425169, 1, 2016, 'A', '02.502-0', 8.2, 90, "Aprovado"),
(425169, 1, 2016, 'C', '08.910-9', 0.7, 78, "Reprovado");

INSERT INTO tbl_inscricao (ra, semestreTurma, anoTurma, codigoTurma, codigoDisciplina, media, frequencia, resultado) VALUES
(334578, 1, 2016, 'A', '02.522-4', 10.0, 75, "Aprovado"),
(334578, 1, 2016, 'A', '02.502-0', 6.0, 75, "Aprovado"),
(334578, 1, 2016, 'C', '08.910-9', 0.0, 10, "Reprovado");

INSERT INTO tbl_inscricao (ra, semestreTurma, anoTurma, codigoTurma, codigoDisciplina, media, frequencia, resultado) VALUES
(654321, 1, 2016, 'A', '08.910-9', 1.2, 100, "Reprovado"),
(112358, 1, 2016, 'B', '08.910-9', 1.9, 80, "Reprovado");

-- segundo semestre 2016
INSERT INTO tbl_inscricao (ra, semestreTurma, anoTurma, codigoTurma, codigoDisciplina, media, frequencia, resultado) VALUES
(524896, 2, 2016, 'A', '06.201-4', 9.3, 90, "Aprovado"),
(524896, 2, 2016, 'D', '08.910-9', 1.9, 100, "Reprovado");

INSERT INTO tbl_inscricao (ra, semestreTurma, anoTurma, codigoTurma, codigoDisciplina, media, frequencia, resultado) VALUES
(425169, 2, 2016, 'A', '06.201-4', 8.9, 75, "Aprovado"),
(425169, 2, 2016, 'D', '08.910-9', 0.5, 95, "Reprovado");

INSERT INTO tbl_inscricao (ra, semestreTurma, anoTurma, codigoTurma, codigoDisciplina, media, frequencia, resultado) VALUES
(334578, 2, 2016, 'A', '06.201-4', 6.0, 75, "Aprovado"),
(334578, 2, 2016, 'D', '08.910-9', 0.0, 10, "Reprovado");

INSERT INTO tbl_inscricao (ra, semestreTurma, anoTurma, codigoTurma, codigoDisciplina, media, frequencia, resultado) VALUES
(654321, 2, 2016, 'A', '08.910-9', 0.3, 100, "Reprovado"),
(654321, 2, 2016, 'A', '06.201-4', 8.1, 100, "Aprovado"),
(112358, 2, 2016, 'B', '08.910-9', 0.1, 80, "Reprovado"),
(112358, 2, 2016, 'A', '06.201-4', 10.0, 75, "Aprovado");

-- ----------------------------------------------------------------------------
-- Atividade
-- Criado por: Gabriel Palomino (6A)

DROP TABLE IF EXISTS tbl_atividade;
CREATE TABLE IF NOT EXISTS tbl_atividade (
	idAtividade INT(255) PRIMARY KEY,
    dataInicio DATE,
    dataTermino DATE,
    descricao VARCHAR(255) NOT NULL,
    responsaveis VARCHAR(50) NOT NULL,
    tipo INT(5) NOT NULL,
    ano INT,
    semestre INT,
    CONSTRAINT atividade_fk_calendario FOREIGN KEY (ano, semestre) REFERENCES tbl_calendario (ano, semestre)
);

INSERT INTO tbl_atividade VALUES
(1,'2016-05-24','2016-06-24', 'Paralisação temporária', 'DCE', 20, 2016, 1),
(2,'2016-02-29','2016-04-14', 'Período para substituição do conceito R', 'Docentes', 5, 2018, 1),
(3,'2016-02-29','2016-05-09', 'Período para cancelamento de disciplina', 'Estudantes', 10, 2017, 1),
(4,'2016-07-22','2016-07-25', 'Período de inscricao nas disciplinas para o segundo período letivo', 'Estudantes', 10, 2017, 2),
(5,'2016-10-24','2016-10-28', 'Jornada Científica', 'Estudantes', 10, 2016, 2);

DROP VIEW IF EXISTS v_atividade;
CREATE VIEW v_atividade AS
SELECT dataInicio, dataTermino, descricao, responsaveis, tipo, ano, semestre
FROM tbl_atividade;

DROP VIEW IF EXISTS v_atividade_s1;
CREATE VIEW v_atividade_s1 AS
SELECT dataInicio, dataTermino, descricao, responsaveis, tipo, ano, semestre
FROM tbl_atividade
WHERE semestre = 1;

DROP VIEW IF EXISTS v_atividade_s2;
CREATE VIEW v_atividade_s2 AS
SELECT dataInicio, dataTermino, descricao, responsaveis, tipo, ano, semestre
FROM tbl_atividade
WHERE semestre = 2;

DROP PROCEDURE IF EXISTS last_activity;
delimiter //
CREATE PROCEDURE last_activity(
IN ano_i INT,
IN semestre_i INT)
BEGIN
DECLARE data DATE;
	SET data = (SELECT max(dataTermino) FROM tbl_atividade WHERE ano = ano_i AND semestre = semestre_i) ;
	SELECT * FROM tbl_atividade WHERE dataTermino = data AND ano = ano_i AND semestre = semestre_i ;
END //
delimiter ;

DROP PROCEDURE IF EXISTS first_activity;
delimiter //
CREATE PROCEDURE first_activity(
IN ano_i INT,
IN semestre_i INT)
BEGIN
DECLARE data DATE;
	SET data = (SELECT min(dataInicio) FROM tbl_atividade WHERE ano = ano_i AND semestre = semestre_i) ;
	SELECT * FROM tbl_atividade WHERE dataInicio = data AND ano = ano_i AND semestre = semestre_i ;
END //
delimiter ;

DROP FUNCTION IF EXISTS count_Tipo;
delimiter //
CREATE FUNCTION count_Tipo(tipo_i INT, ano_i INT) RETURNS INT
BEGIN
	DECLARE contador INT DEFAULT 0;
	SELECT count(tipo_i) INTO contador FROM tbl_atividade WHERE ano = ano_i AND tipo = tipo_i;
	RETURN contador;
END //
delimiter ;

DROP TRIGGER IF EXISTS t_before_insert_atividade ;
delimiter //
CREATE TRIGGER t_before_insert_atividade
	BEFORE INSERT
	ON tbl_atividade
	FOR EACH ROW
	BEGIN
		IF NEW.dataInicio > NEW.dataTermino THEN
			signal sqlstate '45000' set message_text = "Data de inicio inválida" ;
		END IF;
	END //

delimiter ;

-- ----------------------------------------------------------------------------
-- Proposta Intermediária
-- Criado por: Vinicius Carvalho (6A)

DROP TABLE IF EXISTS tbl_proposta_int;
CREATE TABLE IF NOT EXISTS tbl_proposta_int (
    ano INT NOT NULL,
    semestre INT NOT NULL,
    data_submissao DATE,
    CONSTRAINT pk_proposta_int PRIMARY KEY (ano , semestre),
    CONSTRAINT prop_int_fk_calendario FOREIGN KEY (ano , semestre)
        REFERENCES tbl_calendario (ano , semestre)
);

DROP view IF EXISTS v_proposta_semestre_1;
CREATE VIEW v_proposta_semestre_1 AS
SELECT *
FROM tbl_proposta_int
WHERE semestre = 1;

DROP view IF EXISTS v_proposta_semestre_2;
CREATE VIEW v_proposta_semestre_2 AS
SELECT *
FROM tbl_proposta_int
WHERE semestre = 2;

INSERT INTO tbl_proposta_int(ano, semestre, data_submissao) VALUES
(2016, 1, '2016-07-30'),
(2016, 2, '2016-12-15'),
(2017, 1, '2017-07-30'),
(2017, 2, '2017-12-15'),
(2018, 1, '2018-07-30');

-- ----------------------------------------------------------
-- Função que retorna a data de submissao de uma proposta intermediária, dado seu ano e semestre
-- Exemplo: SELECT * FROM tbl_proposta_int WHERE data_submissao = fn_datasub_propint (2016, 2);
DROP FUNCTION IF EXISTS fn_datasub_propint;
delimiter $$
CREATE FUNCTION fn_datasub_propint( ano_p INT,
                  semestre_p INT)
RETURNS DATE
BEGIN
  DECLARE data DATE;

  SELECT proposta.data_submissao
  INTO   data
  FROM   tbl_proposta_int AS proposta
  WHERE  proposta.ano = ano_p AND proposta.semestre = semestre_p;

  RETURN data;
END$$
delimiter ;

-- ----------------------------------------------------------------------------
-- Recesso
-- Criado por: Vinicius Carvalho (6A)

DROP TABLE IF EXISTS tbl_recesso;
CREATE TABLE IF NOT EXISTS tbl_recesso (
    id      INT NOT NULL AUTO_INCREMENT,
    tipo    VARCHAR(10),
    data_ini  DATE,
    data_ter  DATE,
    CONSTRAINT pk_recesso PRIMARY KEY (id)
);

INSERT INTO tbl_recesso (tipo, data_ini, data_ter)
VALUES
('Acadêmico', '2016-12-15', '2017-02-01'),
('Acadêmico', '2017-12-15', '2018-02-01'),
('Acadêmico', '2018-12-15', '2019-02-01'),
('Acadêmico', '2019-12-15', '2020-02-01'),
('Acadêmico', '2020-12-15', '2021-02-01'),
('Acadêmico', '2021-12-15', '2022-02-01');

-- Trigger que evita que uma data de término seja menor que uma data de início de um semestre em tbl_recesso
-- Exemplo: INSERT INTO tbl_recesso (tipo, data_ini, data_ter) VALUES ('Acadêmico', '2016-12-15', '2015-02-01');
DROP TRIGGER IF EXISTS tr_ordem_datas_rec;
delimiter $$
CREATE TRIGGER tr_ordem_datas_rec
  BEFORE INSERT ON tbl_recesso
FOR EACH row
begin
  IF new.data_ter <= new.data_ini THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Data de termino precisa ser maior que a data de inicio.';
  end IF;
end$$
delimiter ;

-- ----------------------------------------------------------------------------
-- Criado por: André Rocha (4A)

DROP TABLE IF EXISTS tbl_codigo_turma;
CREATE TABLE tbl_codigo_turma (
    id CHAR(5) NOT NULL,
    codigoturma VARCHAR(1) NOT NULL,
    codigodisciplina VARCHAR(20) NOT NULL,
    semestre INT(11) NOT NULL,
    ano INT(11) NOT NULL,
    CONSTRAINT codigoTurma_fk FOREIGN KEY (codigodisciplina , codigoturma , semestre , ano) REFERENCES tbl_turma (codigodisciplina , codigoturma , semestre , ano),
    CONSTRAINT codigoTurma_pk PRIMARY KEY (id)
);

-- ----------------------------------------------------------------------------
INSERT INTO tbl_codigo_turma (semestre, ano, codigoturma, codigodisciplina,id)
VALUES
-- primeiro semestre 2016

(1, 2016, 'A', '02.522-4',1),
(1, 2016, 'B', '02.522-4',2),
(1, 2016, 'C', '02.522-4',3),
(1, 2016, 'A', '02.521-6',4),
(1, 2016, 'A', '02.507-0',5),
(1, 2016, 'B', '02.507-0',6),
(1, 2016, 'C', '02.507-0',7),
(1, 2016, 'A', '02.502-0',8),
(1, 2016, 'A', '02.034-6',9),
(1, 2016, 'A', '08.910-9',10),
(1, 2016, 'B', '08.910-9',11),
(1, 2016, 'C', '08.910-9',12),
(1, 2016, 'D', '08.910-9',13),
(1, 2016, 'E', '08.910-9',14),
(1, 2016, 'F', '08.910-9',15),
(1, 2016, 'G', '08.910-9',16),
(1, 2016, 'H', '08.910-9',17),
(1, 2016, 'I', '08.910-9',18),
(1, 2016, 'J', '08.910-9',19),
(1, 2016, 'K', '08.910-9',20),
(1, 2016, 'L', '08.910-9',21),
(1, 2016, 'M', '08.910-9',22),
(1, 2016, 'N', '08.910-9',23),
(1, 2016, 'O', '08.910-9',24),
(1, 2016, 'Z', '08.910-9',25),
(1, 2016, 'A', '100.054-0', 26);

-- segundo semestre 2016
INSERT INTO tbl_codigo_turma (semestre, ano, codigoturma, codigodisciplina,id)
VALUES
(2, 2016, 'A', '08.910-9', 27),
(2, 2016, 'B', '08.910-9', 28),
(2, 2016, 'C', '08.910-9', 29),
(2, 2016, 'D', '08.910-9', 30),
(2, 2016, 'E', '08.910-9', 31),
(2, 2016, 'F', '08.910-9', 32),
(2, 2016, 'G', '08.910-9', 33),
(2, 2016, 'H', '08.910-9', 34),
(2, 2016, 'I', '08.910-9', 35),
(2, 2016, 'J', '08.910-9', 36),
(2, 2016, 'K', '08.910-9', 37),
(2, 2016, 'L', '08.910-9', 38),
(2, 2016, 'M', '08.910-9', 39),
(2, 2016, 'N', '08.910-9', 40),
(2, 2016, 'O', '08.910-9', 41),
(2, 2016, 'Z', '08.910-9', 42),
(2, 2016, 'A', '06.201-4', 43);

-- View que associa as disciplinas com seus respectivos nomes, horários ofertados, ano e semestre

DROP VIEW IF EXISTS view_disciplinas;
CREATE OR REPLACE VIEW view_disciplinas
AS
SELECT  d.nome as Nome,
  ct.codigodisciplina as Codigo,
  ct.codigoturma as Turma,
      t.dia as DiasOfertados,
      t.horario as Horarios,
      ct.semestre as Semestre,
      ct.ano as Ano
FROM tbl_codigo_turma AS ct, tbl_disciplina AS d, tbl_turma AS t
WHERE
  ct.codigodisciplina = d.codigo;

-- Plano de Ensino
-- Criado por: André Rocha (4A)

DROP TABLE IF EXISTS  tbl_plano_de_ensino;
CREATE TABLE tbl_plano_de_ensino (
    procedimento_avaliacao TEXT NOT NULL,
    recursos TEXT NOT NULL,
    bibliografia_basica TEXT NOT NULL,
    bibliografia_complementar TEXT,
    objetivos_gerais TEXT,
    objetivos_especificos TEXT NOT NULL,
    estrategia_ensino TEXT NOT NULL,
    atividades_alunos TEXT NOT NULL,
    observacoes TEXT NOT NULL,
    atividades_ead TEXT,
    data DATE NOT NULL,
    situacao INT(1) NOT NULL,
    duracao_topicos TEXT NOT NULL,
    pescd INT(1) NOT NULL,
    distribuicao_horas TEXT NOT NULL,
    turma VARCHAR(100) NOT NULL,
    professor VARCHAR(100) NOT NULL,
    ementa TEXT,
    requisitos VARCHAR(100),
    idDocente VARCHAR(15) NOT NULL,
    codigoTurma CHAR(5) NOT NULL,
    CONSTRAINT planoEnsino_fk_docente FOREIGN KEY (idDocente) REFERENCES tbl_docente (pessoa),
    CONSTRAINT planoEnsino_fk_codigoTurma FOREIGN KEY (codigoTurma) REFERENCES tbl_codigo_turma (id),
    CONSTRAINT planoEnsino_pk PRIMARY KEY (idDocente , codigoTurma)
);

INSERT INTO tbl_plano_de_ensino (procedimento_avaliacao, recursos,bibliografia_basica, bibliografia_complementar, objetivos_gerais, objetivos_especificos, estrategia_ensino, atividades_alunos, observacoes, atividades_ead, data, situacao, duracao_topicos, pescd, distribuicao_horas, turma, professor, ementa, requisitos, idDocente, codigoTurma) VALUES

(
'Os alunos serão avaliados mediante a realização de provas e trabalhos individuais, conforme se descreve a seguir:

CRITÉRIO DE AVALIAÇÃO:
- Duas provas: P1 e P2
- Dois trabalhos: T1 e T2
- 02 trabalhos de recuperação: TR-1 e TR-2, valendo de 0,0 a 2,0 (recuperação ao longo do semestre para alunos com notas da P1 e/ou P2 inferior a 6,0)

Nota 1: 0,85 x média das notas de prova (P1+TR-1, P2+TR-2) + 0,15 x média dos trabalhos T1 e T2. Esta média será denominada ?Nota 1?. Apenas os que obtiverem nota menor ou igual a 6,0 nas provas (P1 e P2) terão direito aos trabalhos de recuperação (TR-1 e TR-2).

RECUPERAÇÃO AO LONGO DO SEMESTRE: após as provas P1 e P2, o aluno que obtiver nota menor ou igual a 6,0 poderá recuperar a nota desta prova resolvendo o respectivo trabalho proposto (TR-1, TR-2), cujo conteúdo será divulgado juntamente com a nota da respectiva prova. Cada trabalho poderá atingir a, no máximo, 2,0 pontos e a soma de prova e trabalho não poderá ultrapassar a 6,0 pontos.


Alunos que obtiverem Nota 1 maior ou igual a 6,0 e tiverem frequência maior ou igual a 75% estão aprovados. Aqueles que obtiverem Nota 1 maior ou igual 5,0 e menor que 6,0 e tiverem frequência maior ou igual a 75% poderão fazer a recuperação após o período letivo.

RECUPERAÇÃO APÓS O PERÍODO LETIVO: Prova na segunda semana de aula do semestre seguinte com todo o conteúdo do curso. Esta nota será denominada ?Nota 2? e irá compor a média final do aluno.

MÉDIA FINAL= (Nota 1 + Nota 2)/2.

Terão direito a esta nova chance os alunos que obtiverem média entre 5,0 e 6,0 e frequência igual ou superior a 75%. ',
'Para que o curso seja ministrado serão necessários lousa, giz, computador e projetor multi-mídia.',
'BEER, F.P.; JOHNSTON, E.R. Mecânica Vetorial para Engenheiros. Estática e Dinâmica. Makron Books; McGraw Hill. 5ª edição . Texto básico.
HIBBELER,R.C. Engenharia Mecânica ? Estática. LTC ? Livros Técnicos e Científicos Editora AS. Rio de Janeiro, 8ª edição, 1999.
SINGER, F.L. Mecânica para Engenheiros. Estática e Dinâmica. Harper e Row do Brasil.
MERIAN, J.L. Estática e Dinâmica. CTC. Rio de Janeiro
HIBBELER, R.C. Estática: mecânica para engenharia,volume 1. Pearson Education. São Paulo. 2005.',
'',
'1. DESENVOLVER, NO ESTUDANTE DE ENGENHARIA, A CAPACIDADE DE ANALISAR PROBLEMAS DE MANEIRA SIMPLES E LÓGICA, APLICANDO PARA ISSO POUCOS PRINCÍPIOS BÁSICOS2. MOSTRAR QUE OS CONCEITOS ESTUDADOS SE APLICAM AOS PONTOS MATERIAIS, AOS CORPOS RÍGIDOS ISOLADOS E AOS SISTEMAS DE CORPOS RÍGIDOS, DEIXANDO CLARA A DIFERENÇA ENTRE FORÇAS INTERNAS E FORÇAS EXTERNAS3. LEVAR O ALUNO A COMPREENDER O FUNCIONAMENTO DE ESTRUTURAS ISOSTÁTICAS SIMPLES, MOSTRAR SUA IMPORTÂNCIA PARA A FUTURA COMPREENSÃO DE SITUAÇÕES MAIS COMPLEXAS QUE SERÃO VISTAS EM OUTRAS DISCIPLINAS4. MOSTRAR QUE OS CONCEITOS DE ÁLGEBRA VETORIAL PODEM SER UTILIZADOS PARA RESOLVER MUITOS PROBLEMAS, PRINCIPALMENTE OS TRIDIMENSIONAIS, ONDE SUA APLICAÇÃO RESULTA EM SOLUÇÃO MAIS SIMPLES E CLARA5. MOSTRAR QUE MUITOS DOS PRINCÍPIOS E CONCEITOS SE APLICAM TAMBÉM A CORPOS E SISTEMAS DE CORPOS EM MOVIMENTO.',
'Os objetivos específicos são: 1.) discutir os conceitos de equilíbrio para ponto material e corpo rígido;
2.) analisar problemas de equilíbrio de pontos materiais e de corpos rígidos no plano bidimensional e no espaço tridimensional;
3.) caracterizar os tipos de vínculos de uma estrutura e o seu grau de deslocabilidade;
4.) avaliar os esforços internos e externos atuantes em estruturas de barras como as treliças;
5.) calcular a localização do centro de gravidade e do centro de massa de linhas, áreas e volumes;
6.) calcular o momento de inércia de áreas compostas e entender seu significado físico;
7.) Analisar problemas de equilíbrio envolvendo forças de atrito.',
'As estratégias de ensino consistem na apresentação e discussão dos tópicos em aulas expositivas, com resolução de exercícios, material de apoio (teoria e exercícios) on line no ambiente virtual moodle. Estratégias específicas associadas a cada tópico serão indicadas na sequência.
I.Princípios e Conceitos Fundamentais: discutir a importância da disciplina e sua relação com as demais.
II.Equilíbrio de ponto material: relacionar com fenômenos da natureza.
III. Momento de forças em Relação a Ponto e Eixo: apresentar a teoria com resolução de exemplos.
IV. Sistemas de Forças Equivalentes Resultantes: mostrar sua importância na resolução e simplificação de problemas.
V. Equilíbrio dos Corpos Rígidos: apresentar sua importância na análise de estruturas e como identificar os tipos de restrição de movimento impostas por cada vínculo.
VI. Introdução à Análise de Estruturas com forças aplicadas somente nos nós (treliças) e forças aplicadas também fora dos nós (estruturas compostas): discutir a importância das estruturas na Engenharia Civil e apresentar metodologias para determinar reações nos vínculos e forças em barras.
VII. Treliças: apresentar os princípios do equilíbrio na solução de estruturas simples.
VIII. Estrutura com Elementos Sujeitos a Várias Forças: aplicar as condições de equilíbrio e aprofundar os conceitos de ação e reação.
IX. Atrito: mostrar que o fenômeno pode ser entendido com conceitos de equilíbrio.
X. Centros de Gravidade, de massa e centroides: apresentar sua importância em assuntos futuros e mostrar como determinar cada uma destas propriedades.
XI. Momentos de Inércia: mostrar exemplos de aplicação e importância em futuras disciplinas.',
'As atividades destinadas aos alunos consistem, basicamente:
1) na leitura e estudo da bibliografia recomendada;
2) no estudo e resolução dos exercícios propostos;
3) na utilização de material e atividades on line;
4) no entendimento dos conceitos e de sua importância;
5) na observação de estruturas existentes e visualização do fenômeno em estudo.',
'',
'',
'2016-09-13',
1,
'I. Princípios e Conceitos Fundamentais
II. Equilíbrio de Ponto Material
III. Momento de forças em Relação a Ponto e Eixo
IV. Sistemas de forças equivalentes
V. Equilíbrio de Corpos Rígidos
VI. Introdução à Análise de Estruturas Isostáticas
VII. Treliças: Métodos dos Nós e das Seções
VIII. Estrutura com Elementos Sujeitos a Várias
IX. Centroides e forças distribuídas
X. Momentos de Inércia
XI. Atrito ',
0,
'60/0/0/0/0/0/0',
'120022 - A - MECANICA APLICADA A ENGENHARIA',
'Legolas Silva',
'- PRINCÍPIOS E CONCEITOS FUNDAMENTAIS- ESTÁTICA DAS PARTÍCULAS E DOS CORPOS RÍGIDOS- SISTEMAS DE FORÇAS EQUIVALENTES- INTRODUÇÃO À ANÁLISE DE ESTRUTURAS ISOSTÁTICAS- CENTROS DE GRAVIDADE, CENTRÓIDES, MOMENTOS DE INÉRCIA- CINEMÁTICA DOS CORPOS RÍGIDOS- MOVIMENTO PLANO DOS CORPOS RÍGIDOS- VIBRAÇÕES MECÂNICAS',
'Física Cálculo',
11104385910,
1
),
(
'A disciplina terá três provas regulares. Além destas provas, caso algum aluno manifeste interesse poderão ser realizadas avaliações no formato de entrevista individuais com o professor. Tais avaliações podem substituir e/ou complementar as notas obtidas nas provas. A nota final do aluno será atribuída pelo professor de forma a refletir o aproveitamento do aluno na disciplina.

A avaliação complementar será uma prova versando sobre todo o conteúdo da disciplina a ser aplicada em data combinada previamente com os alunos. Neste caso a nota final será 6, se a nota desta prova for igual ou superior a 6.

Em atendimento ao disposto no Art 10.- III da portaria GR 522/06 ("procedimentos que possibilitem a recuperação de desempenho do estudante durante o período letivo regular;") durante o semestre serão oferecidas diversas formas de recuperação do conteúdo incluindo o horário de atendimento extra-classe, sugestões de estudo dirigido e outras atividades de acordo com a procura dos alunos interessados. ',
'Os recursos humanos e materiais serão os oferecidos usualmente pela Universidade.',
'
[1]. Guidorizzi, H. L. - Um Curso de Cálculo, Vol. 1 e Vol 2 - 5ª Edição, LTC, Rio de Janeiro, 2001.

[2] SPIVAK, Michael. Calculo infinitesimal. Bartolome Frontera Marques (Trad.). Barcelona: Reverte, 1970. v.1. 413 p. ISBN 84-291-5139-7.

[3] APOSTOL, Tom M.. Calculus. Francisco Velez Cantarell (Trad.esp.); Enrique Linés Escardó (rev.). Barcelona: Reverte, 1965. v.1. 575 p.

[4] AVILA, Geraldo Severo de Souza. Calculo: diferencial e integral. 2 ed. Rio de Janeiro: Livros Tecnicos e Cientificos, s.d.. v.1

[5] LEITHOLD, Louis. O calculo: com geometria analitica. [The calculus with analytic geometry]. Antonio Paques (Trad.). 2 ed. Sao Paulo: Harper & Row do Brasil, c1982. v.1. 526 p. ',
'',
'PROPICIAR O APRENDIZADO DOS CONCEITOS DE LIMITE, DERIVADA E INTEGRAL DE FUNÇÕES REAIS DE UMA VARIÁVEL REAL.PROPICIAR A COMPREENSÃO E O DOMÍNIO DOS CONCEITOS E DAS TÉCNICAS DE CÁLCULO DIFERENCIAL E INTEGRAL DESSAS FUNÇÕES.DESENVOLVER A HABILIDADE DE IMPLEMENTAÇÃO DESSES CONCEITOS E TÉCNICAS EM PROBLEMAS NOS QUAIS ELES SE CONSTITUEM OS MODELOS MAIS ADEQUADOS.DESENVOLVER A LINGUAGEM MATEMÁTICA COMO FORMA UNIVERSAL DE EXPRESSÃO DA CIÊNCIA.',
'Propiciar a compreensão e o domínio dos conceitos e das técnicas de Cálculo Diferencial e Integral de funções reais de uma variável real, como linguagem matemática empregada na modelagem de fenômenos das ciências físicas estudadas em cursos de ciências tecnológicas.',
'Para todos os tópicos:
1) Aulas expositivas do conteúdo.
2) Resolução de problemas e exercícios típicos.
3) Propor a resolução de exercícios e problemas pelos alunos, fora do horário de aulas.
5) Indicar bibliografias complementares.
6) Haverá 2 horas semanais de atendimento aos alunos.
',
'Para todos os tópicos:
1) Estudar o texto disponível, de maneira sistemática. Planejar suas horas de estudo.
2) Frequentar assiduamente as aulas, de forma participativa.
3) Ler a bibliografia sugerida sobre os temas da disciplina relacionando suas dúvidas e dificuldades.
4) Resolver exercícios em classe e em casa.
5) Comparecer nos horários de atendimento do professor sempre que se fizer necessário para a melhor compreensão dos conteúdos estudados.
6) Formular questões ao professor sempre que julgar necessário. ',
'',
'',
'2016-09-10',
1,
'1) Números reais e funções (06 horas).
1.1. A reta real, intervalos e desigualdades.
1.2. O conceito de função, funções compostas, funções inversas, gráficos de funções.

2) Limites e funções contínuas. (14 horas)
2.1. Limites de funções, limites laterais e limites infinitos.
2.2. Continuidade de funções reais.
2.3. Teorema do Valor Intermediário e Teorema do Confronto.
2.4. Funções exponenciais e logarítmicas.

3) Derivadas (20 horas)
3.1. Taxas de variação, reta tangente e definição de derivada.
3.2. Cálculo de derivadas: regras de derivação, regra da cadeia, derivação implícita, derivação inversa e derivadas de ordem superior.
3.3. Aplicações de derivadas: funções crescentes e decrescentes, máximos e mínimos, Teorema do Valor Médio e Regra de L´Hospital.

4) Integrais (20 horas)
4.1. Antiderivadas, integral como área, integrais definidas e indefinidas.
4.2. Teorema fundamental do Cálculo.
4.3. Técnicas de integração.
4.4. Aplicações da integral: áreas, volumes, comprimento de arco e outras.
4.5.Integrais impróprias. ',
0,
'30/0/30/0/0/0/0',
'025020 - C - CALCULO 1',
'José Silva',
'1. NÚMEROS REAIS E FUNÇÕES DE UMA VARIÁVEL REAL.2. LIMITES E CONTINUIDADE.3. CÁLCULO DIFERENCIAL E APLICAÇÕES.4. CÁLCULO INTEGRAL E APLICAÇÕES.',
'',
24174616256,
2
),
(
  'A disciplina terá três provas regulares. Além destas provas, caso algum aluno manifeste interesse poderão ser realizadas avaliações no formato de entrevista individuais com o professor. Tais avaliações podem substituir e/ou complementar as notas obtidas nas provas. A nota final do aluno será atribuída pelo professor de forma a refletir o aproveitamento do aluno na disciplina.

A avaliação complementar será uma prova versando sobre todo o conteúdo da disciplina a ser aplicada em data combinada previamente com os alunos. Neste caso a nota final será 6, se a nota desta prova for igual ou superior a 6.

Em atendimento ao disposto no Art 10.- III da portaria GR 522/06 ("procedimentos que possibilitem a recuperação de desempenho do estudante durante o período letivo regular;") durante o semestre serão oferecidas diversas formas de recuperação do conteúdo incluindo o horário de atendimento extra-classe, sugestões de estudo dirigido e outras atividades de acordo com a procura dos alunos interessados. ',
  'Os recursos humanos e materiais serão os oferecidos usualmente pela Universidade.',
  '[1]. Guidorizzi, H. L. - Um Curso de Cálculo, Vol. 1 e Vol 2 - 5ª Edição, LTC, Rio de Janeiro, 2001.

[2] SPIVAK, Michael. Calculo infinitesimal. Bartolome Frontera Marques (Trad.). Barcelona: Reverte, 1970. v.1. 413 p. ISBN 84-291-5139-7.

[3] APOSTOL, Tom M.. Calculus. Francisco Velez Cantarell (Trad.esp.); Enrique Linés Escardó (rev.). Barcelona: Reverte, 1965. v.1. 575 p.

[4] AVILA, Geraldo Severo de Souza. Calculo: diferencial e integral. 2 ed. Rio de Janeiro: Livros Tecnicos e Cientificos, s.d.. v.1

[5] LEITHOLD, Louis. O calculo: com geometria analitica. [The calculus with analytic geometry]. Antonio Paques (Trad.). 2 ed. Sao Paulo: Harper & Row do Brasil, c1982. v.1. 526 p. ',
  '',
  'PROPICIAR O APRENDIZADO DOS CONCEITOS DE LIMITE, DERIVADA E INTEGRAL DE FUNÇÕES REAIS DE UMA VARIÁVEL REAL.PROPICIAR A COMPREENSÃO E O DOMÍNIO DOS CONCEITOS E DAS TÉCNICAS DE CÁLCULO DIFERENCIAL E INTEGRAL DESSAS FUNÇÕES.DESENVOLVER A HABILIDADE DE IMPLEMENTAÇÃO DESSES CONCEITOS E TÉCNICAS EM PROBLEMAS NOS QUAIS ELES SE CONSTITUEM OS MODELOS MAIS ADEQUADOS.DESENVOLVER A LINGUAGEM MATEMÁTICA COMO FORMA UNIVERSAL DE EXPRESSÃO DA CIÊNCIA.',
  'Propiciar a compreensão e o domínio dos conceitos e das técnicas de Cálculo Diferencial e Integral de funções reais de uma variável real, como linguagem matemática empregada na modelagem de fenômenos das ciências físicas estudadas em cursos de ciências tecnológicas.',
  'Para todos os tópicos:
1) Aulas expositivas do conteúdo.
2) Resolução de problemas e exercícios típicos.
3) Propor a resolução de exercícios e problemas pelos alunos, fora do horário de aulas.
5) Indicar bibliografias complementares.
6) Haverá 2 horas semanais de atendimento aos alunos. ',
  'Para todos os tópicos:
1) Estudar o texto disponível, de maneira sistemática. Planejar suas horas de estudo.
2) Frequentar assiduamente as aulas, de forma participativa.
3) Ler a bibliografia sugerida sobre os temas da disciplina relacionando suas dúvidas e dificuldades.
4) Resolver exercícios em classe e em casa.
5) Comparecer nos horários de atendimento do professor sempre que se fizer necessário para a melhor compreensão dos conteúdos estudados.
6) Formular questões ao professor sempre que julgar necessário. ',
  '',
  '',
  '2016-09-10',
  1,
  '1) Números reais e funções (06 horas).
1.1. A reta real, intervalos e desigualdades.
1.2. O conceito de função, funções compostas, funções inversas, gráficos de funções.

2) Limites e funções contínuas. (14 horas)
2.1. Limites de funções, limites laterais e limites infinitos.
2.2. Continuidade de funções reais.
2.3. Teorema do Valor Intermediário e Teorema do Confronto.
2.4. Funções exponenciais e logarítmicas.

3) Derivadas (20 horas)
3.1. Taxas de variação, reta tangente e definição de derivada.
3.2. Cálculo de derivadas: regras de derivação, regra da cadeia, derivação implícita, derivação inversa e derivadas de ordem superior.
3.3. Aplicações de derivadas: funções crescentes e decrescentes, máximos e mínimos, Teorema do Valor Médio e Regra de L´Hospital.

4) Integrais (20 horas)
4.1. Antiderivadas, integral como área, integrais definidas e indefinidas.
4.2. Teorema fundamental do Cálculo.
4.3. Técnicas de integração.
4.4. Aplicações da integral: áreas, volumes, comprimento de arco e outras.
4.5.Integrais impróprias. ',
  1,
  '60/0/0/0/0/0/0',
  '025020 - A - CALCULO 1',
  'Raimundo Carvalho',
  '1. NÚMEROS REAIS E FUNÇÕES DE UMA VARIÁVEL REAL.2. LIMITES E CONTINUIDADE.3. CÁLCULO DIFERENCIAL E APLICAÇÕES.4. CÁLCULO INTEGRAL E APLICAÇÕES.',
  '',
  40078919665,
  3
),
(
  'A disciplina terá três provas regulares. Além destas provas, caso algum aluno manifeste interesse poderão ser realizadas avaliações no formato de entrevista individuais com o professor. Tais avaliações podem substituir e/ou complementar as notas obtidas nas provas. A nota final do aluno será atribuída pelo professor de forma a refletir o aproveitamento do aluno na disciplina.

A avaliação complementar será uma prova versando sobre todo o conteúdo da disciplina a ser aplicada em data combinada previamente com os alunos. Neste caso a nota final será 6, se a nota desta prova for igual ou superior a 6.

Em atendimento ao disposto no Art 10.- III da portaria GR 522/06 ("procedimentos que possibilitem a recuperação de desempenho do estudante durante o período letivo regular;") durante o semestre serão oferecidas diversas formas de recuperação do conteúdo incluindo o horário de atendimento extra-classe, sugestões de estudo dirigido e outras atividades de acordo com a procura dos alunos interessados. ',
  'Os recursos humanos e materiais serão os oferecidos usualmente pela Universidade.',
  '[1]. Guidorizzi, H. L. - Um Curso de Cálculo, Vol. 1 e Vol 2 - 5ª Edição, LTC, Rio de Janeiro, 2001.

[2] SPIVAK, Michael. Calculo infinitesimal. Bartolome Frontera Marques (Trad.). Barcelona: Reverte, 1970. v.1. 413 p. ISBN 84-291-5139-7.

[3] APOSTOL, Tom M.. Calculus. Francisco Velez Cantarell (Trad.esp.); Enrique Linés Escardó (rev.). Barcelona: Reverte, 1965. v.1. 575 p.

[4] AVILA, Geraldo Severo de Souza. Calculo: diferencial e integral. 2 ed. Rio de Janeiro: Livros Tecnicos e Cientificos, s.d.. v.1

[5] LEITHOLD, Louis. O calculo: com geometria analitica. [The calculus with analytic geometry]. Antonio Paques (Trad.). 2 ed. Sao Paulo: Harper & Row do Brasil, c1982. v.1. 526 p. ',
  '',
  'PROPICIAR O APRENDIZADO DOS CONCEITOS DE LIMITE, DERIVADA E INTEGRAL DE FUNÇÕES REAIS DE UMA VARIÁVEL REAL.PROPICIAR A COMPREENSÃO E O DOMÍNIO DOS CONCEITOS E DAS TÉCNICAS DE CÁLCULO DIFERENCIAL E INTEGRAL DESSAS FUNÇÕES.DESENVOLVER A HABILIDADE DE IMPLEMENTAÇÃO DESSES CONCEITOS E TÉCNICAS EM PROBLEMAS NOS QUAIS ELES SE CONSTITUEM OS MODELOS MAIS ADEQUADOS.DESENVOLVER A LINGUAGEM MATEMÁTICA COMO FORMA UNIVERSAL DE EXPRESSÃO DA CIÊNCIA.',
  'Propiciar a compreensão e o domínio dos conceitos e das técnicas de Cálculo Diferencial e Integral de funções reais de uma variável real, como linguagem matemática empregada na modelagem de fenômenos das ciências físicas estudadas em cursos de ciências tecnológicas.',
  'Para todos os tópicos:
1) Aulas expositivas do conteúdo.
2) Resolução de problemas e exercícios típicos.
3) Propor a resolução de exercícios e problemas pelos alunos, fora do horário de aulas.
5) Indicar bibliografias complementares.
6) Haverá 2 horas semanais de atendimento aos alunos. ',
  'Para todos os tópicos:
1) Estudar o texto disponível, de maneira sistemática. Planejar suas horas de estudo.
2) Frequentar assiduamente as aulas, de forma participativa.
3) Ler a bibliografia sugerida sobre os temas da disciplina relacionando suas dúvidas e dificuldades.
4) Resolver exercícios em classe e em casa.
5) Comparecer nos horários de atendimento do professor sempre que se fizer necessário para a melhor compreensão dos conteúdos estudados.
6) Formular questões ao professor sempre que julgar necessário. ',
  '',
  '',
  '2016-09-10',
  1,
  '1) Números reais e funções (06 horas).
1.1. A reta real, intervalos e desigualdades.
1.2. O conceito de função, funções compostas, funções inversas, gráficos de funções.

2) Limites e funções contínuas. (14 horas)
2.1. Limites de funções, limites laterais e limites infinitos.
2.2. Continuidade de funções reais.
2.3. Teorema do Valor Intermediário e Teorema do Confronto.
2.4. Funções exponenciais e logarítmicas.

3) Derivadas (20 horas)
3.1. Taxas de variação, reta tangente e definição de derivada.
3.2. Cálculo de derivadas: regras de derivação, regra da cadeia, derivação implícita, derivação inversa e derivadas de ordem superior.
3.3. Aplicações de derivadas: funções crescentes e decrescentes, máximos e mínimos, Teorema do Valor Médio e Regra de L´Hospital.

4) Integrais (20 horas)
4.1. Antiderivadas, integral como área, integrais definidas e indefinidas.
4.2. Teorema fundamental do Cálculo.
4.3. Técnicas de integração.
4.4. Aplicações da integral: áreas, volumes, comprimento de arco e outras.
4.5.Integrais impróprias. ',
  0,
  '60/0/0/0/0/0/0',
  '025020 - B -CALCULO 1',
  'Raimundo Carvalho',
  '1. NÚMEROS REAIS E FUNÇÕES DE UMA VARIÁVEL REAL.2. LIMITES E CONTINUIDADE.3. CÁLCULO DIFERENCIAL E APLICAÇÕES.4. CÁLCULO INTEGRAL E APLICAÇÕES.',
  '',
  40078919665,
  4
),
(
'Os alunos serão avaliados mediante a realização de provas e trabalhos individuais, conforme se descreve a seguir:

CRITÉRIO DE AVALIAÇÃO:
- Duas provas: P1 e P2
- Dois trabalhos: T1 e T2
- 02 trabalhos de recuperação: TR-1 e TR-2, valendo de 0,0 a 2,0 (recuperação ao longo do semestre para alunos com notas da P1 e/ou P2 inferior a 6,0)

Nota 1: 0,85 x média das notas de prova (P1+TR-1, P2+TR-2) + 0,15 x média dos trabalhos T1 e T2. Esta média será denominada ?Nota 1?. Apenas os que obtiverem nota menor ou igual a 6,0 nas provas (P1 e P2) terão direito aos trabalhos de recuperação (TR-1 e TR-2).

RECUPERAÇÃO AO LONGO DO SEMESTRE: após as provas P1 e P2, o aluno que obtiver nota menor ou igual a 6,0 poderá recuperar a nota desta prova resolvendo o respectivo trabalho proposto (TR-1, TR-2), cujo conteúdo será divulgado juntamente com a nota da respectiva prova. Cada trabalho poderá atingir a, no máximo, 2,0 pontos e a soma de prova e trabalho não poderá ultrapassar a 6,0 pontos.


Alunos que obtiverem Nota 1 maior ou igual a 6,0 e tiverem frequência maior ou igual a 75% estão aprovados. Aqueles que obtiverem Nota 1 maior ou igual 5,0 e menor que 6,0 e tiverem frequência maior ou igual a 75% poderão fazer a recuperação após o período letivo.

RECUPERAÇÃO APÓS O PERÍODO LETIVO: Prova na segunda semana de aula do semestre seguinte com todo o conteúdo do curso. Esta nota será denominada ?Nota 2? e irá compor a média final do aluno.

MÉDIA FINAL= (Nota 1 + Nota 2)/2.

Terão direito a esta nova chance os alunos que obtiverem média entre 5,0 e 6,0 e frequência igual ou superior a 75%. ',
'Para que o curso seja ministrado serão necessários lousa, giz, computador e projetor multi-mídia.',
'BEER, F.P.; JOHNSTON, E.R. Mecânica Vetorial para Engenheiros. Estática e Dinâmica. Makron Books; McGraw Hill. 5ª edição . Texto básico.
HIBBELER,R.C. Engenharia Mecânica ? Estática. LTC ? Livros Técnicos e Científicos Editora AS. Rio de Janeiro, 8ª edição, 1999.
SINGER, F.L. Mecânica para Engenheiros. Estática e Dinâmica. Harper e Row do Brasil.
MERIAN, J.L. Estática e Dinâmica. CTC. Rio de Janeiro
HIBBELER, R.C. Estática: mecânica para engenharia,volume 1. Pearson Education. São Paulo. 2005.',
'',
'1. DESENVOLVER, NO ESTUDANTE DE ENGENHARIA, A CAPACIDADE DE ANALISAR PROBLEMAS DE MANEIRA SIMPLES E LÓGICA, APLICANDO PARA ISSO POUCOS PRINCÍPIOS BÁSICOS2. MOSTRAR QUE OS CONCEITOS ESTUDADOS SE APLICAM AOS PONTOS MATERIAIS, AOS CORPOS RÍGIDOS ISOLADOS E AOS SISTEMAS DE CORPOS RÍGIDOS, DEIXANDO CLARA A DIFERENÇA ENTRE FORÇAS INTERNAS E FORÇAS EXTERNAS3. LEVAR O ALUNO A COMPREENDER O FUNCIONAMENTO DE ESTRUTURAS ISOSTÁTICAS SIMPLES, MOSTRAR SUA IMPORTÂNCIA PARA A FUTURA COMPREENSÃO DE SITUAÇÕES MAIS COMPLEXAS QUE SERÃO VISTAS EM OUTRAS DISCIPLINAS4. MOSTRAR QUE OS CONCEITOS DE ÁLGEBRA VETORIAL PODEM SER UTILIZADOS PARA RESOLVER MUITOS PROBLEMAS, PRINCIPALMENTE OS TRIDIMENSIONAIS, ONDE SUA APLICAÇÃO RESULTA EM SOLUÇÃO MAIS SIMPLES E CLARA5. MOSTRAR QUE MUITOS DOS PRINCÍPIOS E CONCEITOS SE APLICAM TAMBÉM A CORPOS E SISTEMAS DE CORPOS EM MOVIMENTO.',
'Os objetivos específicos são: 1.) discutir os conceitos de equilíbrio para ponto material e corpo rígido;
2.) analisar problemas de equilíbrio de pontos materiais e de corpos rígidos no plano bidimensional e no espaço tridimensional;
3.) caracterizar os tipos de vínculos de uma estrutura e o seu grau de deslocabilidade;
4.) avaliar os esforços internos e externos atuantes em estruturas de barras como as treliças;
5.) calcular a localização do centro de gravidade e do centro de massa de linhas, áreas e volumes;
6.) calcular o momento de inércia de áreas compostas e entender seu significado físico;
7.) Analisar problemas de equilíbrio envolvendo forças de atrito.',
'As estratégias de ensino consistem na apresentação e discussão dos tópicos em aulas expositivas, com resolução de exercícios, material de apoio (teoria e exercícios) on line no ambiente virtual moodle. Estratégias específicas associadas a cada tópico serão indicadas na sequência.
I.Princípios e Conceitos Fundamentais: discutir a importância da disciplina e sua relação com as demais.
II.Equilíbrio de ponto material: relacionar com fenômenos da natureza.
III. Momento de forças em Relação a Ponto e Eixo: apresentar a teoria com resolução de exemplos.
IV. Sistemas de Forças Equivalentes Resultantes: mostrar sua importância na resolução e simplificação de problemas.
V. Equilíbrio dos Corpos Rígidos: apresentar sua importância na análise de estruturas e como identificar os tipos de restrição de movimento impostas por cada vínculo.
VI. Introdução à Análise de Estruturas com forças aplicadas somente nos nós (treliças) e forças aplicadas também fora dos nós (estruturas compostas): discutir a importância das estruturas na Engenharia Civil e apresentar metodologias para determinar reações nos vínculos e forças em barras.
VII. Treliças: apresentar os princípios do equilíbrio na solução de estruturas simples.
VIII. Estrutura com Elementos Sujeitos a Várias Forças: aplicar as condições de equilíbrio e aprofundar os conceitos de ação e reação.
IX. Atrito: mostrar que o fenômeno pode ser entendido com conceitos de equilíbrio.
X. Centros de Gravidade, de massa e centroides: apresentar sua importância em assuntos futuros e mostrar como determinar cada uma destas propriedades.
XI. Momentos de Inércia: mostrar exemplos de aplicação e importância em futuras disciplinas.',
'As atividades destinadas aos alunos consistem, basicamente:
1) na leitura e estudo da bibliografia recomendada;
2) no estudo e resolução dos exercícios propostos;
3) na utilização de material e atividades on line;
4) no entendimento dos conceitos e de sua importância;
5) na observação de estruturas existentes e visualização do fenômeno em estudo.',
'',
'',
'2016-09-13',
1,
'I. Princípios e Conceitos Fundamentais
II. Equilíbrio de Ponto Material
III. Momento de forças em Relação a Ponto e Eixo
IV. Sistemas de forças equivalentes
V. Equilíbrio de Corpos Rígidos
VI. Introdução à Análise de Estruturas Isostáticas
VII. Treliças: Métodos dos Nós e das Seções
VIII. Estrutura com Elementos Sujeitos a Várias
IX. Centroides e forças distribuídas
X. Momentos de Inércia
XI. Atrito ',
0,
'60/0/0/0/0/0/0',
'120022 - B - MECANICA APLICADA A ENGENHARIA',
'Legolas Silva',
'- PRINCÍPIOS E CONCEITOS FUNDAMENTAIS- ESTÁTICA DAS PARTÍCULAS E DOS CORPOS RÍGIDOS- SISTEMAS DE FORÇAS EQUIVALENTES- INTRODUÇÃO À ANÁLISE DE ESTRUTURAS ISOSTÁTICAS- CENTROS DE GRAVIDADE, CENTRÓIDES, MOMENTOS DE INÉRCIA- CINEMÁTICA DOS CORPOS RÍGIDOS- MOVIMENTO PLANO DOS CORPOS RÍGIDOS- VIBRAÇÕES MECÂNICAS',
'Física Cálculo',
11104385910,
5
);

-- View que mostra somente Planos de Ensino de disciplinas que estejam no programa PESCD

DROP VIEW IF EXISTS view_planoEnsino;
CREATE OR REPLACE VIEW view_planoEnsino
AS
  SELECT * FROM tbl_plano_de_ensino
  WHERE tbl_plano_de_ensino.pescd != 0;


-- Revisa
-- Criado por: André Rocha (4A)

DROP TABLE IF EXISTS  tbl_revisa;
CREATE TABLE tbl_revisa (
    parecer TEXT,
    aceitacao VARCHAR(20) NOT NULL,
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    docente_revisa VARCHAR(15) NOT NULL,
    docente_elabora VARCHAR(15) NOT NULL,
    codigoTurma CHAR(5) NOT NULL,
    CONSTRAINT revisa_fk_docente FOREIGN KEY (docente_revisa) REFERENCES tbl_docente (pessoa),
    CONSTRAINT revisa_fk_planoEnsino FOREIGN KEY (docente_elabora,codigoTurma) REFERENCES tbl_plano_de_ensino (idDocente,codigoTurma),
    CONSTRAINT revisa_pk PRIMARY KEY (docente_revisa, codigoTurma, docente_elabora)
);

INSERT INTO tbl_revisa (parecer, aceitacao, docente_revisa, docente_elabora, codigoTurma) VALUES

('', 'Aceitação Integral',40078919665,11104385910,5),
('', 'Aceitação Parcial' ,24174616256,40078919665,3),
('Plano de ensino elaborado de acordo com os padrões estabelecidos, avaliado pelo Docente Legolas Silva', 'Aceitação Integral', 11104385910,24174616256,2),
('Plano de ensino elaborado de acordo com os padrões estabelecidos, avaliado pelo Docente Legolas Silva', 'Aceitação Integral', 11104385910,40078919665,4),
('', 'Aceitação Integral',40078919665,11104385910,1);

-- View que associa todos os planos de ensino, seus status, elaboradores e revisores

DROP VIEW IF EXISTS view_revisa;
CREATE OR REPLACE VIEW view_revisa
AS
  SELECT DISTINCT
    p.prenome AS nome_docente,
    p.sobrenome AS sobrenome_docente,
    p.pessoa_id AS id_docente,
    r.aceitacao AS status,
    r.parecer,
    ct.codigodisciplina,
    ct.codigoturma,
    r.data_hora,
    pe.prenome AS nome_revisor,
    pe.sobrenome AS sobrenome_revisor,
    pe.pessoa_id AS id_revisor
  FROM
  tbl_pessoa AS p, tbl_revisa AS r, tbl_docente AS d, tbl_codigo_turma AS ct, tbl_pessoa AS pe
  WHERE
  r.docente_elabora = p.pessoa_id
  AND r.codigoTurma = ct.id
  AND r.docente_revisa = pe.pessoa_id;

-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------

-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------

-- Estudante Views
DROP view IF EXISTS v_estudante;
CREATE OR replace VIEW v_estudante
AS
  SELECT pessoa_id,
         tbl_estudante.ra,
         sigla,
         ano_ingresso,
         ira
  FROM   tbl_estudante,
         tbl_matricula
  WHERE  tbl_estudante.ra = tbl_matricula.ra;

-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------
DROP VIEW IF EXISTS view_visualiza_recursos_cada_sala_cada_predio;
CREATE VIEW view_visualiza_recursos_cada_sala_cada_predio AS
SELECT P.sigla, S.numero, S.recursos FROM tbl_sala AS S
	INNER JOIN tbl_predio AS P ON P.sigla = S.predio ;

-- Procedure para predio
DROP PROCEDURE IF EXISTS proc_salas_por_predio;
delimiter $$
	CREATE PROCEDURE proc_salas_por_predio
	(
		IN siglaPredio VARCHAR(5)

	)
	BEGIN
		SELECT predio, numero
			FROM tbl_sala AS S
				INNER JOIN tbl_predio AS P ON P.sigla = S.predio
				WHERE P.sigla = siglaPredio;

END$$
delimiter ;


-- Function para quantidade de salas por predio
DROP FUNCTION IF EXISTS func_qntd_sala_predio;
delimiter $$
CREATE function
  func_qntd_sala_predio
                         (
                         siglapredio VARCHAR(5)
                         )
  returns TEXT
begin
  DECLARE contagem INT;
  SET contagem =
  (
           SELECT   count(numero)
           FROM     tbl_sala
           WHERE    predio = siglapredio
           GROUP BY predio);
  RETURN Concat('Quantidade de salas no ', siglapredio, ': ', contagem);
  end$$
delimiter ;

-- Trigger para predio e sala
-- Trigger para que o numero da sala esteja entre os intervalos do at em que se deseja adicionar uma nova sala
DROP TRIGGER IF EXISTS t_before_insert_sala_intervaloErrado ;
delimiter $$
CREATE TRIGGER t_before_insert_sala_intervaloErrado
	BEFORE INSERT
	ON tbl_sala
	FOR EACH ROW
	BEGIN
		DECLARE intervaloInicio INT(3);
		DECLARE intervaloFim INT(3);

		SET intervaloInicio = (SELECT primeira_sala FROM tbl_predio
							WHERE sigla = NEW.predio) ;
		SET intervaloFim = (SELECT ultima_sala FROM tbl_predio
							WHERE sigla = NEW.predio);

		IF NEW.numero < intervaloInicio THEN
			signal sqlstate '45000' set message_text = "Numero de sala fora do intervalo do AT" ;
		ELSEIF NEW.numero > intervaloFim THEN
			signal sqlstate '45000' set message_text = "Numero de sala fora do intervalo M do AT" ;
		END IF;

	END$$

delimiter ;