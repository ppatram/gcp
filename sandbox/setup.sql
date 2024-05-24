drop database if exists gcp_usage;
create database if not exists gcp_usage;
use gcp_usage;
CREATE TABLE IF NOT EXISTS persons(
        id MEDIUMINT NOT NULL AUTO_INCREMENT,
        firstname varchar(20),
        lastname varchar(20),
        login varchar(20),
        accesscode varchar(12),
	region varchar(20) not null default 'asia-south1-a',
	serverip varchar(20),
	primary key (id,login)
);
insert into persons values('','AYAN', 'BHADURI', 'abhaduri', lpad(conv(floor(rand()*pow(36,12)), 10, 36), 12, 0), 'asia-south1-a', '');
insert into persons values('', 'MAYANK',  'MITTAL', 'mmittal', lpad(conv(floor(rand()*pow(36,12)), 10, 36), 12, 0), 'asia-south1-a', '');
insert into persons values('','N',  'PRAKASH', 'nprakash', lpad(conv(floor(rand()*pow(36,12)), 10, 36), 12, 0), 'asia-south1-a', '');
insert into persons values('','MOHAMMAD', 'KHAJA', 'mkhaja', lpad(conv(floor(rand()*pow(36,12)), 10, 36), 12, 0), 'asia-south1-a', '');
insert into persons values('','RAMAKRISHNA', 'YADAV', 'ryadav', lpad(conv(floor(rand()*pow(36,12)), 10, 36), 12, 0), 'asia-south1-a', '');
insert into persons values('','HARICHARAN', 'REDDY', 'hreddy', lpad(conv(floor(rand()*pow(36,12)), 10, 36), 12, 0), 'asia-south1-a', '');
insert into persons values('','AKHIL', 'NAIDU', 'anaidu', lpad(conv(floor(rand()*pow(36,12)), 10, 36), 12, 0), 'asia-south1-a', '');
insert into persons values('','KRISHNAJIT',  'KAR', 'kkar', lpad(conv(floor(rand()*pow(36,12)), 10, 36), 12, 0), 'asia-south1-a', '');
insert into persons values('','SIVA', 'PRASAD', 'sprasad', lpad(conv(floor(rand()*pow(36,12)), 10, 36), 12, 0), 'asia-south1-a', '');
insert into persons values('','MARLON', 'THOMAS', 'mthomas', lpad(conv(floor(rand()*pow(36,12)), 10, 36), 12, 0), 'us-east1-d', '');


