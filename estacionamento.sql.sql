-- Criando a base de dados
CREATE DATABASE SistemaEstacionamento;

-- DROP DATABASE SistemaEstacionamento;

USE SistemaEstacionamento;

CREATE TABLE Marca(
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) 
);
COMMIT;

CREATE TABLE Carro(
    Placa VARCHAR(7) PRIMARY KEY,
    Descricao VARCHAR(255),
    MarcaId INT, 
    FOREIGN KEY (MarcaId) REFERENCES Marca(Id)
);
COMMIT;

CREATE TABLE Permanencia(
    Id INT AUTO_INCREMENT PRIMARY KEY,
    CarroPlaca VARCHAR(7), 
    Entrada DATETIME,
    Saida DATETIME,
    ValorPago NUMERIC,
    FOREIGN KEY (CarroPlaca) REFERENCES Carro(Placa)
);
COMMIT;

INSERT INTO Marca (Id, Nome) VALUES
(1, 'FIAT'),
(2, 'Volkswagen');
COMMIT;

INSERT INTO Carro (Placa, MarcaId, Descricao) VALUES
('ABC1234', 1, 'Argo'),
('DEF5678', 1, 'Palio'),
('GHI4321', 2, 'Gol'),
('JKL9999', 2, 'Polo');
COMMIT;

INSERT INTO Permanencia (Id, CarroPlaca, Entrada, Saida, ValorPago) VALUES
(1, 'ABC1234', '2022-10-14 12:00', '2022-10-14 12:50', 11.00),
(2, 'DEF5678', '2022-10-14 09:00', '2022-10-14 10:00', 11.00),
(3, 'GHI4321', '2023-10-14 08:30', '2023-10-14 18:00', 20.00),
(4, 'GHI4321', '2023-10-16 08:40', '2023-10-16 18:15', 20.00),
(5, 'DEF5678', '2023-10-20 09:30', '2023-10-20 10:30', 12.00),
(6, 'ABC1234', '2023-11-20 12:10', '2023-11-20 13:00', 12.00);
COMMIT;

-- Alterando a placa do carro Polo de JKL9999 para JKL8765
UPDATE Carro
SET Placa = 'JKL8765'
WHERE Placa LIKE 'JKL9999';

-- Listando todos os dados de todos os carros cadastrados
SELECT Placa, Descricao
FROM Carro;

-- Listando a descricao e a placa de todos os carros, ordenando pela descricao
SELECT Descricao, Placa
FROM Carro
ORDER BY Descricao ASC;

-- Listando a marca, a descricao e a placa dos carros
SELECT C.Descricao, C.Placa, M.Nome
FROM Carro C
INNER JOIN Marca M
ON C.MarcaId = M.Id;

-- Listando a placa dos carros que não tiveram nenhuma permanencia
SELECT Placa
FROM Carro
WHERE Placa NOT IN (SELECT DISTINCT CarroPlaca FROM Permanencia);

-- Listando a descricao e a placa de cada carro, contando quantas vezes (quantas) o carro permaneceu
SELECT P.CarroPlaca, C.Descricao, COUNT(P.CarroPlaca) AS Permanencia
FROM Permanencia P
INNER JOIN Carro C
ON P.CarroPlaca = C.Placa
GROUP BY P.CarroPlaca, C.Descricao;