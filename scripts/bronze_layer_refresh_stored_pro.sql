CREATE OR REPLACE PROCEDURE bronze.refresh_bronze_layer()
LANGUAGE plpgsql
AS $$
BEGIN
    -- Start Message
    RAISE NOTICE '================================================';
    RAISE NOTICE 'Starting Bronze Layer Refresh: Recreating Tables';
    RAISE NOTICE '================================================';

    -- 1. CRM CUSTOMER INFO
    RAISE NOTICE '>> Dropping and Creating: bronze.crm_cust_info';
    DROP TABLE IF EXISTS bronze.crm_cust_info;
    CREATE TABLE bronze.crm_cust_info (
        cst_id             INT,
        cst_key            VARCHAR(50),
        cst_firstname      VARCHAR(50),
        cst_lastname       VARCHAR(50),
        cst_marital_status VARCHAR(50),
        cst_gender         VARCHAR(50),
        cst_create_date    DATE
    );

    -- 2. CRM PRODUCT INFO
    RAISE NOTICE '>> Dropping and Creating: bronze.crm_prd_info';
    DROP TABLE IF EXISTS bronze.crm_prd_info;
    CREATE TABLE bronze.crm_prd_info (
        prd_id       INT,
        prd_key      VARCHAR(50),
        prd_nm       VARCHAR(50),
        prd_cost     INT,
        prd_line     VARCHAR(50),
        prd_start_dt DATE,
        prd_end_dt   DATE
    );

    -- 3. CRM SALES DETAILS
    RAISE NOTICE '>> Dropping and Creating: bronze.crm_sales_details';
    DROP TABLE IF EXISTS bronze.crm_sales_details;
    CREATE TABLE bronze.crm_sales_details (
        sls_order_num VARCHAR(50),
        sls_prd_key   VARCHAR(50),
        sls_cust_id   INT,
        sls_order_dt  INT,
        sls_ship_dt   INT,
        sls_due_dt    INT,
        sls_sales     INT,
        sls_quantity  INT,
        sls_price     INT
    );

    -- 4. ERP LOCATION A101
    RAISE NOTICE '>> Dropping and Creating: bronze.erp_loc_a101';
    DROP TABLE IF EXISTS bronze.erp_loc_a101;
    CREATE TABLE bronze.erp_loc_a101 (
        cid   VARCHAR(50),
        cntry VARCHAR(50)
    );

    -- 5. ERP PRODUCT CATEGORY G1V2
    RAISE NOTICE '>> Dropping and Creating: bronze.erp_px_cat_g1v2';
    DROP TABLE IF EXISTS bronze.erp_px_cat_g1v2;
    CREATE TABLE bronze.erp_px_cat_g1v2 (
        id          VARCHAR(50),
        cat         VARCHAR(50),
        subcat      VARCHAR(50),
        maintenance VARCHAR(50)
    );

    -- 6. ERP CUSTOMER AZ12
    RAISE NOTICE '>> Dropping and Creating: bronze.erp_cust_az12';
    DROP TABLE IF EXISTS bronze.erp_cust_az12;
    CREATE TABLE bronze.erp_cust_az12 (
        cid   VARCHAR(50),
        bdate DATE,
        gen   VARCHAR(50)
    );

    RAISE NOTICE '================================================';
    RAISE NOTICE 'Bronze Layer Schema Refresh Completed Successfully';
    RAISE NOTICE 'READY FOR BULK LOAD (\copy)';
    RAISE NOTICE '================================================';

END;
$$;
