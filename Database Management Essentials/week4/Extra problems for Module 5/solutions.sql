1.

select ot.ordno, ot.orddate, c.custno, c.custfirstname, c.custlastname,
e.empno, e.empfirstname, e.emplastname
from ordertbl as ot
join customer as c
on ot.custno = c.custno
join employee as e
on e.empno = ot.empno
where date_part('year', ot.orddate) = 2021
AND c.custstate = 'CO'


2.

select c.custno, c.custfirstname, c.custlastname, ot.ordno, ot.orddate,e.empno, e.empfirstname, e.emplastname, p.prodno, p.prodname, (ol.qty * p.prodprice) as order_cost
from customer as c
join ordertbl as ot
on ot.custno = c.custno
join employee as e
on e.empno = ot.empno
join ordline as ol
on ol.ordno = ot.ordno
join product
on p.prodno = ol.prodno
where ot.orddate = '2021-01-23'
and (ol.qty * p.prodprice) > 150

3.

select ot.ordno, sum(ol.qty * p.prodprice)
from ordertbl as ot
join ordline as ol
on ot.ordno = ol.ordno
join product as p
on p.prodno = ol.prodno
where ot.orddate = '2021-01-23'
group by 1

4.

select ot.ordno, ot.orddate, c.custfirstname, c.custlastname, sum(ol.qty * p.prodprice)
from ordertbl as ot
join customer as c
on ot.custno = c.custno
join ordline as ol
on ot.ordno = ol.ordno
join product as p
on p.prodno = ol.prodno
where ot.orddate = '2021-01-23'
group by 1,2,3,4


5.

select ot.ordno, ot.orddate, c.custfirstname, c.custlastname,  e.empfirstname, e.emplastname, count(*), sum(ol.qty * p.prodprice)
from ordertbl as ot
join customer as c
on ot.custno = c.custno
join employee as e
on e.empno = ot.empno
join ordline as ol
on ot.ordno = ol.ordno
join product as p
on p.prodno = ol.prodno
where ot.orddate = '2021-01-23'
group by 1,2,3,4,5,6
having count(*) > 2
