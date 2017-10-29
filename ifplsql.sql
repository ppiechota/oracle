-- run as SYSTEM

-- preparing user

create user test01 identified by test01;
grant resource, connect to test01;
alter session set current_schema = test01;

-- creating objects

create or replace type plch_dates_t is table of date;

create or replace procedure plch_proc(
  dates_in    in plch_dates_t,
  min_date_in in date)
is
  l_too_early boolean := false;
  begin

    for idx in 1 .. dates_in.count
    loop
      l_too_early := l_too_early or dates_in(idx) < min_date_in;
    end loop;

    if l_too_early
    then
      dbms_output.put_line('At least one date is too early.');
    else
      dbms_output.put_line('No date is too early.');
    end if;
  end;
/

-- running a test
--
-- I will see this output in the order shown:
--
-- At least one date is too early.
-- No date is too early.
--

declare
  l_dates plch_dates_t := plch_dates_t(date '2013-06-01', date '2014-01-10');
begin
  plch_proc(l_dates, date '2013-12-01');
  plch_proc(l_dates, date '2010-12-01');
end;
/

-- rollback

drop user test01 cascade;

select dupa from dual;




