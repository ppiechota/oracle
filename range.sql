-- I have a table of people and their dates of birth
-- I'd like a list of these people and for each person include
-- a column showing how many people are born in the same decade
-- (including the person him/herself.)

create table plch_people (
  id    integer primary key
  ,
  name  varchar2(10)
  ,
  birth date
)
/
insert into plch_people values (1, 'Jonathan', date '1948-01-10')
/
insert into plch_people values (2, 'James', date '1973-02-11')
/
insert into plch_people values (3, 'Jane', date '1965-03-12')
/
insert into plch_people values (4, 'Jill', date '1960-04-13')
/
insert into plch_people values (5, 'Jack', date '1956-05-14')
/
insert into plch_people values (6, 'Judith', date '1969-06-15')
/
insert into plch_people values (7, 'Jeff', date '1952-07-16')
/
commit
/

select
  id,
  name,
  birth,
  count(*)
  over (partition by substr(to_char(birth, 'YYYY'), 1, 3)||'0')
    as people_same_decade
from plch_people
order by id
         /

-- trunc on number with negative can give decades
-- select trunc(2017, -1) from dual;
