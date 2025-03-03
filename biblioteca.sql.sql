----------------------------------------------------
-- Criando a base.
CREATE DATABASE BibliotecaPublica;

-- DROP DATABASE BibliotecaPublica;

USE BibliotecaPublica;

CREATE TABLE Categoria(
    Id INT PRIMARY KEY,
    Genero VARCHAR(50),  
    Descricao VARCHAR(255) 
);
COMMIT;

CREATE TABLE Autor(
    Id INT PRIMARY KEY,
    Nome VARCHAR(100),
    Sexo CHAR(1) CHECK (Sexo IN ('M', 'F')),
    Idade NUMERIC(3),
    DtaNasc DATE
);
COMMIT;

CREATE TABLE Livro(
    Id INT PRIMARY KEY,
    DtaPublicacao DATE,
    Titulo VARCHAR(50),
    Exemplares NUMERIC(20),
    Idioma VARCHAR(20),
    FaixaEtaria VARCHAR(5),
    AutorId INT,
    Categoria INT,
    FOREIGN KEY (AutorId) REFERENCES Autor(Id),
    FOREIGN KEY (Categoria) REFERENCES Categoria(Id)
);
COMMIT;

CREATE TABLE Membro(
    Id INT PRIMARY KEY,
    Nome VARCHAR(100),
    Endereco VARCHAR(50),
    Idade NUMERIC(3),
    Telefone NUMERIC(15)
);
COMMIT;

CREATE TABLE Emprestimo(
    Id INT AUTO_INCREMENT PRIMARY KEY,
    DtaEmprestimo DATE,
    DtaDEvolucao DATE,
    MembroId INT,
    LivroId INT,
    FOREIGN KEY (LivroId) REFERENCES Livro(Id),
    FOREIGN KEY (MembroId) REFERENCES Membro(Id)
);
COMMIT;

INSERT INTO Categoria (Id, Genero, Descricao) VALUES
(1, 'Ficção', 'Livros que exploram histórias imaginárias e criativas, incluindo fantasia, mistério, terror, ficção infantil, juvenil, e outros gêneros de ficção.'),
(2, 'Drama', 'Livros que focam em temas emocionais, sociais e interpessoais, com enredos que abordam conflitos humanos, dilemas existenciais e relações pessoais.'),
(3, 'Ciência', 'Livros que exploram temas científicos, tecnológicos e filosóficos, com foco em conceitos, descobertas, e avanços nas diversas áreas do conhecimento.'),
(4, 'Romance', 'Livros que abordam temas de amor, relações interpessoais e dramáticas, com foco em histórias de paixão, superação e sentimentos humanos.'),
(5, 'Mistério e Suspense', 'Livros que envolvem mistérios a serem resolvidos, geralmente com investigações, crimes, enigmas e tensão crescente.'),
(6, 'Fantasia', 'Livros que apresentam mundos imaginários, criaturas fantásticas e aventuras mágicas, com enredos que exploram a luta entre o bem e o mal, ou a descoberta de um novo poder.'),
(7, 'Terror', 'Livros que buscam causar medo, desconforto e tensão psicológica, explorando o sobrenatural, o macabro e o horror psicológico.'),
(8, 'Biografia', 'Livros que narram a vida de figuras históricas, celebridades ou pessoas que marcaram a história, geralmente com foco em eventos e aspectos pessoais.'),
(9, 'Clássicos Literários', 'Livros considerados fundamentais na literatura mundial, com temas atemporais e profundos sobre a condição humana, ética e sociedade.'),
(10, 'História', 'Livros que abordam acontecimentos históricos, movimentos sociais, e análises profundas de culturas, filosofias e outros aspectos humanos.');

INSERT INTO Autor (Id, Nome, Sexo, Idade, DtaNasc) VALUES
(1, 'J.K. Rowling', 'F', 58, '1965-07-31'),
(2, 'Isaac Asimov', 'M', 72, '1920-01-02'),
(3, 'Gabriel García Márquez', 'M', 87, '1927-03-06'),
(4, 'Clarice Lispector', 'F', 92, '1920-12-10'),
(5, 'George R.R. Martin', 'M', 75, '1948-09-20'),
(6, 'Marina Abramović', 'F', 77, '1946-11-30'),
(7, 'Zélia Gattai', 'F', 88, '1930-07-26'),
(8, 'J.R.R. Tolkien', 'M', 81, '1892-01-03'),
(9, 'Margaret Atwood', 'F', 84, '1939-11-18'),
(10, 'Haruki Murakami', 'M', 75, '1949-01-12'),
(11, 'Jane Austen', 'F', 218, '1775-12-16'),
(12, 'Stephen King', 'M', 76, '1947-09-21'),
(13, 'Albert Einstein', 'M', 76, '1879-03-14'),
(14, 'Carlos Silva', 'M', 40, '1984-05-12'),
(15, 'Winston Churchill', 'M', 90, '1874-11-30'),
(16, 'Otto Frank', 'M', 91, '1889-05-12');
COMMIT;

