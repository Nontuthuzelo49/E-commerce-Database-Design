# E-commerce-Database-Design 📦💻

## Overview
This project focuses on designing and implementing a structured and scalable relational database tailored for an e-commerce platform. The database supports essential features such as product variations, custom attributes, and robust category management, ensuring a seamless and flexible system for managing products, inventory, and more.

## Features
- **Comprehensive Product Management**: Handles products, variations (e.g., size, color), and attributes.
- **Customizable Attributes**: Supports dynamic attributes like material, weight, and technical specifications.
- **Efficient Categorization**: Organizes products into categories such as Clothing, Accessories, Home, and Electronics.
- **Scalable Design**: Extends easily for new categories, variations, or attributes.

## Database Schema
The schema includes the following key tables:
1. `product_image` – Manages URLs or file references for product images.
2. `color` – Stores available color options.
3. `product_category` – Classifies products into meaningful categories.
4. `product` – Central table for general product details like name, description, and price.
5. `product_item` – Represents individual purchasable items with variations.
6. `brand` – Stores brand-related information.
7. `product_variation` – Links products to specific variations (e.g., size, color).
8. `size_category` & `size_option` – Organize and specify size details.
9. `product_attribute` – Stores dynamic, customizable attributes for products.
10. `attribute_category` & `attribute_type` – Manage and define attribute groups and data types.

## Technologies and Tools
- **Database Management System:** MySQL
- **Design Tools:** Draw.io, Lucidchart, or MySQL Workbench for ERD creation
- **Programming Languages:** SQL for database creation and management

## Contributor
This project was designed and developed by **Nontuthuzelo Bridget Mahlangu**, demonstrating expertise in SQL, database architecture, and collaborative workflows.

## How to Use
1. **Setup the Database:**
   - Use the provided SQL scripts to create tables and relationships.
   - Insert initial data to populate the e-commerce store.

2. **Customize:**
   - Expand the schema by adding more product categories or attributes.
   - Adjust the data insertions to suit specific business needs.

3. **Run Queries:**
   - Use the database to query product details, filter by categories, and analyze inventory or attributes.

---
