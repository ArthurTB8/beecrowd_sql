select name, cast(extract(day from payday) as INTEGER) as day from loan;
