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
- all select in databse
grant select on schema :: [dbo]  to hddtvt;

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

- Update on table.
UPDATE echeck
SET check_no='CA/19E00000xx'
WHERE date='2019-12-23 17:27:05.000';

- UPDATE halfbill
SET check_no='AAA/20E0000001'
WHERE half_no='2001000368';

# Update to columns
USE [jpdc3000]
GO
update porder
		set cwps='Giaáy carton '+ rtrim(ltrim(cwps))  FROM porder p
		WHERE  cwps NOT LIKE '%Giaáy carton %'
		AND cust_no='F101' and bill_type='02' and plan_date = '2021-03-09 23:59:59.000'

- DELETE data on table
DELETE FROM ToDigitalInvoices
WHERE half_no = 2002000001;

- update fill on table
alter table halfbill  alter column box_name char(200)

- Query return times
WHERE 
h.check_date > dateadd(dd,-1,cast(getdate() as date))

- Backup database to new table.
select * into BCHUONG_200629 from BCHUONG

- This restore only data for Table
use DB-DEMO
go

INSERT INTO CMSMF 
SELECT *
FROM [DB-DEMO_re].[dbo].[CMSMF]
WHERE MF001='VND'

use DB-DEMO
go

INSERT INTO CMSMG
SELECT *
FROM [DB-DEMO_re].[dbo].[CMSMG]
# WHERE MG001='VND'
go


