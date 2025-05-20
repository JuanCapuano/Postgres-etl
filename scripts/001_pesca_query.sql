\c postgres

/* --- CONSULTAS PERSONALIZADAS --- */

-- Ejemplo: Total de captura por provincia

SELECT
  p.nombre AS provincia,
  SUM(pe.captura) AS total_captura
FROM public.pesca pe
JOIN public.departamento d ON pe.departamento_id = d.id
JOIN public.provincia p ON d.provincia_id = p.id
GROUP BY p.nombre
ORDER BY total_captura DESC;

-- Ejemplo: Top 3 de especies más capturadas a nivel nacional

SELECT
  pe.especie,
  SUM(pe.captura) AS total_captura
FROM public.pesca pe
GROUP BY pe.especie
ORDER BY total_captura DESC
LIMIT 3;


-- Ejemplo: Cantidad de especies distintas capturadas 
-- por provincia y departamento

SELECT
  p.nombre AS provincia,
  d.nombre AS departamento,
  COUNT(DISTINCT pe.especie) AS cantidad_especies
FROM pesca pe
JOIN departamento d ON pe.departamento_id = d.id
JOIN provincia p ON d.provincia_id = p.id
GROUP BY p.nombre, d.nombre
ORDER BY cantidad_especies DESC;




