
CREATE TABLE SourceInventory
(
    SourceSystem VARCHAR(10),
    FileName VARCHAR(100),
    TargetTable VARCHAR(100)
);

INSERT INTO SourceInventory
VALUES
('CRM', 'cust_info.csv', 'crm_cust_info'),
('CRM', 'prd_info.csv', 'crm_prd_info'),
('CRM', 'sales_details.csv', 'crm_sales_details'),
('ERP', 'CUST_AZ12.csv', 'erp_cust_az12'),
('ERP', 'LOC_A101.csv', 'erp_loc_a101'),
('ERP', 'PX_CAT_G1V2.csv', 'erp_px_cat_g1v2');

SELECT *
FROM SourceInventory
ORDER BY SourceSystem, FileName;

SELECT
    SourceSystem,
    COUNT(*) AS TotalFiles
FROM SourceInventory
GROUP BY SourceSystem;
