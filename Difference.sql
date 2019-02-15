-- id, trasaction_date, revenue
-- calculate the difference for each id between the first grasaction_date and the second trasaction_date

with temp as
(
    select row_number() over(order by transaction_date) as rnk, id, revenue
    from transaction
)
SELECT cur.id, cur.revenue - pre.revenue
from temp cur
left outer join temp per
on cur.rnk = pre.rnk + 1;
