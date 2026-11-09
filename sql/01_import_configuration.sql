-- MySQL Import Configuration
-- These commands were used to enable and verify CSV file importing.
-- local_infile allows MySQL to load local CSV files.
-- secure_file_priv shows the permitted directory for file imports.
-- These commands are kept for future reference.
SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'secure_file_priv';