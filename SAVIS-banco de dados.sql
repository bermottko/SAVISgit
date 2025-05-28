CREATE TABLE endereco (
    cod INT NOT NULL AUTO_INCREMENT,
    rua VARCHAR(50) NOT NULL,
    numero INT NOT NULL,
    bairro VARCHAR(20) NOT NULL,
    cidade VARCHAR(30) NOT NULL,
    UF CHAR(2) NOT NULL,
    CEP CHAR(9) NOT NULL,
    CONSTRAINT pk_endereco PRIMARY KEY (cod), 
    CONSTRAINT ck_UF CHECK (UF IN ('AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO'))
);

CREATE TABLE genero (
    cod INT NOT NULL AUTO_INCREMENT,
    descricao CHAR(13) NOT NULL, 
    CONSTRAINT pk_genero PRIMARY KEY (cod),
    CONSTRAINT ck_descricao CHECK (descricao IN ('Masculino', 'Feminino', 'Não-binário', 'Outro'))
);

CREATE TABLE status (
    cod INT NOT NULL AUTO_INCREMENT,
    descricao CHAR(9) NOT NULL,
    CONSTRAINT pk_status PRIMARY KEY (cod),
    CONSTRAINT ck_status CHECK (descricao IN ('Cancelada', 'Concluída', 'Pendente'))
);

CREATE TABLE usuario (
    cod INT NOT NULL AUTO_INCREMENT,
    img BLOB,
    nome VARCHAR(40) NOT NULL,
    data_nasc DATE NOT NULL,
    CPF CHAR(14) UNIQUE NOT NULL,
    genero INT NOT NULL,
    email VARCHAR(30) NOT NULL,
    fone CHAR(16) NOT NULL,
    endereco INT NOT NULL,
    SUS INT NOT NULL,
    senha VARCHAR(16) NOT NULL,
    CONSTRAINT pk_usuario PRIMARY KEY (cod), 
    CONSTRAINT fk_usuario_endereco FOREIGN KEY (endereco) REFERENCES endereco(cod)
        ON DELETE CASCADE ON UPDATE CASCADE, 
    CONSTRAINT fk_usuario_genero FOREIGN KEY (genero) REFERENCES genero(cod)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE solicita (
    cod INT NOT NULL AUTO_INCREMENT,
    usuario INT NOT NULL, 
    local_consul VARCHAR(50) NOT NULL,
    data_consul DATE NOT NULL,
    hora_consul TIME NOT NULL,
    encaminhamento BLOB NOT NULL,
    status INT, 
    objetivo VARCHAR(30) NOT NULL,
    obs VARCHAR(255), 
    data_solicita DATE,
    hora_solicita TIME,
    CONSTRAINT pk_solicita PRIMARY KEY (cod), 
    CONSTRAINT fk_solicita_usuario FOREIGN KEY (usuario) REFERENCES usuario(cod)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_solicita_status FOREIGN KEY (status) REFERENCES status(cod)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE documentos (
    cod INT NOT NULL AUTO_INCREMENT,
    carteira_trab BLOB,
    cursos BLOB,
    habilitacao BLOB,
    comprov_resid BLOB,
    comprov_escola BLOB,
    titulo_eleitor BLOB,
    ant_crim BLOB,
    exame_tox BLOB,
    CONSTRAINT pk_documentos PRIMARY KEY (cod)
);

CREATE TABLE motorista (
    cod INT NOT NULL AUTO_INCREMENT,
    matricula INT UNIQUE,
    img BLOB,
    nome VARCHAR(40),
    data_nasc DATE,
    CPF CHAR(14) UNIQUE,
    fone CHAR(16),
    email VARCHAR(30),
    endereco INT, 
    genero INT, 
    docs INT, 
    CONSTRAINT pk_motorista PRIMARY KEY (cod), 
    CONSTRAINT fk_motorista_endereco FOREIGN KEY (endereco) REFERENCES endereco(cod)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_motorista_genero FOREIGN KEY (genero) REFERENCES genero(cod)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_motorista_docs FOREIGN KEY (docs) REFERENCES documentos(cod)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE viagem (
    cod INT NOT NULL AUTO_INCREMENT,
    destino_cid VARCHAR(30),
    data_viagem DATE,
    horario_saida TIME,
    lugares_dispo INT,
    modelo_car VARCHAR(30),
    placa CHAR(7),
    motorista INT, 
    status INT, 
    combustivel REAL,
    km_inicial REAL,
    km_final REAL,
    paradas VARCHAR(200),
    horario_chega TIME,
    obs VARCHAR(255),
    CONSTRAINT pk_viagem PRIMARY KEY (cod), 
    CONSTRAINT fk_viagem_motorista FOREIGN KEY (motorista) REFERENCES motorista(cod)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_viagem_status FOREIGN KEY (status) REFERENCES status(cod)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE chefe_agendamento (
    cod INT NOT NULL AUTO_INCREMENT,
    matricula INT NOT NULL UNIQUE,
    senha VARCHAR(16) NOT NULL,
    nome VARCHAR(40) NOT NULL,
    CONSTRAINT pk_chefe_agendamento PRIMARY KEY (cod)
);

INSERT INTO chefe_agendamento (matricula, senha, nome)
VALUES (1234, '1234', 'Ber');
