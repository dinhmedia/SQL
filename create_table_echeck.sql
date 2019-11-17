USE [xxxx]
GO

/****** Object:  Table [dbo].[echeck]    Script Date: 16/10/2019 10:55:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[echeck](
	[date] [datetime] NOT NULL,
	[check_no] [char](20) NOT NULL,
	[money] [numeric](18, 2) NULL,
	[tax] [numeric](18, 2) NULL,
	[cust_no] [char](8) NULL,
	[cchhno] [char](8) NULL,
	[out_no] [char](12) NULL,
	[status] [numeric](1, 0) NULL,
	[ap_user] [char](60) NULL,
	[ed_user] [char](60) NULL,
	[datatype] [char](1) NULL,
	[re_acc] [char](6) NULL,
	[printno] [numeric](18, 0) NULL,
	[allname] [char](50) NULL,
	[xiugai] [char](1) NULL,
	[bill_type] [char](10) NULL,
	[type] [numeric](1, 0) NULL,
	[check_pri] [char](200) NULL,
	[check_tax] [char](200) NULL,
	[check_mny] [char](200) NULL,
	[set_no] [char](3) NULL,
 CONSTRAINT [PK_echeck_1] PRIMARY KEY CLUSTERED 
(
	[date] ASC,
	[check_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[echeck] ADD  CONSTRAINT [DF_echeck_status_1]  DEFAULT ((0)) FOR [status]
GO

ALTER TABLE [dbo].[echeck] ADD  CONSTRAINT [DF_echeck_set_no]  DEFAULT ('') FOR [set_no]
GO

