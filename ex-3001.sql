select p.name,
case
    when p.type = 'a' then 20.0
    when p.type = 'b' then 70.0
    else 530.5
end as price
from products p
order by p.type asc, p.id desc;
