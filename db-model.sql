-- SQL for the database model created in task 1

DROP DATABASE IF EXISTS interview-task;
CREATE DATABASE interview-task;
USE interview-task;

CREATE TABLE `ProductCategory`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE `ProductCategory`
ADD PRIMARY KEY `productcategory_id_primary`(`id`);

CREATE TABLE `Product`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `unitPrice` DECIMAL(8, 2) NOT NULL,
    `productCategoryID` INT UNSIGNED NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE `Product`
ADD PRIMARY KEY `product_id_primary`(`id`);

CREATE TABLE `Customer`(
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(255) NOT NULL,
  `lastName` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NULL,
  `phoneNo` INT NOT NULL,
  PRIMARY KEY(`id`)
);

ALTER TABLE `Customer`
ADD PRIMARY KEY `customer_id_primary`(`id`);

CREATE TABLE `Order`(
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `orderNumber` INT NOT NULL,
  `customerID` INT UNSIGNED NOT NULL,
  `orderStatus` INT NOT NULL,
  `dateReceived` DATETIME(6) DEFAULT CURRENT_TIMESTAMP(6),
  `dateRequired` DATETIME(6) DEFAULT CURRENT_TIMESTAMP(6),
  `dateCompleted` DATETIME,
  `billingAddress` VARCHAR(255),
  `paymentMethod` INT,
  PRIMARY KEY(`id`)
);
ALTER TABLE `Order`
ADD PRIMARY KEY `order_id_primary`(`id`);

CREATE TABLE `OrderLine`(
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `orderID` INT UNSIGNED NOT NULL,
  `productID` INT UNSIGNED NOT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY(`id`)
);
ALTER TABLE `OrderLine`
ADD PRIMARY KEY `orderline_id_primary`(`id`);

CREATE TABLE `Invoice`(
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `invoiceNumber` INT NOT NULL,
  `orderID` INT UNSIGNED NOT NULL,
  `issueDate` DATETIME(6) DEFAULT CURRENT_TIMESTAMP(6),
  `dueDate` DATETIME,
  `totalAmount` DECIMAL(8, 2) NOT NULL,
  `discountAmount` DECIMAL(8, 2) NULL,
  PRIMARY KEY(`id`)
);
ALTER TABLE `Invoice`
ADD PRIMARY KEY `invoice_id_primary`(`id`);




