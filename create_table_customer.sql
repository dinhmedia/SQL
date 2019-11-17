USE [xxxx]
GO

/****** Object:  Table [dbo].[customer]    Script Date: 16/10/2019 9:56:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[customer](
	[cust_no] [char](8) NOT NULL,
	[cust_name] [char](20) NULL,
	[set_no] [char](3) NULL,
	[cutype_no] [char](2) NULL,
	[all_name] [char](100) NULL,
	[sale_no] [char](6) NULL,
	[area_no1] [char](3) NULL,
	[credit_mny] [numeric](18, 0) NULL,
	[incaddr] [char](100) NULL,
	[sale_no1] [char](10) NULL,
	[billaddr] [char](100) NULL,
	[sale_no2] [char](10) NULL,
	[email] [char](30) NULL,
	[sale_no3] [char](10) NULL,
	[tel] [char](30) NULL,
	[fax] [char](30) NULL,
	[bank] [char](50) NULL,
	[bank_no] [char](30) NULL,
	[post_no] [char](30) NULL,
	[unicode] [char](30) NULL,
	[tax_type] [char](10) NULL,
	[m_amount] [numeric](13, 2) NULL,
	[total_mnyd] [numeric](18, 0) NULL,
	[paydate] [numeric](18, 0) NULL,
	[sh_invoice] [numeric](3, 0) NULL,
	[cub_no] [char](10) NULL,
	[curank] [char](10) NULL,
	[curate] [numeric](18, 0) NULL,
	[cufa] [char](30) NULL,
	[payst] [char](50) NULL,
	[other] [char](30) NULL,
	[yuge] [numeric](18, 0) NULL,
	[ap_user] [char](60) NULL,
	[ed_user] [char](60) NULL,
	[custmark] [char](1) NULL,
	[addr1] [char](60) NULL,
	[addr2] [char](60) NULL,
	[addr3] [char](60) NULL,
	[addr4] [char](60) NULL,
	[addr5] [char](60) NULL,
	[addr6] [char](60) NULL,
	[area_no2] [char](3) NULL,
	[area_no3] [char](3) NULL,
	[area_no4] [char](3) NULL,
	[area_no5] [char](3) NULL,
	[area_no6] [char](3) NULL,
	[area_name1] [char](30) NULL,
	[area_name2] [char](30) NULL,
	[area_name3] [char](30) NULL,
	[area_name4] [char](30) NULL,
	[area_name5] [char](30) NULL,
	[area_name6] [char](30) NULL,
	[rej_bill] [char](1) NULL,
	[cu_no] [char](30) NULL,
	[pricea] [numeric](18, 0) NULL,
	[priceb] [numeric](18, 0) NULL,
	[pricec] [numeric](18, 0) NULL,
	[bill_no] [char](10) NULL,
	[bill_name] [char](20) NULL,
	[cust_order] [numeric](1, 0) NULL,
	[box_name] [numeric](1, 0) NULL,
	[box_len] [numeric](1, 0) NULL,
	[tax_name] [char](20) NULL,
	[stop] [numeric](1, 0) NULL,
	[guo_no] [char](10) NULL,
	[guo_name] [char](20) NULL,
	[sale_id] [char](10) NULL,
	[zhuli_no] [char](10) NULL,
	[zhuli_name] [char](60) NULL,
	[comp_name] [char](100) NULL,
	[sout_acno] [char](20) NULL,
	[sobill] [char](4) NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[cust_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[customer] ADD  CONSTRAINT [DF_customer_bill_no]  DEFAULT ('') FOR [bill_no]
GO

ALTER TABLE [dbo].[customer] ADD  CONSTRAINT [DF_customer_bill_name]  DEFAULT ('') FOR [bill_name]
GO

ALTER TABLE [dbo].[customer] ADD  CONSTRAINT [DF_customer_stop]  DEFAULT (0) FOR [stop]
GO

