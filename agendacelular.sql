CREATE DATABASE AgendaCelular;
USE AgendaCelular;
CREATE TABLE Contatos (
    id_contato INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    data_nascimento DATE
);
CREATE TABLE Telefones (
    id_telefone INT AUTO_INCREMENT PRIMARY KEY,
    id_contato INT NOT NULL,
    numero VARCHAR(20) NOT NULL,
    tipo VARCHAR(20), -- Exemplo: 'Celular', 'Residencial', 'Comercial'
    FOREIGN KEY (id_contato) REFERENCES Contatos(id_contato)
);
CREATE TABLE Grupos (
    id_grupo INT AUTO_INCREMENT PRIMARY KEY,
    nome_grupo VARCHAR(50) NOT NULL
);
CREATE TABLE Contato_Grupo (
    id_contato INT,
    id_grupo INT,
    PRIMARY KEY (id_contato, id_grupo),
    FOREIGN KEY (id_contato) REFERENCES Contatos(id_contato),
    FOREIGN KEY (id_grupo) REFERENCES Grupos(id_grupo)
);
INSERT INTO Contatos (nome, email, data_nascimento)
VALUES
('Maria Silva', 'maria@email.com', '1990-05-12'),
('João Pereira', 'joao@email.com', '1985-09-23'),
('Ana Costa', 'ana@email.com', '2000-11-01');
INSERT INTO Telefones (id_contato, numero, tipo)
VALUES
(1, '11988887777', 'Celular'),
(1, '1133224455', 'Residencial'),
(2, '11999996666', 'Celular'),
(3, '11977775555', 'Celular');
INSERT INTO Grupos (nome_grupo)
VALUES
('Família'),
('Trabalho'),
('Amigos');
INSERT INTO Contato_Grupo (id_contato, id_grupo)
VALUES
(1, 1),
(1, 3),
(2, 2),
(3, 3);
SELECT * FROM Contatos;
SELECT c.nome, t.numero, t.tipo
FROM Contatos c
JOIN Telefones t ON c.id_contato = t.id_contato;
SELECT g.nome_grupo, c.nome
FROM Grupos g
JOIN Contato_Grupo cg ON g.id_grupo = cg.id_grupo
JOIN Contatos c ON cg.id_contato = c.id_contato
ORDER BY g.nome_grupo;
SELECT c.nome, GROUP_CONCAT(g.nome_grupo SEPARATOR ', ') AS grupos
FROM Contatos c
LEFT JOIN Contato_Grupo cg ON c.id_contato = cg.id_contato
LEFT JOIN Grupos g ON cg.id_grupo = g.id_grupo
GROUP BY c.id_contato;
