-- Criando a base de dados
CREATE DATABASE HotelSaintGermain;

-- DROP DATABASE HotelSaintGermain;

USE HotelSaintGermain;

CREATE TABLE Cliente(
    Id INT PRIMARY KEY,
    Nome VARCHAR(100),
    Sexo CHAR(1),
    DtaNasc DATE
);
COMMIT;

CREATE TABLE ClienteBrasileiro(
    ClienteId INT PRIMARY KEY,
    CPF NUMERIC(11) UNIQUE,
    RG NUMERIC(10) UNIQUE,
    Rua VARCHAR(100),
    Cidade VARCHAR(30),
    Estado VARCHAR(2),
    CEP VARCHAR(10)
);
COMMIT;

CREATE TABLE Telefone(
    ClienteId INT PRIMARY KEY,
    Numero NUMERIC(15)
);
COMMIT;

CREATE TABLE ClienteEstrangeiro(
    ClienteId INT PRIMARY KEY,
    Passaporte NUMERIC(20)
);
COMMIT;

CREATE TABLE Quarto(
    Numero INT PRIMARY KEY,
    Andar INT,
    Tipo VARCHAR(20),
    Descricao VARCHAR(500),
    VlrDiaria DECIMAL(10, 2)
);
COMMIT;

CREATE TABLE Reserva(
    Numero INT PRIMARY KEY,
    ClienteId INT,
    QuartoNumero INT,
    Entrada DATE,
    Periodo INT,
    FOREIGN KEY (ClienteId) REFERENCES Cliente(Id),
    FOREIGN KEY (QuartoNumero) REFERENCES Quarto(Numero)
);
COMMIT;

CREATE TABLE Ocupacao(
    ReservaNumero INT PRIMARY KEY,
    QuartoNumero INT,
    Entrada DATE,
    Saida DATE,
    FOREIGN KEY (ReservaNumero) REFERENCES Reserva(Numero),
    FOREIGN KEY (QuartoNumero) REFERENCES Quarto(Numero)
);
Commit;

CREATE TABLE Gerente(
	Matricula INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100)
);
COMMIT;

CREATE TABLE Aprovacao(
	ReservaNumero INT PRIMARY KEY,
    GerenteMatricula INT,
    DataHora DATETIME,
    FOREIGN KEY (ReservaNumero) REFERENCES Reserva(Numero),
    FOREIGN KEY (GerenteMatricula) REFERENCES Gerente(Matricula)
);
COMMIT;

CREATE TABLE Restaurante(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Prato VARCHAR(100) NOT NULL,
    Preco NUMERIC(6, 2)
);
COMMIT;

CREATE TABLE OcupacaoRestaurante(
	ReservaNumero INT,
    RestauranteId INT,
    DataHora DATETIME,
    Quantidade INT,
    PRIMARY KEY(ReservaNumero, RestauranteId, DataHora),
    FOREIGN KEY(ReservaNumero) REFERENCES Ocupacao(ReservaNumero),
	FOREIGN KEY(RestauranteId) REFERENCES Restaurante(Id)
);
COMMIT;

CREATE TABLE Frigobar(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Item VARCHAR(100) NOT NULL,
    Preco NUMERIC(6, 2)
);
COMMIT;

CREATE TABLE OcupacaoFrigobar(
	ReservaNumero INT,
    FrigobarId INT,
    DataHora DATETIME,
    Quantidade INT,
    PRIMARY KEY (ReservaNumero, FrigobarId, DataHora),
    FOREIGN KEY (ReservaNumero) REFERENCES Ocupacao(ReservaNumero),
    FOREIGN KEY (FrigobarId) REFERENCES Frigobar(Id)
);
COMMIT;

CREATE TABLE Massagem(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Tipo VARCHAR(100) NOT NULL,
    Preco NUMERIC(6, 2)
);
COMMIT;

CREATE TABLE OcupacaoMassagem(
	ReservaNumero INT,
    MassagemId INT,
    DataHora DATETIME,
    Quantidade INT,
    primary key(ReservaNumero, MassagemId, DataHora),
    FOREIGN KEY (ReservaNumero) REFERENCES Ocupacao(ReservaNumero),
    FOREIGN KEY (MassagemId) REFERENCES Massagem(Id)
);
COMMIT;

