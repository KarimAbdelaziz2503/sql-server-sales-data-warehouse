CREATE TABLE dbo.DataDictionary (
    SourceSystem VARCHAR(20),
    FileName VARCHAR(100),
    ColumnName VARCHAR(100),
    DataType VARCHAR(50),
    ColumnDescription VARCHAR(255)
);


INSERT INTO dbo.DataDictionary
(SourceSystem, FileName, ColumnName, DataType, ColumnDescription)
VALUES
-- CRM: Customer Information
('CRM', 'cust_info.csv', 'cst_id', 'INT', 'Customer ID'),
('CRM', 'cust_info.csv', 'cst_key', 'VARCHAR(50)', 'Customer business key'),
('CRM', 'cust_info.csv', 'cst_firstname', 'NVARCHAR(50)', 'First name'),
('CRM', 'cust_info.csv', 'cst_lastname', 'NVARCHAR(50)', 'Last name'),
('CRM', 'cust_info.csv', 'cst_marital_status', 'VARCHAR(10)', 'Marital status'),
('CRM', 'cust_info.csv', 'cst_gndr', 'VARCHAR(10)', 'Gender'),
('CRM', 'cust_info.csv', 'cst_create_date', 'DATE', 'Customer creation date'),

-- CRM: Product Information
('CRM', 'prd_info.csv', 'prd_id', 'INT', 'Product ID'),
('CRM', 'prd_info.csv', 'prd_key', 'VARCHAR(50)', 'Product business key'),
('CRM', 'prd_info.csv', 'prd_nm', 'NVARCHAR(100)', 'Product name'),
('CRM', 'prd_info.csv', 'prd_cost', 'DECIMAL(18,2)', 'Product cost'),
('CRM', 'prd_info.csv', 'prd_line', 'VARCHAR(10)', 'Product line code'),
('CRM', 'prd_info.csv', 'prd_start_dt', 'DATE', 'Product start date'),
('CRM', 'prd_info.csv', 'prd_end_dt', 'DATE', 'Product end date'),

-- CRM: Sales Details
('CRM', 'sales_details.csv', 'sls_ord_num', 'VARCHAR(50)', 'Sales order number'),
('CRM', 'sales_details.csv', 'sls_prd_key', 'VARCHAR(50)', 'Product business key'),
('CRM', 'sales_details.csv', 'sls_cust_id', 'INT', 'Customer ID'),
('CRM', 'sales_details.csv', 'sls_order_dt', 'DATE', 'Order date'),
('CRM', 'sales_details.csv', 'sls_ship_dt', 'DATE', 'Shipping date'),
('CRM', 'sales_details.csv', 'sls_due_dt', 'DATE', 'Due date'),
('CRM', 'sales_details.csv', 'sls_sales', 'DECIMAL(18,2)', 'Sales amount'),
('CRM', 'sales_details.csv', 'sls_quantity', 'INT', 'Quantity sold'),
('CRM', 'sales_details.csv', 'sls_price', 'DECIMAL(18,2)', 'Unit selling price'),

-- ERP: Customer Demographics
('ERP', 'CUST_AZ12.csv', 'CID', 'VARCHAR(50)', 'Customer identifier'),
('ERP', 'CUST_AZ12.csv', 'BDATE', 'DATE', 'Birth date'),
('ERP', 'CUST_AZ12.csv', 'GEN', 'VARCHAR(20)', 'Gender'),

-- ERP: Customer Locations
('ERP', 'LOC_A101.csv', 'CID', 'VARCHAR(50)', 'Customer identifier'),
('ERP', 'LOC_A101.csv', 'CNTRY', 'NVARCHAR(50)', 'Customer country'),

-- ERP: Product Categories
('ERP', 'PX_CAT_G1V2.csv', 'ID', 'VARCHAR(50)', 'Product category ID'),
('ERP', 'PX_CAT_G1V2.csv', 'CAT', 'NVARCHAR(50)', 'Product category'),
('ERP', 'PX_CAT_G1V2.csv', 'SUBCAT', 'NVARCHAR(50)', 'Product subcategory'),
('ERP', 'PX_CAT_G1V2.csv', 'MAINTENANCE', 'VARCHAR(10)', 'Maintenance required');


SELECT
    SourceSystem,
    FileName,
    ColumnName,
    DataType,
    ColumnDescription
FROM dbo.DataDictionary
ORDER BY SourceSystem, FileName, ColumnName;
