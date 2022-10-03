-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)
SELECT 
	p.id,
	p.status,
	p.cliente_id,
	p2.nome,
	p2.tipo,
	p2.preço,
	p2.pts_de_lealdade 
FROM 
	pedidos p
JOIN 
	produtos_pedidos pp ON p.id = pp.pedido_id
JOIN 
	produtos p2 ON p2.id = pp.produto_id ;

-- 2)
SELECT 
	p.id 
FROM 
	pedidos p 
JOIN
	produtos_pedidos pp ON p.id = pp.pedido_id
JOIN 
	produtos p2 ON p2.id = pp.produto_id 
WHERE 
	p2.nome = 'Fritas';

-- 3)
SELECT 
	c.nome gostam_de_fritas
FROM 
	pedidos p
JOIN
	clientes c ON c.id = p.cliente_id
JOIN
	produtos_pedidos pp ON p.id = pp.pedido_id
JOIN 
	produtos p2 ON p2.id = pp.produto_id 
WHERE 
	p2.nome = 'Fritas';

-- 4)
SELECT 
	SUM(p2.preço)
FROM 
	pedidos p 
JOIN
	clientes c ON c.id = p.cliente_id
JOIN 
	produtos_pedidos pp ON pp.pedido_id = p.id
JOIN 
	produtos p2 ON p2.id = pp.produto_id
WHERE c.nome = 'Laura';

-- 5)
SELECT 
	p.nome, COUNT(*) 
FROM 
	produtos p 
JOIN
	produtos_pedidos pp ON pp.produto_id = p.id
GROUP BY 
	p.nome
ORDER BY 
	p.nome;