select e.cpf, e.enome, d.dnome
from departamentos d inner join empregados e on d.dnumero = e.dnumero 
                     left join trabalha t on t.cpf_emp = e.cpf
                     left join projetos p on t.pnumero = p.pnumero
where p.pnumero is null
order by e.cpf
