1.

select er.eventno, er.dateheld, c.custno, c.custname, f.facno, f.facname
from eventrequest as er
join customer as c
on er.custno = c.custno
join facility as f
on er.facno = f.facno
where c.state = 'CO';


2.

select c.custno, c.custname, er.eventno, er.dateheld, f.facno, f.facname, (er.estcost/er.estaudience) as cost_per_person
from customer as c
join eventrequest as er
on c.custno = er.custno
join facility as f
on er.facno = f.facno
where date_part('year',er.dateheld) = 2022
AND (er.estcost/er.estaudience) < 0.2;


3.

select c.custno, c.custname, sum(er.estcost) as Totestcost
from customer as c
join eventrequest as er
on c.custno = er.custno
where er.status = 'Approved'
group by 1,2,3;


4.

select e.empno, e.empname, date_part('month',ep.workdate) as mont, count(ep.planno), sum(er.estcost)
from employee as e
join eventplan as ep
on e.empno = ep.empno
join eventrequest as er
on er.eventno = ep.eventno
where date_part('year',ep.workdate) = 2022
group by 1,2,3;


5.

insert into customer (custno, custname, address, internal, contact, phone, city, state, zip) 
values ('C19','Bidit Das','1901 W','Y','self','8324753832','Dallas','TX','75023');

6.

update resourcetbl
set rate = rate * 1.1
where resname = 'nurse';

7.

delete from customer
where custno = 'C19';
