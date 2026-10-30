
USE DataWarehouse;
GO

-- 1. CRM Customer Information
CREATE TABLE bronze.crm_cust_info (
    cst_id               VARCHAR(50),
    cst_key              VARCHAR(50),
    cst_firstname        VARCHAR(100),
    cst_lastname         VARCHAR(100),
    cst_marital_status   VARCHAR(50),
    cst_gndr             VARCHAR(50),
    cst_create_date      VARCHAR(50)
);
GO

-- 2. CRM Product Information
CREATE TABLE bronze.crm_prd_info (
    prd_id        VARCHAR(50),
    prd_key       VARCHAR(100),
    prd_nm        VARCHAR(255),
    prd_cost      VARCHAR(50),
    prd_line      VARCHAR(50),
    prd_start_dt  VARCHAR(50),
    prd_end_dt    VARCHAR(50)
);
GO

-- 3. CRM Sales Details
CREATE TABLE bronze.crm_sales_details (
    sls_ord_num   VARCHAR(50),
    sls_prd_key   VARCHAR(100),
    sls_cust_id   VARCHAR(50),
    sls_order_dt  VARCHAR(50),
    sls_ship_dt   VARCHAR(50),
    sls_due_dt    VARCHAR(50),
    sls_sales     VARCHAR(50),
    sls_quantity  VARCHAR(50),
    sls_price     VARCHAR(50)
);
GO

-- 4. ERP Customer Demographics
CREATE TABLE bronze.erp_cust_az12 (
    CID    VARCHAR(100),
    BDATE  VARCHAR(50),
    GEN    VARCHAR(50)
);
GO

-- 5. ERP Customer Locations
CREATE TABLE bronze.erp_loc_a101 (
    CID    VARCHAR(100),
    CNTRY  VARCHAR(100)
);
GO

-- 6. ERP Product Categories
CREATE TABLE bronze.erp_px_cat_g1v2 (
    ID           VARCHAR(100),
    CAT          VARCHAR(100),
    SUBCAT       VARCHAR(100),
    MAINTENANCE  VARCHAR(50)
);
GO
