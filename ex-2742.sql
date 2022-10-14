select l.name, round((l.omega * 1.618), 3) as "Fator N" 
from life_registry l join dimensions d on 
l.dimensions_id = d.id 
where d.name in ('C875', 'C774') and l.name LIKE 'Richard%'
order by l.omega asc
