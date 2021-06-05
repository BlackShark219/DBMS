select * from citizen;
insert into citizen (full_name,date_ofbirth,sex,registration) VALUES ('Den Krasava','27.06.2001','male','Kyiv');
select * from passport;
insert into passport (serial_number,id_citizen,id_type,state_id) VALUES ('1337','16','1','16');
select * from type_of_passport;
insert into type_of_passport(typeofp) VALUES ('temporary');
select * from stateofp;
insert into stateofp (state,date_of_issue,expiration_date) VALUES ('expired','10.02.2020','10.03.2021');
