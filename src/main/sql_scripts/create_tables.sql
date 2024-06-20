-- Cria o banco de dados somente se não existir
CREATE DATABASE IF NOT EXISTS convert_coins_db;

-- Seleciona o banco de dados
USE convert_coins_db;

CREATE TABLE IF NOT EXISTS Moeda (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sigla VARCHAR(10) NOT NULL,
    nome VARCHAR(100) NOT NULL
);
