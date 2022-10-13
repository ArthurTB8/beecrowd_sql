select name 
from customers 
where id IN (select id_customers from legal_person)
