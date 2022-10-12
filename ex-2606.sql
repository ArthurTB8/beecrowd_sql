select prd.id, prd.name
from products prd 
join categories ctg on prd.id_categories = ctg.id
where ctg ."name" like 'super%';
