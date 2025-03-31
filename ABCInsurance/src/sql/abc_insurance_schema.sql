CREATE SCHEMA `project` ;
USE project;
CREATE TABLE user (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(25) NOT NULL UNIQUE,
    password VARCHAR(25) NOT NULL,
    cellphone_no VARCHAR(15) NOT NULL,
    email VARCHAR(40) NOT NULL UNIQUE,
    name VARCHAR(25) NOT NULL,
    address VARCHAR(40) NOT NULL
);
 
CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(25) NOT NULL,
    model VARCHAR(40) NOT NULL
);
 
CREATE TABLE registered_product (
    registered_product_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    product_id INT,
    serial_no VARCHAR(25) NOT NULL,
    purchase_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);
 
CREATE TABLE claim (
    claim_id INT AUTO_INCREMENT PRIMARY KEY,
    registered_product_id INT,
    date_of_claim DATE NOT NULL,
    description TEXT NOT NULL,
    status ENUM('Pending', 'Approved', 'Rejected') DEFAULT 'Pending',
    FOREIGN KEY (registered_product_id) REFERENCES RegisteredProduct(registered_product_id)
);
 
CREATE TABLE admin (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(25) NOT NULL UNIQUE,
    password VARCHAR(25) NOT NULL
);