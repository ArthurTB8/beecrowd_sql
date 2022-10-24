select
    amount as most_frequent_value
from
    value_table
group by
    amount
order by
    (count(amount)) desc
limit 1
