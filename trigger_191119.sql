

use mfdc3000
go

----------


CREATE TRIGGER insert_ToDInvoices
ON halfbill
AFTER UPDATE,INSERT
AS 
	DECLARE @login_name VARCHAR(128)
 
    SELECT  @login_name = login_name
    FROM    sys.dm_exec_sessions
    WHERE   session_id = @@SPID

	DECLARE @pattern nvarchar(20)
	DECLARE @serial nvarchar(20)
	DECLARE @inv_no int
	DECLARE @status int
	DECLARE @error nvarchar(250)
	DECLARE @amount decimal(18, 0)

BEGIN
    INSERT INTO ToDigitalInvoices(
		half_no,
		check_no,	
		check_date,	
		cust_no,	
		all_name,	
		incaddr,		
		unicode,		
		bank,			
		bank_no,		
		sale_no1,		
		tel,			
		email,		
		box_name,			
		box_nps,				
		check_qty,		
		unit,					
		price,				  
		totmny,			
		money,			
		tax,			
		bill_type,			
		check_mny,			
		set_no,				
		check_tax,			
		ModifiedBy,		
		Operation,	
		pattern,
		serial,
		inv_no,
		process_date,
		status,
		error,
		amount
			)
    SELECT 
		h.half_no
		, h.check_no
		, h.check_date
		, c.cust_no
		, c.all_name
		, c.incaddr
		, c.unicode
		, c.bank
		, c.bank_no
		, c.sale_no1
		, c.tel
		, c.email
		, h.box_name
		, h.box_nps
		, h.check_qty
		, h.unit
		, h.price
		, h.totmny
		, e.money
		, e.tax 
		, h.bill_type
		, e.check_mny
		, h.set_no
		, h.check_tax
		, @login_name
		,'I'
		, @pattern
		, @serial
		, @inv_no
		, GETDATE()
		, @status
		, @error
		, @amount

		FROM halfbill h
		INNER JOIN customer c on c.cust_no  = h.cust_no
		INNER JOIN echeck e on e.check_no  = h.check_no
        WHERE c.cu_no != ISNULL(h.cust_no, -1) 
		AND e.check_no = h.check_no
END;





------------------------------------

select top 10 * from halfbill order by check_date desc

select top 10 * from echeck order by date desc


select top 10
  halfbill.half_no
, halfbill.check_no
, halfbill.check_date
, customer.cust_no
, customer.sale_no1
, customer.all_name
, customer.unicode
, customer.incaddr
, customer.bank_no
, customer.bank
, customer.email
, halfbill.set_no
, halfbill.check_tax
, halfbill.box_name
, halfbill.box_nps
, halfbill.unit
, halfbill.check_qty
, halfbill.price
, halfbill.totmny
, halfbill.bill_type  
, echeck.money
, echeck.tax  
, echeck.check_mny


from customer, halfbill, echeck
where customer.cust_no = halfbill.cust_no and halfbill.check_no = echeck.check_no 
order by 
half_date desc

----------------
/***INNER JOIN **/


select top 10
h.half_no
, h.check_no
, h.check_date
, c.cust_no
, c.sale_no1
, c.all_name
, c.unicode
, c.incaddr
, c.bank_no
, c.bank
, c.email
, h.set_no
, h.check_tax
, h.box_name
, h.box_nps
, h.unit
, h.check_qty
, h.price
, h.totmny
, h.bill_type  
, e.money
, e.tax  
, e.check_mny

from halfbill h
INNER JOIN customer c on c.cust_no  = h.cust_no
INNER JOIN echeck e on e.check_no  = h.check_no

order by 
half_date desc


----------------------------


CREATE TABLE [dbo].[ToDigitalInvoices](
	[InvoiceID] [int] IDENTITY(1,1) NOT NULL,
	[half_no] [char](10) NOT NULL,
	[check_no] [char](20) NULL,		-- Mã số hóa đơn
	[check_date] [datetime] NULL,	-- Ngày tạo hóa đơn
	[cust_no] [char](8) NOT NULL,	-- Mã số khách hàng
	[all_name] [char](100) NULL,	-- Tên công ty khách hàng
	[incaddr] [char](100) NULL,		-- Địa chỉ khách hành
	[unicode] [char](30) NULL,		-- Mã số thuế
	[bank] [char](50) NULL,			-- Tên ngân hàng
	[bank_no] [char](30) NULL,		-- Số tài khoản NH
	[sale_no1] [char](10) NULL,		-- Người mua hàng
	[tel] [char](30) NULL,			-- Số điện thoại khách hàng
	[email] [char](30) NULL,		-- Email khách hàng
	[box_name] [char](200) NULL,			-- Tên sản phẩm
	[box_nps] [char](200) NULL,				-- Ghi chú hàng hóa
	[check_qty] [numeric](18, 0) NULL,		-- Số lượng
	[unit] [char](6) NULL,					-- Đơn vị tính
	[price] [numeric](18, 3) NULL,			-- Đơn giá	  
	[totmny] [numeric](18, 2) NULL,			-- Thành tiền
	[money] [numeric](18, 2) NULL,			-- Tổng tiền chưa bao gồm VAT
	[tax] [numeric](18, 2) NULL,			-- Thuế VAT
	[bill_type] [char](10) NULL,			-- Thuế VAT, (BD Neu bill_type = 02 thuế 10%, bill_type # 02 là 0% VAT , HCM Nếu bill_type = 04 thì 10% VAT, bill_type # 04 là 0% VAT)
	[check_mny] [char](200) NULL,			-- Chuyển tiền từ số sang chữ
	[set_no] [char](3) NULL,				-- Loại Tiền tệ
	[check_tax] [char](200) NULL,			-- Tỉ giá USD
	[ModifiedBy] [varchar](128) NULL,		-- Máy tính xu lý
	[Operation] [char](1) NULL,				-- Trang thai du lieu , insert, update, delete
	[pattern] [nvarchar](20) NULL,
	[serial] [nvarchar](20) NULL,
	[inv_no] [int] NULL,
	[process_date] [datetime] NULL,
	[status] [int] NULL,
	[error] [nvarchar](250) NULL,
	[amount] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO













-------------------------------
CREATE TRIGGER update_price_trg
ON item
AFTER UPDATE,INSERT
AS 
BEGIN
    INSERT INTO item_price_history(
        item_id,
        old_price,
        new_price,
        date_of_change
        )
    SELECT 
        i.item_id,
        d.price,
        i.price,
        GETDATE()
    FROM inserted i
    LEFT JOIN deleted d
        ON i.item_id = d.item_id
    WHERE i.price != ISNULL(d.price, -1)
END;