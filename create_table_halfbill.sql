USE [xxxx]
GO

/****** Object:  Table [dbo].[halfbill]    Script Date: 16/10/2019 9:48:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[halfbill](
	[half_no] [char](10) NOT NULL,
	[half_fno] [char](4) NOT NULL,
	[half_date] [datetime] NULL,
	[order_no] [char](12) NULL,
	[forder_no] [char](2) NULL,
	[cust_no] [char](6) NULL,
	[cust_name] [char](20) NULL,
	[cust_ordno] [char](40) NULL,
	[check_no] [char](20) NULL,
	[check_qty] [numeric](18, 0) NULL,
	[check_date] [datetime] NULL,
	[price] [numeric](18, 3) NULL,
	[box_name] [char](200) NULL,
	[unit] [char](6) NULL,
	[totmny] [numeric](18, 2) NULL,
	[billmark] [char](1) NULL,
	[type] [numeric](1, 0) NULL,
	[bill_type] [char](10) NULL,
	[out_no] [char](12) NULL,
	[ap_user] [char](30) NULL,
	[ed_user] [char](30) NULL,
	[he_no] [char](40) NULL,
	[he_date] [datetime] NULL,
	[check_pri] [char](200) NULL,
	[check_tax] [char](200) NULL,
	[check_mny] [char](200) NULL,
	[set_no] [char](3) NULL,
	[box_nps] [char](200) NULL,
	[outmark] [char](1) NULL,
	[outdate] [datetime] NULL,
 CONSTRAINT [PK_halfbill] PRIMARY KEY CLUSTERED 
(
	[half_no] ASC,
	[half_fno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[halfbill] ADD  CONSTRAINT [DF_halfbill_half_no]  DEFAULT ('') FOR [half_no]
GO

ALTER TABLE [dbo].[halfbill] ADD  CONSTRAINT [DF_halfbill_half_fno]  DEFAULT ('') FOR [half_fno]
GO

ALTER TABLE [dbo].[halfbill] ADD  CONSTRAINT [DF_halfbill_half_date]  DEFAULT ('1900/01/01') FOR [half_date]
GO

ALTER TABLE [dbo].[halfbill] ADD  CONSTRAINT [DF_halfbill_order_no]  DEFAULT ('') FOR [order_no]
GO

ALTER TABLE [dbo].[halfbill] ADD  CONSTRAINT [DF_halfbill_forder_no]  DEFAULT ('') FOR [forder_no]
GO

ALTER TABLE [dbo].[halfbill] ADD  CONSTRAINT [DF_halfbill_cust_no]  DEFAULT ('') FOR [cust_no]
GO

ALTER TABLE [dbo].[halfbill] ADD  CONSTRAINT [DF_halfbill_cust_name]  DEFAULT ('') FOR [cust_name]
GO

ALTER TABLE [dbo].[halfbill] ADD  CONSTRAINT [DF_halfbill_cust_ordno]  DEFAULT ('') FOR [cust_ordno]
GO

ALTER TABLE [dbo].[halfbill] ADD  CONSTRAINT [DF_halfbill_check_no]  DEFAULT ('') FOR [check_no]
GO

ALTER TABLE [dbo].[halfbill] ADD  CONSTRAINT [DF_halfbill_check_qty]  DEFAULT (0) FOR [check_qty]
GO

ALTER TABLE [dbo].[halfbill] ADD  CONSTRAINT [DF_halfbill_check_date]  DEFAULT ('1900/01/01') FOR [check_date]
GO

ALTER TABLE [dbo].[halfbill] ADD  CONSTRAINT [DF_halfbill_price]  DEFAULT (0) FOR [price]
GO

ALTER TABLE [dbo].[halfbill] ADD  CONSTRAINT [DF_halfbill_box_name]  DEFAULT ('') FOR [box_name]
GO

ALTER TABLE [dbo].[halfbill] ADD  CONSTRAINT [DF_halfbill_unit]  DEFAULT ('') FOR [unit]
GO

ALTER TABLE [dbo].[halfbill] ADD  CONSTRAINT [DF_halfbill_totmny]  DEFAULT (0) FOR [totmny]
GO

ALTER TABLE [dbo].[halfbill] ADD  CONSTRAINT [DF_halfbill_billmark]  DEFAULT (0) FOR [billmark]
GO

ALTER TABLE [dbo].[halfbill] ADD  CONSTRAINT [DF_halfbill_type]  DEFAULT (0) FOR [type]
GO

ALTER TABLE [dbo].[halfbill] ADD  CONSTRAINT [DF_halfbill_bill_type]  DEFAULT ('') FOR [bill_type]
GO

ALTER TABLE [dbo].[halfbill] ADD  CONSTRAINT [DF_halfbill_out_no]  DEFAULT ('') FOR [out_no]
GO

ALTER TABLE [dbo].[halfbill] ADD  CONSTRAINT [DF_halfbill_ap_user]  DEFAULT ('') FOR [ap_user]
GO

ALTER TABLE [dbo].[halfbill] ADD  CONSTRAINT [DF_halfbill_ed_user]  DEFAULT ('') FOR [ed_user]
GO

ALTER TABLE [dbo].[halfbill] ADD  CONSTRAINT [DF_halfbill_he_no]  DEFAULT ('') FOR [he_no]
GO

ALTER TABLE [dbo].[halfbill] ADD  CONSTRAINT [DF_halfbill_he_date]  DEFAULT ('1900/01/01') FOR [he_date]
GO

ALTER TABLE [dbo].[halfbill] ADD  CONSTRAINT [DF_halfbill_check_pri]  DEFAULT ('') FOR [check_pri]
GO

ALTER TABLE [dbo].[halfbill] ADD  CONSTRAINT [DF_halfbill_chexk_tax]  DEFAULT ('') FOR [check_tax]
GO

ALTER TABLE [dbo].[halfbill] ADD  CONSTRAINT [DF_halfbill_check_mny]  DEFAULT ('') FOR [check_mny]
GO

