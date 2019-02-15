--574. Winning Candidate
--Table: Candidate
--
--+-----+---------+
--| id  | Name    |
--+-----+---------+
--| 1   | A       |
--| 2   | B       |
--| 3   | C       |
--| 4   | D       |
--| 5   | E       |
--+-----+---------+
--Table: Vote
--
--+-----+--------------+
--| id  | CandidateId  |
--+-----+--------------+
--| 1   |     2        |
--| 2   |     4        |
--| 3   |     3        |
--| 4   |     2        |
--| 5   |     5        |
--+-----+--------------+
--id is the auto-increment primary key,
--CandidateId is the id appeared in Candidate table.
--Write a sql to find the name of the winning candidate, the above example will return the winner B.
--
--+------+
--| Name |
--+------+
--| B    |
--+------+
--Notes:
--You may assume there is no tie, in other words there will be at most one winning candidate.
--
select c.id, v.vote
from
(select CandidateId, count(id) as vote
from Vote
group by CandidateId) v
right join
(select id, Name
from Candidate) c
on v.CandidateId = c.id
group by c.id, v.vote
order by v.vote
limit1;
