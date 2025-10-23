use  DB_03360A_Maicon;
CREATE TABLE departamentos (
    id_departamento INT PRIMARY KEY,
    nome_departamento VARCHAR(100)
);

CREATE TABLE funcionarios (
    id_funcionario INT PRIMARY KEY,
    nome_funcionario VARCHAR(100),
    cargo VARCHAR(100),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento)
);
-- Inserindo  departamentos
INSERT INTO departamentos (id_departamento, nome_departamento) VALUES
(1, 'Recursos Humanos'),
(2, 'Tecnologia da Informação'),
(3, 'Inovação'); -- este não terá funcionários

-- Inserindo  funcionários 
INSERT INTO funcionarios (id_funcionario, nome_funcionario, cargo, id_departamento) VALUES
(1, 'Ana Souza', 'Analista de RH', 1),
(2, 'Pedro Lima', 'Coordenador de RH', 1),
(3, 'João Santos', 'Desenvolvedor Back-End', 2),
(4, 'Maria Oliveira', 'Desenvolvedora Front-End', 2),
(5, 'Lucas Pereira', 'Suporte Técnico', 2),
(6, 'Fernanda Costa', 'Gestora de Projetos', 1);
SELECT 
    d.nome_departamento AS Departamento,
    f.nome_funcionario AS Funcionario,
    f.cargo AS Cargo
FROM 
    departamentos d
LEFT JOIN 
    funcionarios f
ON 
    d.id_departamento = f.id_departamento
ORDER BY 
    d.nome_departamento;
ALTER TABLE funcionarios ADD COLUMN salario DECIMAL(10,2);
UPDATE funcionarios SET salario = 2500.00 WHERE id_funcionario = 1; -- Ana Souza
UPDATE funcionarios SET salario = 4200.00 WHERE id_funcionario = 2; -- Pedro Lima
UPDATE funcionarios SET salario = 6000.00 WHERE id_funcionario = 3; -- João Santos
UPDATE funcionarios SET salario = 4800.00 WHERE id_funcionario = 4; -- Maria Oliveira
UPDATE funcionarios SET salario = 3200.00 WHERE id_funcionario = 5; -- Lucas Pereira
UPDATE funcionarios SET salario = 7000.00 WHERE id_funcionario = 6; -- Fernanda Costa
SELECT
    nome_funcionario AS Funcionario,
    salario AS Salario,
    CASE
        WHEN salario < 3000 THEN 'Junior'
        WHEN salario BETWEEN 3000 AND 5000 THEN 'Pleno'
        WHEN salario > 5000 THEN 'Senior'
    END AS Nivel_Salarial
FROM
    funcionarios
ORDER BY
    salario ASC;
INSERT INTO departamentos (id_departamento, nome_departamento)
VALUES (4, 'Vendas');
INSERT INTO funcionarios (id_funcionario, nome_funcionario, cargo, id_departamento, salario)
VALUES
(7, 'Carla Mendes', 'Executiva de Contas', 4, 3800.00),
(8, 'Bruno Almeida', 'Consultor Comercial', 4, 3100.00),
(9, 'Paula Nunes', 'Gerente de Vendas', 4, 6200.00);
SELECT
    f.nome_funcionario AS Funcionario,
    f.cargo AS Cargo,
    d.nome_departamento AS Departamento,
    f.salario AS Salario,
    CASE
        WHEN f.salario < 3000 THEN 'Junior'
        WHEN f.salario BETWEEN 3000 AND 5000 THEN 'Pleno'
        WHEN f.salario > 5000 THEN 'Senior'
    END AS Nivel_Salarial
FROM
    funcionarios f
INNER JOIN
    departamentos d ON f.id_departamento = d.id_departamento
WHERE
    d.nome_departamento = 'Vendas'
    AND (
        CASE
            WHEN f.salario < 3000 THEN 'Junior'
            WHEN f.salario BETWEEN 3000 AND 5000 THEN 'Pleno'
            WHEN f.salario > 5000 THEN 'Senior'
        END
    ) = 'Pleno';








