USE [jpdc_invoices]
GO

/****** Object:  Table [dbo].[ToDigitalInvoices]    Script Date: 22/11/2019 19:35:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ToDigitalInvoices](
	[In_id] [int] IDENTITY(1,1) NOT NULL,
	[half_no] [char](10) NOT NULL,
	[half_fno] [char](4) NOT NULL,
	[check_no] [char](20) NULL,
	[check_date] [datetime] NULL,
	[cust_no] [char](8) NOT NULL,
	[all_name] [char](100) NULL,
	[incaddr] [char](100) NULL,
	[unicode] [char](30) NULL,
	[bank] [char](50) NULL,
	[bank_no] [char](30) NULL,
	[sale_no1] [char](10) NULL,
	[tel] [char](30) NULL,
	[email] [char](30) NULL,
	[box_name] [char](200) NULL,
	[box_nps] [char](200) NULL,
	[check_qty] [numeric](18, 0) NULL,
	[unit] [char](6) NULL,
	[price] [numeric](18, 3) NULL,
	[totmny] [numeric](18, 2) NULL,
	[money] [numeric](18, 2) NULL,
	[tax] [numeric](18, 2) NULL,
	[bill_type] [char](10) NULL,
	[check_mny] [char](200) NULL,
	[set_no] [char](3) NULL,
	[check_tax] [char](200) NULL,
	[ModifiedBy] [varchar](128) NULL,
	[Operation] [char](1) NULL,
	[pattern] [nvarchar](20) NULL,
	[serial] [nvarchar](20) NULL,
	[inv_no] [int] NULL,
	[process_date] [datetime] NULL,
	[status] [int] NULL,
	[error] [nvarchar](250) NULL,
	[amount] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[In_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