INSERT INTO Livro (Id, DtaPublicacao, Titulo, Exemplares, Idioma, FaixaEtaria, AutorId, Categoria) VALUES
(1, '1997-06-26', 'Harry Potter e a Pedra Filosofal', 10, 'Português', '0-5', 1, 1),  
(2, '1951-01-01', 'Fundação', 5, 'Inglês', '13-18', 2, 1),  
(3, '1985-11-06', 'Cem Anos de Solidão', 3, 'Português', '18+', 3, 2),  
(4, '2000-10-22', 'O Sol é Para Todos', 7, 'Português', '18+', 4, 2), 
(5, '2011-07-12', 'O Jogo dos Tronos', 12, 'Inglês', '12-18', 5, 1), 
(6, '2014-02-13', 'Me Chame Pelo Seu Nome', 8, 'Português', '18+', 6, 2),  
(7, '1990-09-05', 'Memórias de uma Gueixa', 6, 'Inglês', '18+', 7, 5),  
(8, '1954-07-29', 'O Senhor dos Anéis: A Sociedade do Anel', 15, 'Inglês', '12-18', 8, 6),
(9, '2003-08-10', 'O Senhor dos Anéis: O Retorno do Rei', 10, 'Inglês', '12-18', 8, 6),  
(10, '2010-09-01', 'O Conto da Aia', 5, 'Inglês', '18+', 9, 5), 
(11, '2007-10-12', '1Q84', 9, 'Inglês', '18+', 10, 4),  
(12, '1813-01-28', 'Orgulho e Preconceito', 11, 'Inglês', '18+', 11, 2),  
(13, '1986-03-01', 'It - A Coisa', 7, 'Inglês', '18+', 12, 7),  
(14, '1973-04-10', 'Carrie, a Estranha', 13, 'Inglês', '18+', 12, 7),  
(15, '2001-05-29', 'Harry Potter e a Câmara Secreta', 10, 'Português', '0-5', 1, 1),  
(16, '2015-05-15', 'Os Homens que Não Amavam as Mulheres', 6, 'Sueco', '18+', 9, 5),  
(17, '1916-01-01', 'Relatividade: A Teoria Especial e a Teoria Geral', 3, 'Alemão', '18+', 13, 3),  
(18, '2024-10-15', 'O Sistema Solar', 5, 'Português', '12-18', 14, 3),
(19, '1925-04-10', 'O Grande Gatsby', 10, 'Inglês', '18+', 14, 9),
(20, '1998-11-23', 'O Diário de Anne Frank', 12, 'Português', '12-18', 16, 8),
(21, '1948-01-01', 'A Segunda Guerra Mundial', 8, 'Português', '18+', 15, 10);
COMMIT;

INSERT INTO Membro (Id, Nome, Endereco, Idade, Telefone) VALUES
(1, 'Ana Souza', 'Rua A, 123', 30, 12345678901),
(2, 'Carlos Silva', 'Avenida B, 456', 45, 98765432100),
(3, 'Juliana Oliveira', 'Rua C, 789', 27, 11223344556),
(4, 'Roberto Lima', 'Rua D, 101', 37, 55667788990),
(5, 'Maria Costa', 'Avenida E, 202', 62, 99887766544),
(6, 'Lucas Pereira', 'Rua F, 303', 22, 33445566778),
(7, 'Fernanda Santos', 'Avenida G, 404', 53, 77889966553),
(8, 'Pedro Almeida', 'Rua H, 505', 29, 22334455667);
COMMIT;

INSERT INTO Emprestimo (DtaEmprestimo, DtaDevolucao, MembroId, LivroId) VALUES
('2019-04-15', '2019-04-22', 1, 1),
('2020-03-10', '2020-03-17', 1, 3), 
('2021-06-05', '2021-06-12', 2, 5), 
('2022-01-22', '2022-01-29', 3, 10), 
('2022-11-15', '2022-11-22', 4, 8), 
('2023-04-12', '2023-04-19', 5, 12),
('2023-07-02', '2023-07-09', 6, 7), 
('2025-02-20', '2025-02-27', 7, 13),
('2025-11-01', '2025-11-05', 1, 16), 
('2023-09-10', '2023-09-17', 2, 14),
('2022-03-15', '2022-03-22', 3, 11);
COMMIT;

----------------------------------------------------
-- Listando todos os autores cujo nome inicia com a letra ‘A’
SELECT Nome
FROM Autor
WHERE Nome LIKE 'A%';

----------------------------------------------------
-- Listando todos os livros cujo título contenha a palavra ‘sistema’
SELECT Titulo 
FROM Livro
WHERE Titulo LIKE '%Sistema%';

