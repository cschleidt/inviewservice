BEGIN TRY

BEGIN TRAN;

-- CreateTable
CREATE TABLE [dbo].[User] (
    [id] INT NOT NULL IDENTITY(1,1),
    [sub] NVARCHAR(1000) NOT NULL,
    [totalInvestmentValue] FLOAT(53) NOT NULL CONSTRAINT [User_totalInvestmentValue_df] DEFAULT 0,
    CONSTRAINT [User_pkey] PRIMARY KEY CLUSTERED ([id]),
    CONSTRAINT [User_sub_key] UNIQUE NONCLUSTERED ([sub])
);

-- CreateTable
CREATE TABLE [dbo].[UserInvestmentValues] (
    [id] INT NOT NULL IDENTITY(1,1),
    [sub] NVARCHAR(1000) NOT NULL,
    [dateTime] DATETIME2 NOT NULL,
    [value] FLOAT(53) NOT NULL,
    CONSTRAINT [UserInvestmentValues_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[StockSummary] (
    [id] INT NOT NULL IDENTITY(1,1),
    [sub] NVARCHAR(1000) NOT NULL,
    [currentTotalAmount] FLOAT(53),
    [oldestStock] NVARCHAR(1000),
    [newestStock] NVARCHAR(1000),
    [stockWithMostShares] NVARCHAR(1000),
    [highestInvestmentStock] NVARCHAR(1000),
    CONSTRAINT [StockSummary_pkey] PRIMARY KEY CLUSTERED ([id]),
    CONSTRAINT [StockSummary_sub_key] UNIQUE NONCLUSTERED ([sub])
);

-- CreateTable
CREATE TABLE [dbo].[UserStock] (
    [id] INT NOT NULL IDENTITY(1,1),
    [sub] NVARCHAR(1000) NOT NULL,
    [symbol] NVARCHAR(1000) NOT NULL,
    [entryValuePerShare] FLOAT(53) NOT NULL,
    [numberOfShares] INT NOT NULL,
    [totalValueOfShares] FLOAT(53) NOT NULL,
    [firstBought] DATETIME2 NOT NULL,
    [lastBought] DATETIME2 NOT NULL,
    CONSTRAINT [UserStock_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[SingleStock] (
    [id] INT NOT NULL IDENTITY(1,1),
    [symbol] NVARCHAR(1000) NOT NULL,
    [name] NVARCHAR(1000) NOT NULL,
    [marketValuePerShare] FLOAT(53) NOT NULL,
    CONSTRAINT [SingleStock_pkey] PRIMARY KEY CLUSTERED ([id]),
    CONSTRAINT [SingleStock_symbol_key] UNIQUE NONCLUSTERED ([symbol])
);

-- CreateTable
CREATE TABLE [dbo].[CryptoSummary] (
    [id] INT NOT NULL IDENTITY(1,1),
    [sub] NVARCHAR(1000) NOT NULL,
    [totalValueOf] FLOAT(53) NOT NULL,
    [numberOfDifferent] INT NOT NULL,
    [highestInvestedCurrency] NVARCHAR(1000) NOT NULL,
    [highestValuePerCurrency] NVARCHAR(1000) NOT NULL,
    [lowestValuePerCurrency] NVARCHAR(1000) NOT NULL,
    [highestOwnedVolume] NVARCHAR(1000) NOT NULL,
    [lowestOwnedVolume] NVARCHAR(1000) NOT NULL,
    [newestBoughtCurrency] NVARCHAR(1000) NOT NULL,
    [oldestBoughtCurrency] NVARCHAR(1000) NOT NULL,
    CONSTRAINT [CryptoSummary_pkey] PRIMARY KEY CLUSTERED ([id]),
    CONSTRAINT [CryptoSummary_sub_key] UNIQUE NONCLUSTERED ([sub])
);

-- CreateTable
CREATE TABLE [dbo].[UserCrypto] (
    [id] INT NOT NULL IDENTITY(1,1),
    [sub] NVARCHAR(1000) NOT NULL,
    [symbol] NVARCHAR(1000) NOT NULL,
    [quantityOfCrypto] FLOAT(53) NOT NULL,
    [averageValuePerCrypto] FLOAT(53) NOT NULL,
    [totalCryptoValue] FLOAT(53) NOT NULL,
    [firstBought] DATETIME2 NOT NULL,
    [lastBought] DATETIME2 NOT NULL,
    CONSTRAINT [UserCrypto_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[SingleCrypto] (
    [id] INT NOT NULL IDENTITY(1,1),
    [symbol] NVARCHAR(1000) NOT NULL,
    [name] NVARCHAR(1000) NOT NULL,
    [marketValuePerCrypto] FLOAT(53) NOT NULL,
    CONSTRAINT [SingleCrypto_pkey] PRIMARY KEY CLUSTERED ([id]),
    CONSTRAINT [SingleCrypto_symbol_key] UNIQUE NONCLUSTERED ([symbol])
);

-- CreateTable
CREATE TABLE [dbo].[CommoditiesSummary] (
    [id] INT NOT NULL IDENTITY(1,1),
    [sub] NVARCHAR(1000) NOT NULL,
    [totalValueOf] FLOAT(53),
    [highestInvestedCommodity] NVARCHAR(1000),
    [highestValuePerCommodity] NVARCHAR(1000),
    CONSTRAINT [CommoditiesSummary_pkey] PRIMARY KEY CLUSTERED ([id]),
    CONSTRAINT [CommoditiesSummary_sub_key] UNIQUE NONCLUSTERED ([sub])
);

-- CreateTable
CREATE TABLE [dbo].[UserCommodity] (
    [id] INT NOT NULL IDENTITY(1,1),
    [sub] NVARCHAR(1000) NOT NULL,
    [name] NVARCHAR(1000) NOT NULL,
    [quantityOfCommoditiy] INT NOT NULL,
    [averageBuyPrice] FLOAT(53) NOT NULL,
    [totalCommodityValue] FLOAT(53) NOT NULL,
    [firstBought] DATETIME2 NOT NULL,
    [lastBought] DATETIME2 NOT NULL,
    CONSTRAINT [UserCommodity_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[SingleCommodity] (
    [id] INT NOT NULL IDENTITY(1,1),
    [name] NVARCHAR(1000) NOT NULL,
    [type] NVARCHAR(1000) NOT NULL,
    [currency] NVARCHAR(1000) NOT NULL,
    [change] FLOAT(53),
    [change_percentage] FLOAT(53),
    [high] FLOAT(53),
    [low] FLOAT(53),
    [last] FLOAT(53),
    [last_close] FLOAT(53),
    CONSTRAINT [SingleCommodity_pkey] PRIMARY KEY CLUSTERED ([id]),
    CONSTRAINT [SingleCommodity_name_key] UNIQUE NONCLUSTERED ([name])
);

-- AddForeignKey
ALTER TABLE [dbo].[UserInvestmentValues] ADD CONSTRAINT [UserInvestmentValues_sub_fkey] FOREIGN KEY ([sub]) REFERENCES [dbo].[User]([sub]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[StockSummary] ADD CONSTRAINT [StockSummary_sub_fkey] FOREIGN KEY ([sub]) REFERENCES [dbo].[User]([sub]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[UserStock] ADD CONSTRAINT [UserStock_symbol_fkey] FOREIGN KEY ([symbol]) REFERENCES [dbo].[SingleStock]([symbol]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[UserStock] ADD CONSTRAINT [UserStock_sub_fkey] FOREIGN KEY ([sub]) REFERENCES [dbo].[StockSummary]([sub]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[CryptoSummary] ADD CONSTRAINT [CryptoSummary_sub_fkey] FOREIGN KEY ([sub]) REFERENCES [dbo].[User]([sub]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[UserCrypto] ADD CONSTRAINT [UserCrypto_symbol_fkey] FOREIGN KEY ([symbol]) REFERENCES [dbo].[SingleCrypto]([symbol]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[UserCrypto] ADD CONSTRAINT [UserCrypto_sub_fkey] FOREIGN KEY ([sub]) REFERENCES [dbo].[CryptoSummary]([sub]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[CommoditiesSummary] ADD CONSTRAINT [CommoditiesSummary_sub_fkey] FOREIGN KEY ([sub]) REFERENCES [dbo].[User]([sub]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[UserCommodity] ADD CONSTRAINT [UserCommodity_name_fkey] FOREIGN KEY ([name]) REFERENCES [dbo].[SingleCommodity]([name]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[UserCommodity] ADD CONSTRAINT [UserCommodity_sub_fkey] FOREIGN KEY ([sub]) REFERENCES [dbo].[CommoditiesSummary]([sub]) ON DELETE NO ACTION ON UPDATE CASCADE;

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
