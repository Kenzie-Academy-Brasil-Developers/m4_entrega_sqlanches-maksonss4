-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)
INSERT INTO	clientes 
	(nome, lealdade)
VALUES
	('Georgia', 0);

-- 2)
INSERT INTO pedidos 
	(status, cliente_id)
VALUES 
	('Recebido', 6);

-- 3)
INSERT INTO produtos_pedidos 
	(pedido_id, produto_id)
VALUES 
	(6, 1),
	(6, 2),
	(6, 6),
	(6, 8),
	(6, 8);

-- Leitura

-- 1)
SELECT 
	c.id,
	c.nome,
	c.lealdade,
	p.status,
	p.cliente_id,
	p2.id,
	p2.nome,
	p2.tipo,
	p2.preço,
	p2.pts_de_lealdade 
FROM 
	clientes c 
JOIN 
	pedidos p ON p.cliente_id = c.id 
JOIN 
	produtos_pedidos pp ON pp.pedido_id = p.id 
JOIN 
	produtos p2 ON p2.id = pp.produto_id 
WHERE 
	c.id = 6;

-- Atualização

-- 1)
UPDATE
	clientes 
SET lealdade = (SELECT 
					SUM(p2.pts_de_lealdade) 
				FROM 
					clientes c 
				JOIN 
					pedidos p ON p.cliente_id = c.id 
				JOIN 
					produtos_pedidos pp ON pp.pedido_id = p.id 
				JOIN 
					produtos p2 ON p2.id = pp.produto_id 
				WHERE 
					c.id = 6)
WHERE 
	clientes.id = 6;

-- Deleção

-- 1)
DELETE FROM 
	clientes c
WHERE c.id = 4;

