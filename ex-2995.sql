select temperature, count(*) as number_of_records from (
  select records.*, row_number() over (partition by temperature)
  - row_number() over (partition by temperature, mark) as seq 
        from records) t
group by temperature, mark, seq order by mark;
