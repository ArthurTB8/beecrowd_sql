select
    d.name,
    sum(round(((150*a.hours)*(1+(w.bonus/100))), 1)) as salary
from
    attendances a
        inner join doctors d on a.id_doctor = d.id
        inner join work_shifts w on a.id_work_shift = w.id
group by
    d.name
order by
    salary desc
