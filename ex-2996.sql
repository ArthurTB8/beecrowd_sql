select
	p.year,
	sender.name as sender,
	receiver.name as receiver
from
	packages p
		inner join users as sender
		    on p.id_user_sender = sender.id
		inner join users as receiver
		    on p.id_user_receiver = receiver.id
where
	(p.color = 'blue' or p.year = 2015)
	and
	(sender.address != 'taiwan' and receiver.address !='taiwan')
order by
	p.year desc
