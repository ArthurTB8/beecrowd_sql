select 
	d.nome as "departamento", emp.nome as "empregado", t1.salario_bruto, t2.total_desconto, (t1.salario_bruto - t2.total_desconto) as salario_liquido
from
	empregado emp
		inner join departamento d on emp.lotacao = d.cod_dep
		inner join (
			select
				emp.matr,
				coalesce(sum(v.valor), 0) as salario_bruto
			from
				empregado emp
					left join emp_venc on emp.matr = emp_venc.matr
					left join vencimento v on emp_venc.cod_venc = v.cod_venc
			group by
				emp.matr
			) as t1 on emp.matr = t1.matr
		inner join (
			select
				emp.matr,
				coalesce(sum(desconto.valor), 0) as total_desconto
			from
				empregado emp
					left join emp_desc on emp.matr = emp_desc.matr
					left join desconto on emp_desc.cod_desc = desconto.cod_desc
			group by
				emp.matr
			) as t2 on emp.matr = t2.matr
group by
	emp.matr,
	d.nome,
	emp.nome,
	t1.salario_bruto,
	t2.total_desconto
order by
	(t1.salario_bruto - t2.total_desconto) desc
