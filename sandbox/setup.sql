create database if not exists gcp_usage;
use gcp_usage;
CREATE TABLE IF NOT EXISTS gcp_usage(
        id MEDIUMINT NOT NULL AUTO_INCREMENT,
        firstname varchar(20),
        lastname varchar(20),
        login varchar(20),
        accesscode varchar(12),
	primary key (id,login)
);
insert into gcp_usage values('AYAN', 'BHADURI', 'abhaduri', lpad(conv(floor(rand()*pow(36,12)), 10, 36), 12, 0));
insert into gcp_usage values( 'MAYANK'  'MITTAL', 'mmittal', lpad(conv(floor(rand()*pow(36,12)), 10, 36), 12, 0));
insert into gcp_usage values('N',  'PRAKASH', 'nprakash', lpad(conv(floor(rand()*pow(36,12)), 10, 36), 12, 0));
insert into gcp_usage values('MOHAMMAD', 'KHAJA', 'mkhaja' lpad(conv(floor(rand()*pow(36,12)), 10, 36), 12, 0));
insert into gcp_usage values('RAMAKRISHNA', 'YADAV', 'rhadav', lpad(conv(floor(rand()*pow(36,12)), 10, 36), 12, 0));
insert into gcp_usage values('HARICHARAN', 'REDDY', 'hreddy', lpad(conv(floor(rand()*pow(36,12)), 10, 36), 12, 0));
insert into gcp_usage values('AKHIL', 'NAIDU', 'anaidu', lpad(conv(floor(rand()*pow(36,12)), 10, 36), 12, 0));
insert into gcp_usage values('KRISHNAJIT',  'KAR', 'kkar', lpad(conv(floor(rand()*pow(36,12)), 10, 36), 12, 0));
insert into gcp_usage values('SIVA', 'PRASAD', 'sprasad', lpad(conv(floor(rand()*pow(36,12)), 10, 36), 12, 0));
insert into gcp_usage values('MARLON', 'THOMAS', lpad(conv(floor(rand()*pow(36,12)), 10, 36), 12, 0));



CREATE TABLE IF NOT EXISTS logins(
        id MEDIUMINT NOT NULL AUTO_INCREMENT,
        login varchar(20),
        logintime timestamp not null default current_timestamp,
        logouttime timestamp not null default current_timestamp,
        status ENUM('notprov', 'stopped', 'running') default 'notprov',
        serverip varchar(20)
	primary key (id,login)
);
