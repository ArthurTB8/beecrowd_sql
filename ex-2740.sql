(select 'Podium: ' || team from league order by position limit 3)
union ALL
(with t as  (select * from league order by position desc limit 2)
  select 'Demoted: '|| team from t order by position asc);
