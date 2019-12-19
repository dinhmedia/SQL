- Create user on database and grant privileges in table
GRANT Database Permissions select, update
use use dbtest
go
create login hddtvt with password='11111';
create user hddtvt for login hddtvt;
grant connect to hddtvt;
grant select on customer to hddtvt;
grant select, update on echeck to hddtvt;
grant select, update on halfbill to hddtvt;

- Drop user on database
use dbtest
go
drop user test

- sp_addlinkedserver
use master
go
EXEC sp_addlinkedserver '192.168.x.x', N'SQL Server'
go

EXEC sp_addlinkedsrvlogin '192.168.x.x'','false',NULL,'demo','40rgP1912'
go

If use name, need edit file host
