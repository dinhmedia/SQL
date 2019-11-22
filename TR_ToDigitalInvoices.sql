USE [mfdc3000]
GO

/****** Object:  Trigger [dbo].[insert_ToDInvoicesLO]    Script Date: 22/11/2019 11:04:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[insert_ToDInvoicesLO]
ON [dbo].[halfbill]
AFTER INSERT, UPDATE
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
	DECLARE @dateNow datetime
	set @dateNow = GETDATE()

    INSERT INTO [demo_invoice].dbo.[ToDigitalInvoices](
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
		,h.half_fno
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
        WHERE 
		c.cu_no != ISNULL(h.cust_no, -1)
		AND e.check_no = h.check_no
		AND h.half_no = half_no
		AND h.check_date >= CAST(@dateNow AS date)
		AND h.check_date < CAST(DATEADD(DAY, 1, @dateNow) AS date)
		AND h.half_no not in (SELECT t.half_no FROM [demo_invoice].dbo.[ToDigitalInvoices] t 
							  WHERE t.check_date >= CAST(@dateNow AS date) 
							  AND t.check_date < CAST(DATEADD(DAY, 1, @dateNow) AS date))
		AND h.half_fno not in (SELECT t.half_fno FROM [demo_invoice].dbo.[ToDigitalInvoices] t 
							  WHERE t.check_date >= CAST(@dateNow AS date) 
							  AND t.check_date < CAST(DATEADD(DAY, 1, @dateNow) AS date)
		)
END;
GO

ALTER TABLE [dbo].[halfbill] ENABLE TRIGGER [insert_ToDInvoicesLO]
GO

