USE DataWarehouse;
GO

CREATE OR ALTER PROCEDURE bronze.load_bronze
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    DECLARE @start_time DATETIME2(3);
    DECLARE @end_time DATETIME2(3);

    BEGIN TRY

        SET @start_time = SYSDATETIME();

        PRINT '======================================';
        PRINT 'Starting Bronze Layer Full Load';
        PRINT '======================================';

        BEGIN TRANSACTION;

        -- =====================================
        -- 1. CRM CUSTOMER INFO
        -- =====================================

        TRUNCATE TABLE bronze.crm_cust_info;

        BULK INSERT bronze.crm_cust_info
        FROM 'C:\Users\MSI\Desktop\Karim\Projects\sql-data-warehouse-project-main\01_datasets\source_crm\cust_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            CODEPAGE = '65001',
            TABLOCK
        );

        PRINT 'CRM Customer Loaded';


        -- =====================================
        -- 2. CRM PRODUCT INFO
        -- =====================================

        TRUNCATE TABLE bronze.crm_prd_info;

        BULK INSERT bronze.crm_prd_info
        FROM 'C:\Users\MSI\Desktop\Karim\Projects\sql-data-warehouse-project-main\01_datasets\source_crm\prd_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            CODEPAGE = '65001',
            TABLOCK
        );

        PRINT 'CRM Product Loaded';


        -- =====================================
        -- 3. CRM SALES DETAILS
        -- =====================================

        TRUNCATE TABLE bronze.crm_sales_details;

        BULK INSERT bronze.crm_sales_details
        FROM 'C:\Users\MSI\Desktop\Karim\Projects\sql-data-warehouse-project-main\01_datasets\source_crm\sales_details.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            CODEPAGE = '65001',
            TABLOCK
        );

        PRINT 'CRM Sales Loaded';


        -- =====================================
        -- 4. ERP CUSTOMER INFO
        -- =====================================

        TRUNCATE TABLE bronze.erp_cust_az12;

        BULK INSERT bronze.erp_cust_az12
        FROM 'C:\Users\MSI\Desktop\Karim\Projects\sql-data-warehouse-project-main\01_datasets\source_erp\CUST_AZ12.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            CODEPAGE = '65001',
            TABLOCK
        );

        PRINT 'ERP Customer Loaded';


        -- =====================================
        -- 5. ERP LOCATION
        -- =====================================

        TRUNCATE TABLE bronze.erp_loc_a101;

        BULK INSERT bronze.erp_loc_a101
        FROM 'C:\Users\MSI\Desktop\Karim\Projects\sql-data-warehouse-project-main\01_datasets\source_erp\LOC_A101.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            CODEPAGE = '65001',
            TABLOCK
        );

        PRINT 'ERP Location Loaded';


        -- =====================================
        -- 6. ERP PRODUCT CATEGORY
        -- =====================================

        TRUNCATE TABLE bronze.erp_px_cat_g1v2;

        BULK INSERT bronze.erp_px_cat_g1v2
        FROM 'C:\Users\MSI\Desktop\Karim\Projects\sql-data-warehouse-project-main\01_datasets\source_erp\PX_CAT_G1V2.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            CODEPAGE = '65001',
            TABLOCK
        );

        PRINT 'ERP Product Categories Loaded';

        -- =====================================
        -- VALIDATE LOADED TABLES
        -- =====================================

        IF NOT EXISTS (SELECT 1 FROM bronze.crm_cust_info)
        OR NOT EXISTS (SELECT 1 FROM bronze.crm_prd_info)
        OR NOT EXISTS (SELECT 1 FROM bronze.crm_sales_details)
        OR NOT EXISTS (SELECT 1 FROM bronze.erp_cust_az12)
        OR NOT EXISTS (SELECT 1 FROM bronze.erp_loc_a101)
        OR NOT EXISTS (SELECT 1 FROM bronze.erp_px_cat_g1v2)
        BEGIN
            THROW 50001, 'Bronze validation failed: empty table.', 1;
        END;

        COMMIT TRANSACTION;

        SET @end_time = SYSDATETIME();

        PRINT '======================================';
        PRINT 'Bronze Load Completed Successfully';
        PRINT CONCAT(
            'Duration: ',
            DATEDIFF(MILLISECOND, @start_time, @end_time),
            ' milliseconds'
        );
        PRINT '======================================';

    END TRY

    BEGIN CATCH

        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        PRINT 'Bronze Load Failed';
        PRINT ERROR_MESSAGE();

        THROW;

    END CATCH;

END;
GO

EXEC bronze.load_bronze;
GO

SELECT 'crm_cust_info' AS TableName, COUNT_BIG(*) AS TotalRows
FROM bronze.crm_cust_info
UNION ALL
SELECT 'crm_prd_info', COUNT_BIG(*)
FROM bronze.crm_prd_info
UNION ALL
SELECT 'crm_sales_details', COUNT_BIG(*)
FROM bronze.crm_sales_details
UNION ALL
SELECT 'erp_cust_az12', COUNT_BIG(*)
FROM bronze.erp_cust_az12
UNION ALL
SELECT 'erp_loc_a101', COUNT_BIG(*)
FROM bronze.erp_loc_a101
UNION ALL
SELECT 'erp_px_cat_g1v2', COUNT_BIG(*)
FROM bronze.erp_px_cat_g1v2;
