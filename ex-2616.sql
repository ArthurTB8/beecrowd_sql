select customers.id, customers.name from 
customers where customers.id
NOT IN (select locations.id_customers from locations);
