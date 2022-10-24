select
d.nome as Departamento,
div.nome AS Divisao,
round(avg(tsalario.salario - tdescontos.descontos), 2) as media,
round(max(tsalario.salario - tdescontos.descontos), 2) as maior
from
departamento d
INNER JOIN divisao div on d.cod_dep = div.cod_dep
INNER JOIN empregado emp on div.cod_divisao = emp.lotacao_div
INNER JOIN (SELECT
emp.matr,
COALESCE(SUM(v.valor), 0) as salario
from
empregado emp
left join emp_venc on emp.matr = emp_venc.matr
left join vencimento v on emp_venc.cod_venc = v.cod_venc
group by
emp.matr
) as tsalario on emp.matr = tsalario.matr
inner join (select
emp.matr,
coelesce(sum(desconto.valor), 0) as descontos
from
empregado emp
left join emp_desc on emp.matr = emp_desc.matr
left join desconto on emp_desc.cod_desc = desconto.cod_desc
group by
emp.matr
) as tdescontos on emp.matr = tdescontos.matr
group by
div.cod_divisao,
div.nome,
d.nome
order by
avg (tsalario.salario - tdescontos.descontos) DESC
