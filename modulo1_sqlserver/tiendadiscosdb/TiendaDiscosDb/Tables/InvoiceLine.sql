CREATE TABLE [dbo].[InvoiceLine]
(
	[InvoiceLineId] [int] NOT NULL,
	[InvoiceId] [int] NOT NULL,
	[TrackId] [int] NOT NULL,
	[UnitPrice] [numeric](10, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	CONSTRAINT [PK_InvoiceLine] PRIMARY KEY ([InvoiceLineId])
)
