use Example3
go


---Try this,

-- Create tables
create table table1(id int, empName varchar(20));
create table table2(id int, country varchar(20));
create table logtable(id int, empName varchar(20), country varchar(20));

-- Create trigger
CREATE TRIGGER logtableAfterInsert ON table2
after INSERT,DELETE,UPDATE
AS
BEGIN
    declare @empid int;
    declare @empname2 varchar(20);
    declare @empcountry varchar(20);

    select @empid=i.id from inserted i;
    select @empcountry=i.country from inserted i;
    select @empname2=tbl1.empName from table1 tbl1 where tbl1.id=@empid;

    insert into logtable values(@empid,@empname2,@empcountry);

    PRINT 'Inserted'
END
GO
-----After that insert the values,

insert into table1 values(2, 'Dinh');
insert into table2 values (2, 'VN');
Check the results,

select * from table1;
select * from table2;
select * from logtable;