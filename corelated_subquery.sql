alter table ports add capacity number;

select p.*, (select count(*) from ships where home_port_id = p.port_id) as capacity from ports p;

select home_port_id, count(*) from ships group by home_port_id;

--1	9
--6	12
--2	14
--4	12
--5	25
--3	15
--7	13

--create table ports (
--    port_id number generated always as identity primary key,
--    port_name varchar2(100)
--)
--/
--
--create table ships (
--    ship_name varchar2(100),
--    home_port_id number,
--    constraint home_port_fk foreign key (home_port_id) references ports (port_id)
--)
--/
--
--insert into ports (port_name) values ('Ustka');
--insert into ports (port_name) values ('Szczecin');
--insert into ports (port_name) values ('Sopot');
--insert into ports (port_name) values ('Gdynia');
--insert into ports (port_name) values ('Gdansk');
--insert into ports (port_name) values ('Jaroslawiec');
--insert into ports (port_name) values ('Hel');
--
--
--declare
--    hp_id number;
--begin
--    for i in 1 .. 100 loop
--    
--        select port_id 
--          into hp_id 
--          from (select port_id, dbms_random.value from ports order by 2) 
--         where rownum < 2;
--         
--        insert into ships values ('SHIP-' || i, hp_id);
--        
--    end loop;
--end;
--
--commit;