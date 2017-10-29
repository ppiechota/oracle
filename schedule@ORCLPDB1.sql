-- system_params creation
create table system_params (
    name varchar(50),
    param_value number,
    start_date date,
    end_date date,
    constraint sys_par_pk primary key (name, start_date)
);

-- insert dummy data
insert into system_params values ('PARAM_01', 5, '2017-01-15', '2017-01-20');
insert into system_params values ('PARAM_01', 7, '2017-01-21', '2017-04-01');
insert into system_params values ('PARAM_01', 10, '2017-04-02', '2017-04-10');
insert into system_params values ('PARAM_01', 3, '2017-04-11', '2017-05-23');
insert into system_params values ('PARAM_01', 22, '2017-05-24', '2017-05-30');
insert into system_params values ('PARAM_01', 10, '2017-05-31', '2017-07-04');
insert into system_params values ('PARAM_01', 11, '2017-07-05', '2017-07-22');
insert into system_params values ('PARAM_01', 5, '2017-07-23', '2017-08-16');
insert into system_params values ('PARAM_01', 11, '2017-08-17', '2017-09-11');
insert into system_params values ('PARAM_01', 9, '2017-09-12', '2017-09-18');
insert into system_params values ('PARAM_01', 22, '2017-09-19', '2017-10-07');
insert into system_params values ('PARAM_01', 17, '2017-10-08', '2017-10-20');
insert into system_params values ('PARAM_01', 15, '2017-10-21', '2017-10-28');
insert into system_params values ('PARAM_01', 45, '2017-10-29', '2017-12-23');
insert into system_params values ('PARAM_01', 33, '2017-12-24', '2018-01-19');
insert into system_params values ('PARAM_01', 76, '2017-01-20', '2017-01-31');
insert into system_params values ('PARAM_01', 34, '2017-02-01', '2017-04-20');
commit;

create or replace package schedule_params is

    subtype ret_code_type is number;
    c_ret_ok    constant ret_code_type := 0;
    c_ret_error constant ret_code_type := 1;
  
    procedure insert_params(name system_params.name%type
                           ,param_value system_params.param_value%type
                           ,start_date system_params.start_date%type
                           ,end_date system_params.end_date%type
                           ,ret_code out ret_code_type);
                           
end schedule_params;


create or replace package body schedule_params is
    
    procedure insert_params(name system_params.name%type
                           ,param_value system_params.param_value%type
                           ,start_date system_params.start_date%type
                           ,end_date system_params.end_date%type
                           ,ret_code out ret_code_type) is
    begin
    
        
        
        
        
    end;
                           
end schedule_params;