CREATE TABLE TipoPagamento(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Descricao VARCHAR(100)
);
COMMIT;

CREATE TABLE PagamentoOcupacao(
	ReservaNumero INT,
    TipoPagamentoId INT,
    DataHora DATETIME,
    ValorTotal DECIMAL(8 , 2),
    FOREIGN KEY (ReservaNumero) REFERENCES Ocupacao(ReservaNumero),
    FOREIGN KEY (TipoPagamentoId) REFERENCES  TipoPagamento(Id)
);
COMMIT;

INSERT INTO Cliente(Id, Nome, Sexo, DtaNasc) VALUES
(1, 'João Silva', 'M', '1980-01-01'),
(2, 'Maria Oliveira', 'F', '1990-02-02'),
(3, 'Carlos Pereira', 'M', '1985-03-03'),
(4, 'Ana Costa', 'F', '1992-04-04'),
(5, 'Fernanda Lima', 'F', '1995-05-05'),
(6, 'Roberto Costa', 'M', '1988-06-15'),
(7, 'Juliana Almeida', 'F', '1993-07-20'),
(8, 'Eduardo Oliveira', 'M', '1991-12-30'),
(9, 'Patrícia Santos', 'F', '1990-11-10'),
(10, 'Ricardo Silva', 'M', '1982-05-25');
COMMIT;

INSERT INTO ClienteBrasileiro(ClienteId, CPF, RG, Rua, Cidade, Estado, CEP) VALUES
(1, '12345678901', '123456789', 'Rua A, 123', 'Curitiba', 'PR', '80000-000'),
(2, '98765432100', '987654321', 'Rua B, 456', 'Curitiba', 'PR', '80001-000'),
(3, '11122334455', '111223344', 'Rua C, 789', 'São Paulo', 'SP', '01000-000'),
(6, '22233344455', '555666777', 'Rua D, 101', 'Curitiba', 'PR', '80002-000'),
(7, '33344455566', '888999000', 'Rua E, 202', 'São Paulo', 'SP', '01001-000'),
(8, '44455566677', '112233445', 'Rua F, 303', 'Rio de Janeiro', 'RJ', '20002-000');
COMMIT;

INSERT INTO ClienteEstrangeiro(ClienteId, Passaporte) VALUES
(9, '98765432123456789012'),
(10, '12345678909876543210');
COMMIT;

INSERT INTO Quarto(Numero, Andar, Tipo, Descricao, VlrDiaria) VALUES
(101, 1, 'Simples', 'Quarto para uma pessoa', 120.00),
(102, 1, 'Duplo', 'Quarto para duas pessoas', 150.00),
(201, 2, 'Luxo', 'Quarto de luxo', 200.00),
(202, 2, 'Suite', 'Suite com vista', 250.00),
(401, 4, 'Presidencial', 'Suite presidencial', 500.00);
COMMIT;

INSERT INTO Reserva(Numero, ClienteId, QuartoNumero, Entrada, Periodo) VALUES
(1, 1, 101, '2020-01-15', 3),
(2, 2, 102, '2025-02-20', 2),
(4, 3, 202, '2018-01-25', 4),
(5, 6, 401, '2025-04-05', 1),
(6, 7, 102, '2025-08-20', 4),
(7, 9, 101, '2020-11-15', 3);
COMMIT;

INSERT INTO Gerente(Nome) VALUES
('Gabriel Menezes'),
('Matheus Henrique'),
('José Santos');
COMMIT;

INSERT INTO Aprovacao(ReservaNumero, GerenteMatricula, DataHora) VALUES
(1, 2, '2020-01-15 10:00:23'),
(2, 3, '2025-02-20 12:30:15'),
(4, 1, '2018-01-25 09:45:54'),
(6, 3, '2025-08-20 07:25:21'),
(7, 2, '2020-11-15 10:27:07'),
(5, 3, '2025-04-05 16:00:04');
COMMIT;

INSERT INTO Ocupacao(ReservaNumero, QuartoNumero, Entrada, Saida) VALUES
(1, 101, '2020-01-16', '2020-01-19'),
(2, 102, '2025-02-21', '2025-02-23'),
(4, 202, '2018-01-26', '2018-01-30'),
(6, 102, '2025-08-20', '2025-08-24'),
(7, 101, '2020-11-15', '2020-11-19'),
(5, 401, '2025-04-06', '2025-04-07');
Commit;