----------------------------------------------------
-- Listando a chave primária e o título dos livros que foram publicados há mais de 5 anos
SELECT Id, DtaPublicacao
FROM Livro
WHERE DtaPublicacao < CURDATE() - INTERVAL 5 YEAR;

----------------------------------------------------
-- Listando, em ordem alfabética por título, os livros que possuem menos de 5 exemplares disponíveis
SELECT Titulo, Exemplares
FROM Livro
WHERE Exemplares < 5
ORDER BY Titulo ASC;

----------------------------------------------------
-- Listando todos os livros que nunca foram emprestados
SELECT Titulo
FROM Livro
WHERE Id NOT IN (SELECT LivroId FROM Emprestimo);

----------------------------------------------------
-- Mudando a data de devolução real de todos os empréstimos para a data atual
UPDATE Emprestimo
SET DtaDevolucao = CURDATE();

----------------------------------------------------
-- Excluindo todos os membros que nunca fizeram empréstimo
DELETE FROM Membro
WHERE Id NOT IN (SELECT DISTINCT MembroId FROM Emprestimo);

----------------------------------------------------
-- Listando o título do livro e o nome do autor para todos os livros cadastrados na base
SELECT L.Titulo, A.Nome
FROM Livro L
INNER JOIN Autor A
ON L.AutorId = A.Id;

----------------------------------------------------
-- Listando a data de empréstimo, o nome do membro que emprestou, e o título do livro de todos os empréstimos feitos neste ano
SELECT E.DtaEmprestimo, M.Nome, L.Titulo
FROM Membro M
INNER JOIN Emprestimo E 
ON E.MembroId = M.Id 
INNER JOIN Livro L 
ON E.LivroId = L.Id
WHERE E.DtaEmprestimo >= CURDATE() - INTERVAL 1 YEAR;

----------------------------------------------------
-- Listando o nome da categoria e o título do livro de todos os livros cadastrados na base
SELECT C.Genero, L.Titulo
FROM Livro L
INNER JOIN Categoria C
ON L.Categoria = C.Id;

----------------------------------------------------
-- Listando o título do livro, a data de empréstimo e a data da devolução real de todos os livros da base
SELECT L.Titulo, E.DtaEmprestimo, E.DtaDevolucao
FROM Livro L
INNER JOIN Emprestimo E
ON L.Id = E.LivroId;

----------------------------------------------------
-- Listando a data de empréstimo, data da devolução real, nome do membro que emprestou, título do livro, nome da categoria e nome do autor (ou autores) de todos os empréstimos realizados
SELECT DtaEmprestimo, DtaDevolucao, M.Nome, L.Titulo, C.Genero, A.Nome
FROM Emprestimo E
INNER JOIN Membro M 
ON E.MembroId = M.Id
INNER JOIN Livro L 
ON E.LivroId = L.Id
INNER JOIN Categoria C 
ON L.Categoria = C.Id
INNER JOIN Autor A 
ON L.AutorId = A.Id;

----------------------------------------------------
-- Contando quantos livros estão cadastrados na base
SELECT COUNT(Id) AS ContagemdeLivros
FROM Livro;

----------------------------------------------------
-- Contando quantos empréstimos foram feitos no ano passado
SELECT COUNT(Id) AS ContagemdeEmprestimos
FROM Emprestimo
WHERE YEAR(DtaEmprestimo) = YEAR(CURDATE()) - 1;

----------------------------------------------------
-- Listando o nome da categoria e a quantidade de livros por categoria
SELECT C.Genero, COUNT(L.Id)
FROM Categoria C 
INNER JOIN Livro L 
ON C.Id = L.Categoria
GROUP BY C.Id;

----------------------------------------------------
-- Listando o título do livro e o nome do membro de todos os livros emprestados na semana corrente, agrupados e ordenados por data de empréstimo
SELECT L.Titulo, M.Nome
FROM Emprestimo E
INNER JOIN Membro M 
ON E.MembroId = M.Id
INNER JOIN Livro L 
ON E.LivroId = L.Id
WHERE E.DtaEmprestimo >= CURDATE() - INTERVAL 7 DAY 
ORDER BY E.DtaEmprestimo;

----------------------------------------------------
-- Listando o total de livros emprestados no ano atual, agrupados e ordenados cronologicamente por mês, sendo que o nome do mês deve ser apresentado por extenso
SELECT MONTHNAME(E.DtaEmprestimo) AS Mes, 
COUNT(E.LivroId) AS TotalLivrosEmprestados
FROM Emprestimo E
WHERE YEAR(E.DtaEmprestimo) = YEAR(CURDATE())  
GROUP BY MONTH(E.DtaEmprestimo),
MONTHNAME(E.DtaEmprestimo)
ORDER BY MONTH(E.DtaEmprestimo);
