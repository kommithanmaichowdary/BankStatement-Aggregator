use bsa;

-- Create companies table
 CREATE TABLE companies (
 company_id BIGINT AUTO_INCREMENT PRIMARY KEY,
 company_name VARCHAR(255) NOT NULL UNIQUE
 );
 
 -- Create users table
 CREATE TABLE users (
 user_id BIGINT AUTO_INCREMENT PRIMARY KEY,
 username VARCHAR(255) NOT NULL UNIQUE,
 email VARCHAR(255) NOT NULL UNIQUE,
 password VARCHAR(255) NOT NULL,
 company_id BIGINT NOT NULL,
 FOREIGN KEY (company_id) REFERENCES companies(company_id)
 );
 
 -- Create branches table
 CREATE TABLE branches (
 branch_id BIGINT AUTO_INCREMENT PRIMARY KEY,
 branch_name VARCHAR(255) NOT NULL,
 company_id BIGINT NOT NULL,
 FOREIGN KEY (company_id) REFERENCES companies(company_id)
 );
 
 -- Create bank_statements table
CREATE TABLE bank_statements (
 statement_id BIGINT AUTO_INCREMENT PRIMARY KEY,
 user_id BIGINT NOT NULL,
 company_id BIGINT NOT NULL,
 branch_id BIGINT NOT NULL,
 statement_date DATE NOT NULL,
 statement_data TEXT NOT NULL,
 FOREIGN KEY (user_id) REFERENCES users(user_id),
 FOREIGN KEY (company_id) REFERENCES companies(company_id),
 FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
 );
 
 
 CREATE TABLE transactions (
 id BIGINT AUTO_INCREMENT PRIMARY KEY,
 transaction_id VARCHAR(255) NOT NULL UNIQUE,
 date TIMESTAMP NOT NULL,
 amount DOUBLE NOT NULL,
 description VARCHAR(255) NOT NULL,
company_name VARCHAR(255) NOT NULL
);