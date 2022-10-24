select
	*
from
	(select
		dep.nome,	
		div.nome as divisao,
		round(avg(tsalario.salario - tdescontos.descontos), 2) as media
	from
		divisao div
			inner join empregado emp on div.cod_divisao = emp.lotacao_div
			inner join departamento dep on div.cod_dep = dep.cod_dep
			inner join (select
							emp.matr,
							coalesce(sum(v.valor), 0) as salario
						from
							empregado emp
								left join emp_venc on emp.matr = emp_venc.matr
								left join vencimento v on emp_venc.cod_venc = v.cod_venc
						group by
							emp.matr
						) as tsalario on emp.matr = tsalario.matr
			inner join (select
							emp.matr,
							coalesce(sum(desconto.valor), 0) as descontos
						from
							empregado emp
								left join emp_desc on emp.matr = emp_desc.matr
								left join desconto on emp_desc.cod_desc = desconto.cod_desc
						group by
							emp.matr
						) as tdescontos on emp.matr = tdescontos.matr
	where
		div.cod_dep = 1 and dep.cod_dep = 1
	group by
		div.cod_divisao, dep.nome, div.nome
	order by
		avg(tsalario.salario - tdescontos.descontos) desc
    limit 1) as t
union all
select
	*
from
	(select
		dep.nome,	
		div.nome as divisao,
		round(avg(tsalario.salario - tdescontos.descontos), 2) as media
	from
		divisao div
			inner join empregado emp on div.cod_divisao = emp.lotacao_div
			inner join departamento dep on div.cod_dep = dep.cod_dep
			inner join (select
							emp.matr,
							coalesce(sum(v.valor), 0) as salario
						from
							empregado emp
								left join emp_venc on emp.matr = emp_venc.matr
								left join vencimento v on emp_venc.cod_venc = v.cod_venc
						group by
							emp.matr
						) as tsalario on emp.matr = tsalario.matr
			inner join (select
							emp.matr,
							coalesce(sum(desconto.valor), 0) as descontos
						from
							empregado emp
								left join emp_desc on emp.matr = emp_desc.matr
								left join desconto on emp_desc.cod_desc = desconto.cod_desc
						group by
							emp.matr
						) as tdescontos on emp.matr = tdescontos.matr
	where
		div.cod_dep = 2 and dep.cod_dep = 2
	group by
		div.cod_divisao, dep.nome, div.nome
	order by
		avg(tsalario.salario - tdescontos.descontos) desc
    limit 1) as t
union all
select
	*
from
	(select
		dep.nome,	
		div.nome as divisao,
		round(avg(tsalario.salario - tdescontos.descontos), 2) as media
	from
		divisao div
			inner join empregado emp on div.cod_divisao = emp.lotacao_div
			inner join departamento dep on div.cod_dep = dep.cod_dep
			inner join (select
							emp.matr,
							coalesce(sum(v.valor), 0) as salario
						from
							empregado emp
								left join emp_venc on emp.matr = emp_venc.matr
								left join vencimento v on emp_venc.cod_venc = v.cod_venc
						group by
							emp.matr
						) as tsalario on emp.matr = tsalario.matr
			inner join (select
							emp.matr,
							coalesce(sum(desconto.valor), 0) as descontos
						from
							empregado emp
								left join emp_desc on emp.matr = emp_desc.matr
								left join desconto on emp_desc.cod_desc = desconto.cod_desc
						group by
							emp.matr
						) as tdescontos on emp.matr = tdescontos.matr
	where
		div.cod_dep = 3 and dep.cod_dep = 3
	group by
		div.cod_divisao, dep.nome, div.nome
	order by
		avg(tsalario.salario - tdescontos.descontos) desc
    limit 1) as t
order by
	media desc
