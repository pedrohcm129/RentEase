-- Excluir tabelas se existirem
DROP TABLE IF EXISTS Disponibiliza CASCADE;
DROP TABLE IF EXISTS Contrato CASCADE;
DROP TABLE IF EXISTS Imovel CASCADE;
DROP TABLE IF EXISTS Proprietario CASCADE;
DROP TABLE IF EXISTS Inquilino CASCADE;
DROP TABLE IF EXISTS Endereco CASCADE;
DROP TABLE IF EXISTS Usuario CASCADE;

-- Tabela Usuário
CREATE TABLE Usuario (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    data_aniversario DATE,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela Endereço
CREATE TABLE Endereco (
    id SERIAL PRIMARY KEY,
    logradouro VARCHAR(255) NOT NULL,
    numero VARCHAR(10),
    bairro VARCHAR(100),
    cidade VARCHAR(100) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    cep VARCHAR(15) NOT NULL,
    usuario_id INT UNIQUE REFERENCES Usuario(id)
);

-- Tabela Inquilino
CREATE TABLE Inquilino (
    usuario_id INT PRIMARY KEY REFERENCES Usuario(id),
    cpf VARCHAR(14) UNIQUE NOT NULL,
    identidade VARCHAR(20) UNIQUE NOT NULL
);

-- Tabela Proprietário
CREATE TABLE Proprietario (
    usuario_id INT PRIMARY KEY REFERENCES Usuario(id),
    cpf VARCHAR(14) UNIQUE NOT NULL,
    identidade VARCHAR(20) UNIQUE NOT NULL
);

-- Tabela Imóvel
CREATE TABLE Imovel (
    id SERIAL PRIMARY KEY,
    proprietario_id INT NOT NULL REFERENCES Proprietario(usuario_id),
    endereco_id INT UNIQUE REFERENCES Endereco(id)
);

-- Tabela Contrato
CREATE TABLE Contrato (
    id SERIAL PRIMARY KEY,
    inquilino_id INT NOT NULL REFERENCES Inquilino(usuario_id),
    imovel_id INT NOT NULL REFERENCES Imovel(id),
    documento TEXT NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    CONSTRAINT contrato_unico UNIQUE (inquilino_id, imovel_id)
);

-- Tabela Disponibiliza
CREATE TABLE Disponibiliza (
    proprietario_id INT NOT NULL REFERENCES Proprietario(usuario_id),
    imovel_id INT NOT NULL REFERENCES Imovel(id),
    PRIMARY KEY (proprietario_id, imovel_id)
);