INSERT INTO Restaurante(Prato, Preco) VALUES
('Feijoada', 35.50),
('Pizza', 45.00),
('Bife', 60.00),
('Salada', 25.00),
('Espaguete', 40.00);
COMMIT;

INSERT INTO OcupacaoRestaurante (ReservaNumero, RestauranteId, DataHora, Quantidade) VALUES
(1, 1, '2025-01-16 19:10:00', 2),
(1, 3, '2025-01-16 20:06:00', 1),
(4, 5, '2025-01-27 13:30:00', 2),
(6, 4, '2025-08-20 19:50:00', 2);
COMMIT;

INSERT INTO Frigobar(Item, Preco) VALUES
('Cerveja', 8.50),
('Água', 5.00),
('Refrigerante', 7.00),
('Suco', 10.00),
('Vinho', 45.00);
COMMIT;

INSERT INTO OcupacaoFrigobar(ReservaNumero, FrigobarId, DataHora, Quantidade) VALUES
(1, 1, '2025-01-16 18:05:00', 2),
(1, 3, '2025-01-16 19:30:00', 1),
(2, 2, '2025-02-21 21:22:00', 3),
(4, 5, '2025-01-27 14:30:00', 2),
(7, 5, '2020-11-15 20:00:00', 1);
COMMIT;

INSERT INTO Massagem (Tipo, Preco) VALUES
('Relaxante', 120.00),
('Descontracturante', 150.00),
('Aromaterapia', 180.00),
('Esfoliante', 100.00),
('Reflexologia', 110.00);
COMMIT;

INSERT INTO OcupacaoMassagem(ReservaNumero, MassagemId, DataHora, Quantidade) VALUES
(1, 1, '2025-01-17 09:30:00', 1),
(2, 2, '2025-02-22 14:20:00', 1),
(4, 4, '2025-01-28 16:30:00', 1),
(5, 5, '2025-04-06 11:03:00', 1);
COMMIT;

INSERT INTO TipoPagamento(Descricao) VALUES
('Crédito'),
('Dinheiro'),
('Pix');
COMMIT;

INSERT INTO PagamentoOcupacao(ReservaNumero, TipoPagamentoId, DataHora, ValorTotal) VALUES
(1, 1, '2025-01-16 21:07:00', 480.00),
(2, 3, '2025-02-21 22:20:00', 450.00),
(4, 2, '2025-01-27 18:23:00', 600.00),
(5, 3, '2025-04-06 19:02:00', 500.00),
(6, 1, '2025-08-21 22:00:00', 800.00),
(7, 2, '2020-11-16 20:30:00', 550.00);
COMMIT;

-- Aplicando um acréscimo de 15% nas diárias dos quartos acima do 3º andar
UPDATE Quarto
SET VlrDiaria = VlrDiaria * 1.15
WHERE Andar > 3;

-- Diminuindo para 40% o valor das diárias dos quartos que já não são mais ocupados há 2 anos
UPDATE Quarto
SET VlrDiaria = VlrDiaria * 0.60
WHERE Numero NOT IN (
    SELECT DISTINCT QuartoNumero
    FROM Ocupacao
    WHERE Saida >= CURDATE() - INTERVAL 2 YEAR
);

-- Listando o nome e sexo de todos os clientes por ordem alfabética
SELECT Nome, Sexo 
FROM Cliente 
ORDER BY Nome ASC;

-- Listar o número de todos os quartos por ordem decrescente de andar e crescente de valor da diária
SELECT VlrDiaria, Andar
FROM Quarto 
ORDER BY Andar DESC, VlrDiaria ASC;

-- Listando o número de todos os quartos com valor da diária entre R$ 100 e R$ 150
SELECT Numero
FROM Quarto
WHERE VlrDiaria BETWEEN 100 AND 150;

-- Listando o cpf e o cep de todos os clientes brasileiros residentes em “Curitiba”
SELECT CPF, CEP
FROM ClienteBrasileiro
Where Cidade = 'Curitiba';

-- Listando todas as reservas de um determinado cliente (qualquer código válido)
SELECT Numero AS ReservaNumero, 
       ClienteId, 
       QuartoNumero, 
       Entrada, 
       Periodo 
FROM Reserva 
WHERE ClienteId = (SELECT Id FROM Cliente WHERE Nome = 'João Silva');

