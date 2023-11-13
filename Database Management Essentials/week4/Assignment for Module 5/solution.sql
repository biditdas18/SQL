1.

select er.eventno, er.dateheld,count(ep.planno) as count_of_event_plans
from eventrequest as er
join eventplan as ep
on er.eventno = ep.eventno
where ep.workdate between '2022-12-01' and '2022-12-31'
group by 1,2
having count(ep.planno) > 1

2.

select ep.planno, ep.eventno, ep.workdate, ep.activity
from eventplan as ep
join eventrequest as er
on ep.eventno = er.eventno
join facility as fy
on er.facno = fy.facno
where workdate between '2022-12-01' and '2022-12-31'
and facname like '%Basketball arena%';

3.

select er.eventno, er.dateheld, er.status, er.estcost
from eventrequest as er
join eventplan as ep
on er.eventno = ep.eventno
join employee as epl
on ep.empno = epl.empno
join facility as fy
on er.facno = fy.facno
where facname like '%Basketball arena%'
and empname like '%Mary Manager%'
and workdate BETWEEN '2022-10-01' AND '2022-12-31'

4.

select epl.planno, epl.lineno, rt.resname, epl.resourcecnt,ltn.locname,epl.timestart,epl.timeend
from eventplanline as epl
join resourcetbl as rt
on epl.resno = rt.resno
join location as ltn 
on epl.locno = ltn.locno
join eventplan as ep
on ep.planno =epl.planno
join facility as fy
on ltn.facno = fy.facno
where ep.workdate between '2022-10-01' and '2022-12-31'
and fy.facname = 'Basketball arena'
and ep.activity = 'Operation';

5.

select epl.planno, sum(epl.resourcecnt * rtl.rate) as resource_cost
from eventplanline as epl
join resourcetbl as rtl
on epl.resno = rtl.resno
join eventplan as ep
on ep.planno = epl.planno
where ep.workdate between '2022-12-01' and '2022-12-31'
group by 1
having sum(epl.resourcecnt * rtl.rate) > 50; 



select * from facility;
1.

insert into facility (facno,facname) values ('F104','Swimming Pool');

select * from location;

2.

insert into location (locno,facno,locname) values ('L107','F104','Door');

3.

insert into location (locno,facno,locname) values ('L108','F104','Locker Room');

4.

update location
set locname = 'Gate'
where locno = 'L107';


5.

delete from location
where locno = 'L108';





1.

Semantic Error - Missing Join Statement:  AND eventrequest.eventno = eventplan.eventno

SELECT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest, employee, facility, eventplan
WHERE estaudience > 5000
 AND eventplan.empno = employee.empno
 AND eventrequest.facno = facility.facno
 AND eventrequest.eventno = eventplan.eventno
 AND facname = 'Football stadium'
 AND empname = 'Mary Manager';

2.

Redundancy Error: Group by statement not needed

SELECT DISTINCT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest, eventplan
WHERE estaudience > 4000
 AND eventplan.eventno = eventrequest.eventno

3.

Redundancy Error: Employee table is redundant

SELECT DISTINCT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest, employee, facility, eventplan
WHERE estaudience > 5000
 AND eventplan.empno = employee.empno
 AND eventrequest.facno = facility.facno
 AND eventplan.eventno = eventrequest.eventno
 AND facname = 'Football stadium'


4.

Syntax Error: Between was misspelled as 'Betwen' and source for the column name 'eventno' was ambiguous  


SELECT DISTINCT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest, employee, eventplan
WHERE estaudience BETWEEN 5000 AND 10000
 AND eventplan.empno = employee.empno
 AND eventrequest.eventno = eventplan.eventno
 AND empname = 'Mary Manager'

5.

Corrected SQL below

SELECT eventplan.planno, lineno, resname,
timestart, timeend
FROM eventrequest, facility, eventplan,eventplanline, resourcetbl
 WHERE estaudience = 10000
 AND eventplan.planno = eventplanline.planno 
 AND eventrequest.facno = facility.facno
 AND facname = 'Basketball arena' 
 AND eventplanline.resno = resourcetbl.resno
 AND eventrequest.eventno = eventplan.eventno 


