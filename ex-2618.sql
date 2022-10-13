select products.name, providers.name, categories.name
from products, providers, categories
where products.id_providers = providers.id 
and products.id_categories = categories.id 
and providers.name LIKE 'Sansul SA'
and categories.name LIKE 'Imported';
