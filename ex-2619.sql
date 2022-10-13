select products.name, providers.name, products.price
from products, providers, categories
where products.id_providers = providers.id
and products.id_categories = categories.id
and categories.name LIKE 'Super Luxury' 
and price > 1000;