-- Listando, sem repetir, os números dos quartos que já foram ocupados algum dia
SELECT DISTINCT QuartoNumero
FROM Ocupacao;

-- Listando, sem repetir, o número das reservas que tiveram algum tipo de aprovação pelo gerente
SELECT DISTINCT ReservaNumero
FROM Aprovacao;

-- Listando, sem repetir, o número das reservas que fizeram uso do restaurante
SELECT DISTINCT ReservaNumero
FROM OcupacaoRestaurante;

-- Listando, sem repetir, as reservas que foram pagas em dinheiro
SELECT ReservaNumero
FROM PagamentoOcupacao
WHERE TipoPagamentoId = 2; 

-- Listar, em ordem alfabética, o nome de todos os clientes e a data de entrada de suas reservas
SELECT C.Nome, R.Entrada 
FROM Cliente C 
INNER JOIN Reserva R
ON C.Id = R.ClienteId
ORDER BY C.Nome ASC;

-- Listando o nome e o cpf de todos os clientes brasileiros
SELECT C.Nome, CB.CPF
FROM Cliente C 
INNER JOIN ClienteBrasileiro CB
ON C.Id = CB.ClienteId;

-- Listando o nome e o passaporte de todos os clientes estrangeiros
SELECT C.Nome, CE.Passaporte
FROM Cliente C 
INNER JOIN ClienteEstrangeiro CE
ON C.Id = CE.ClienteId;

-- Listando o número da reserva e o nome do gerente de todas as reservas aprovadas
SELECT A.ReservaNumero, G.Nome
FROM Aprovacao A 
INNER JOIN Gerente G 
ON A.GerenteMatricula = G.Matricula
ORDER BY A.ReservaNumero;

-- Listando o número da reserva, a descrição e o valor dos pratos consumidos por todas as ocupações
SELECT ORE.ReservaNumero, RE.Prato, RE.Preco AS Valor
FROM OcupacaoRestaurante ORE 
INNER JOIN Restaurante RE 
ON ORE.RestauranteId = RE.Id
ORDER BY ORE.ReservaNumero, RE.Prato;

-- Listando o nome do cliente e o tipo de pagamento de todas as ocupações pagas
SELECT C.Nome, TP.Descricao
FROM Cliente C
INNER JOIN Reserva R 
ON C.Id = R.ClienteId
INNER JOIN Ocupacao O 
ON R.Numero = O.ReservaNumero
INNER JOIN PagamentoOcupacao PO 
ON O.ReservaNumero = PO.ReservaNumero
INNER JOIN TipoPagamento TP 
ON PO.TipoPagamentoId = TP.Id;

-- Listando o nome do cliente e os produtos utilizados nas massagens dos clientes que ficaram hospedados no último ano
SELECT C.Nome, M.Tipo AS Produto
FROM Cliente C
INNER JOIN Reserva R
ON C.Id = R.ClienteId
INNER JOIN Ocupacao O 
ON R.Numero = O.ReservaNumero
INNER JOIN OcupacaoMassagem OM
ON O.ReservaNumero = OM.ReservaNumero
INNER JOIN Massagem M
ON OM.MassagemId = M.Id
WHERE O.Entrada >= CURDATE() - INTERVAL 1 YEAR;

-- Listando o nome do cliente, a data de nascimento e o andar do quarto em que ficaram hospedados os clientes nos últimos três meses
SELECT C.Nome, C.DtaNasc, Q.Andar
FROM Cliente C
INNER JOIN Reserva R
ON C.Id = R.ClienteId
INNER JOIN Quarto Q 
ON R.QuartoNumero = Q.Numero
WHERE R.Entrada >= CURDATE() - INTERVAL 3 MONTH;

-- Listando o estado, o nome da cidade e o nome do cliente, para os clientes que se hospedaram nos últimos cinco anos
SELECT CB.Estado, CB.Cidade, C.Nome
FROM Cliente C
LEFT JOIN ClienteBrasileiro CB
ON C.Id = CB.ClienteId
LEFT JOIN ClienteEstrangeiro CE
ON C.ID = CE.ClienteId
INNER JOIN Reserva R
ON C.Id = R.ClienteId
WHERE R.Entrada >= CURDATE() - INTERVAL 5 YEAR;