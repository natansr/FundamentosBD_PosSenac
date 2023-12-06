-- Criação da tabela Autor
CREATE TABLE Autor (
    AutorID INT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    DataNascimento DATE,
    PaisOrigem VARCHAR(255)
);

-- Criação da tabela Editora
CREATE TABLE Editora (
    EditoraID INT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Endereco VARCHAR(255),
    Telefone VARCHAR(20)
);

-- Criação da tabela Livro
CREATE TABLE Livro (
    ISBN VARCHAR(13) PRIMARY KEY,
    Titulo VARCHAR(255) NOT NULL,
    AnoPublicacao INT,
    NumCopiasDisponiveis INT,
    Genero VARCHAR(50),
    AutorID INT,
    EditoraID INT,
    FOREIGN KEY (AutorID) REFERENCES Autor(AutorID),
    FOREIGN KEY (EditoraID) REFERENCES Editora(EditoraID)
);

-- Criação da tabela Bibliotecario
CREATE TABLE Bibliotecario (
    BibliotecarioID INT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Sobrenome VARCHAR(255),
    DataContratacao DATE,
    Telefone VARCHAR(20)
);

-- Criação da tabela Cliente (para representar pessoas que pegam emprestado)
CREATE TABLE Cliente (
    ClienteID INT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Telefone VARCHAR(20)
);

-- Criação da tabela Emprestimo
CREATE TABLE Emprestimo (
    EmprestimoID INT PRIMARY KEY,
    DataEmprestimo DATE,
    DataDevolucaoPrevista DATE,
    LivroISBN VARCHAR(13),
    BibliotecarioID INT,
    ClienteID INT,
    FOREIGN KEY (LivroISBN) REFERENCES Livro(ISBN),
    FOREIGN KEY (BibliotecarioID) REFERENCES Bibliotecario(BibliotecarioID),
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID)
);
