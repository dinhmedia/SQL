- Create user on database and grant privileges in table
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
