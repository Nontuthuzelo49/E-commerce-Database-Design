Create database ecommerce;
USE ecommerce;

-- Table: product_category
-- This table Classifies products into categories (e.g., clothing, electronics)
CREATE TABLE product_category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

-- Table: product
-- This table Stores product details
CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL,
    category_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES product_category(category_id)
);

-- Table: product_image
-- This table Stores product image URLs or file references
CREATE TABLE product_image (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    image_url VARCHAR(500),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Table: color 
-- This table Manages available color options 
CREATE TABLE color ( 
    color_id INT AUTO_INCREMENT PRIMARY KEY, 
    product_id INT NOT NULL, 
    color_name VARCHAR(50), 
    FOREIGN KEY (product_id) REFERENCES product(product_id) 
);

-- Table: product_item
-- This table Represents purchasable items with specific variations
CREATE TABLE product_item (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    variation_id INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (variation_id) REFERENCES product_variation(variation_id)
);

-- Table: brand
-- This table Stores brand information
CREATE TABLE brand (
    brand_id INT AUTO_INCREMENT PRIMARY KEY,
    brand_name VARCHAR(100) NOT NULL
);

-- Table: product_variation
-- This table Stores variations of products (e.g., size, color)
CREATE TABLE product_variation (
    variation_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    color_id INT,
    size_option_id INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(size_id)
);

-- Table: size_category
-- This table  Groups sizes into categories (e.g., clothing sizes, shoe sizes)
CREATE TABLE size_category (
    size_category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

-- Table: size_option
-- This table  Lists specific sizes (e.g., S, M, L, 42)
CREATE TABLE size_option (
    size_id INT AUTO_INCREMENT PRIMARY KEY,
    size_category_id INT NOT NULL,
    size_name VARCHAR(50) NOT NULL,
    FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);

-- Table: product_attribute
-- This table Stores additional attributes for products (e.g., material, brand)
CREATE TABLE product_attribute (
    attribute_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    attribute_category_id INT,
    attribute_type_id INT,
    attribute_name VARCHAR(50) NOT NULL,
    attribute_value VARCHAR(100),
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id)
);

-- Table: attribute_category
-- This table Groups attributes into categories (e.g., physical, technical)
CREATE TABLE attribute_category (
    attribute_category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

-- Table: attribute_type
-- This table Defines types of attributes (e.g., text, number, boolean)
CREATE TABLE attribute_type (
    attribute_type_id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(50) NOT NULL
);

USE ecommerce;

-- Insert into product_category
INSERT INTO product_category (category_name) VALUES 
('Clothing'),
('Accessories'),
('Home'),
('Electronics');

-- Insert into product
INSERT INTO product (name, description, price, stock_quantity, category_id) VALUES 
-- Clothing
('Denim Jacket', 'Classic denim jacket for all seasons', 49.99, 50, 1),
('Graphic T-shirt', 'Cotton t-shirt with a fun graphic design', 19.99, 100, 1),
-- Accessories
('Leather Wallet', 'Compact leather wallet with multiple card slots', 29.99, 40, 2),
('Silk Scarf', 'Elegant silk scarf in vibrant colors', 24.99, 60, 2),
-- Home
('Table Lamp', 'Minimalistic table lamp for warm lighting', 34.99, 20, 3),
('Scented Candles', 'Set of 3 soy wax candles with relaxing fragrances', 15.99, 30, 3),
-- Electronics
('Wireless Earbuds', 'Bluetooth-enabled earbuds with noise cancellation', 59.99, 80, 4),
('Portable Charger', 'Fast-charging power bank with 10,000 mAh', 25.99, 50, 4);

-- Insert into brand
INSERT INTO brand (brand_name) VALUES 
('Urban Trends'),
('Cozy Essentials'),
('TechSavvy');

-- Insert into product_image
INSERT INTO product_image (product_id, image_url) VALUES 
(1, 'images/denim_jacket.jpg'),
(2, 'images/graphic_tshirt.jpg'),
(3, 'images/leather_wallet.jpg'),
(4, 'images/silk_scarf.jpg'),
(5, 'images/table_lamp.jpg'),
(6, 'images/scented_candles.jpg'),
(7, 'images/wireless_earbuds.jpg'),
(8, 'images/portable_charger.jpg');

INSERT INTO color (color_name, product_id) VALUES 
('Blue', 1),
('Black', 3),
('Black', 7),
('White', 4),
('White', 8),
('Red', 2);

-- Insert into size_category
INSERT INTO size_category (category_name) VALUES 
('General Sizes');

-- Insert into size_option
INSERT INTO size_option (size_category_id, size_name) VALUES 
(1, 'One Size Fits All');

-- Insert into product_variation
INSERT INTO product_variation (product_id, color_id, size_option_id) VALUES 
(1, 3, NULL), -- Denim Jacket in Blue
(2, 4, NULL), -- Graphic T-shirt in Red
(3, 1, NULL), -- Leather Wallet in Black
(4, 2, NULL), -- Silk Scarf in White
(7, 1, NULL), -- Wireless Earbuds in Black
(8, 2, NULL); -- Portable Charger in White

-- Insert into product_attribute
INSERT INTO product_attribute (product_id,  attribute_name, attribute_value) VALUES 
(5, 'Material', 'Metal & Fabric'), -- Table Lamp
(6, 'Material', 'Soy Wax'),       -- Scented Candles
(7, 'Battery Life', '24 Hours'),  -- Wireless Earbuds
(8, 'Capacity', '10,000 mAh');    -- Portable Charger

-- Insert into attribute_category
INSERT INTO attribute_category (category_name) VALUES 
('Physical Attributes'),
('Technical Specifications'),
('Design Features'),
('Packaging Details');

-- Insert into attribute_type
INSERT INTO attribute_type (type_name) VALUES 
('Text'),
('Number'),
('Boolean'),
('Date');
