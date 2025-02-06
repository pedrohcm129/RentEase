-- Inserção de Dados
INSERT INTO Usuario (nome, email, senha, telefone, data_aniversario) VALUES
('João Silva', 'joao@email.com', 'senha123', '11999999999', '1985-06-15'),
('Maria Souza', 'maria@email.com', 'senha456', '21988888888', '1990-09-21');

INSERT INTO Endereco (logradouro, numero, bairro, cidade, estado, cep, usuario_id) VALUES
('Rua A', '123', 'Centro', 'São Paulo', 'SP', '01000-000', 1),
('Rua B', '456', 'Zona Sul', 'Rio de Janeiro', 'RJ', '22000-000', 2),
('Avenida C', '789', 'Bela Vista', 'Curitiba', 'PR', '80000-000', NULL),
('Rua D', '101', 'Boa Viagem', 'Recife', 'PE', '50000-000', NULL);

INSERT INTO Inquilino (usuario_id, cpf, identidade) VALUES
(1, '111.111.111-11', 'MG1234567');

INSERT INTO Proprietario (usuario_id, cpf, identidade) VALUES
(2, '222.222.222-22', 'RJ7654321');

INSERT INTO Imovel (proprietario_id, endereco_id) VALUES
(2, 2),
(2, 3),
(2, 4);

INSERT INTO Contrato (inquilino_id, imovel_id, documento, data_inicio, data_fim) VALUES
(1, 1, 'Contrato de aluguel', '2024-01-01', '2025-01-01');

INSERT INTO Disponibiliza (proprietario_id, imovel_id) VALUES
(2, 1),
(2, 2),
(2, 3);