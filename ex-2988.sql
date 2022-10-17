select


(
    select name 
    from teams t 
    WHERE t.id = team.id
) as name,



(
    select count(team_1) 
    from matches 
    where team_1 = team.id
)+(
    select count(team_2) 
    from matches where 
    team_2 = team.id
) as matches,



(
    select sum(case when team_2_goals > team_1_goals then 1 else 0 end) as victories 
    from teams t INNER JOIN matches m on t.id = m.team_2 
    where t.id = team.id
)+(
    select sum(case when team_1_goals > team_2_goals then 1 else 0 end) 
    from teams t INNER join matches m on t.id = m.team_1 
    where t.id = team.id
) as victories,



(
    select sum(case when team_2_goals < team_1_goals then 1 else 0 end) as victories 
    from teams t INNER join matches m on t.id = m.team_2 
    where t.id = team.id
)+(
    select sum(case when team_1_goals < team_2_goals then 1 else 0 end) 
    from teams t INNER join matches m on t.id = m.team_1 
    where t.id = team.id
) as defeats,



(
    select sum(case when team_2_goals = team_1_goals then 1 else 0 end) as victories 
    from teams t INNER join matches m on t.id = m.team_2 
    where t.id = team.id
)+(
    select sum(case when team_1_goals = team_2_goals then 1 else 0 end) 
    from teams t INNER join matches m on t.id = m.team_1 
    where t.id = team.id
) as draws,



(
    select sum(case when team_2_goals > team_1_goals then 3 when team_2_goals = team_1_goals then 1 else 0 end) as victories 
    from teams t INNER join matches m on t.id = m.team_2 
    where t.id = team.id
)+(
    select sum(case when team_1_goals > team_2_goals then 3 when team_1_goals = team_2_goals then 1 else 0 end) 
    from teams t INNER join matches m on t.id = m.team_1 
    where t.id = team.id
) as score


from teams team
order by score desc
