
-- Criar banco de dados
CREATE DATABASE sistema_pet
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

-- Selecionar banco de dados
USE sistema_pet;

-- Tabela de tutores
CREATE TABLE tutores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100),
    endereco VARCHAR(200)
);

-- Tabela de pets
CREATE TABLE pets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especie VARCHAR(50) NOT NULL,
    raca VARCHAR(50),
    idade INT,
    sexo VARCHAR(20),
    tutor_id INT NOT NULL,

    FOREIGN KEY (tutor_id)
    REFERENCES tutores(id)
    ON DELETE CASCADE
);

-- Tabela de agendamentos
CREATE TABLE agendamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pet_id INT NOT NULL,
    data DATE NOT NULL,
    horario TIME NOT NULL,
    servico VARCHAR(100) NOT NULL,
    observacoes TEXT,
    status VARCHAR(30) DEFAULT 'Agendado',

    FOREIGN KEY (pet_id)
    REFERENCES pets(id)
    ON DELETE CASCADE
);
