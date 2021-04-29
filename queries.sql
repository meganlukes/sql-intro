To create database:
  cd sdg
  cd sql-intro
  createdb CompanyDatabase
  pgcli CompanyDatabase
To create table with [NOT NULL] column and primary key: 
  CREATE TABLE "Employees" ( "EmployeeID" SERIAL PRIMARY KEY, "FullName" TEXT NOT NULL, "Salary" INT, "JobPosition" TEXT, "PhoneExtension" INT, "IsPartTime" BOOLEAN );
To create row: 
  INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime") VALUES ('name', 'pay', 'title', 'extension', 'status');
To select columns for all employees:
  SELECT * FROM "Employees";
To select only full names and phone extensions for full-time employees:
  SELECT "FullName", "PhoneExtension" FROM "Employees" WHERE "IsPartTime" = 'false';
To insert a new part-time software developer employee with a salary of 450:
  INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime") VALUES ('Ada Lovelace', '450', 'Software Developer', '5309', 'true');
To update all employees that are cooks to have a salary of 500:
  UPDATE "Employees" SET "Salary" = '500' WHERE "JobPosition" = 'Cook';
To delete all employees that have the full name of "Lazy Larry":
  DELETE FROM "Employees" WHERE "FullName" = 'Lazy Larry';
To add a ParkingSpot column to the table as text that can store up to 10 characters:
  ALTER TABLE "Employees" ADD COLUMN "ParkingSpot" VARCHAR(10);
To add a table named Departments with ID as a primary key, DepartmentName as text, and Building as text:
  CREATE TABLE "Departments" ( "Id" SERIAL PRIMARY KEY, "DepartmentName" TEXT, "Building" TEXT );
To add a Foreign key DepartmentID to Employees Table:
  ALTER TABLE "Employees" ADD COLUMN "DepartmentID" INTEGER NULL REFERENCES "Departments" ("Id");
To add a table named Products with Id as primary key, Price as float, Name as text, Description as text, QuantityInStock as int:
  CREATE TABLE "Products" ( "Id" SERIAL PRIMARY KEY, "Price" FLOAT, "Name" TEXT, "Description" TEXT, "QuantityInStock" INT );
To add a table named Orders with Id as primary key, OrderNumber as text, DatePlaced as date, and Email as text
  CREATE TABLE "Orders" ( "Id" SERIAL PRIMARY KEY, "Order Number" TEXT, "DatePlaced" DATE, "Email" TEXT );
To insert new department:
  INSERT INTO "Departments" ( "DepartmentName", "Building" ) VALUES ('Development', 'Main' );
To insert new product:
  INSERT INTO "Products" ( "Price", "Name", "Description", "QuantityInStock" ) VALUES ('99.99', 'Flowbee', 'Perfect for haircuts', '3' );
To create table "ProductOrders" that will join products with orders and have an OrderQuantity INT:
  CREATE TABLE "ProductOrders" ("Id" SERIAL PRIMARY KEY, "ProductID" INTEGER REFERENCES "Products" ("Id"), "OrderID" INTEGER REFERENCES "Orders" ("Id"), "OrderQuantity" INT );

Create a new order:
  INSERT INTO "Orders" ( "Order Number", "Email") VALUES ('x529', 'person@example.com');
Add 3 widgets to order:
  INSERT INTO "ProductOrders" ( "ProductID", "OrderID", "OrderQuantity" ) VALUES ( '1', '1', '3' );
Add 2 Flowbees to order:
  INSERT INTO "ProductOrders" ( "ProductID", "OrderID", "OrderQuantity" ) VALUES ( '2', '1', '2' );
Return all employees that work in a specific building:
  SELECT * FROM "Employees" JOIN "Departments" ON "Employees"."DepartmentID" = "Departments"."Id" WHERE "Departments"."Building" = 'North Side';

  SELECT * FROM "Employees" JOIN "Departments" ON "Employees"."DepartmentID" = "Departments"."Id" WHERE "Departments"."Building" = 'East Side';

  SELECT * FROM "Employees" JOIN "Departments" ON "Employees"."DepartmentID" = "Departments"."Id" WHERE "Departments"."Building" = 'Main';
Return all orders that contain the product id of 2
  SELECT "Orders"."Order Number", "Products"."Id" 
  FROM "Orders" 
  JOIN "ProductOrders" ON "ProductOrders"."OrderID" = "Orders"."Id"
  JOIN "Products" ON "Products"."Id" = "ProductOrders"."ProductID" WHERE "Products"."Id" = '2';
Find the quantity of Flowbee products from order X529
  SELECT "Orders"."OrderNumber", "Products"."Name", "ProductOrders"."OrderQuantity"
  FROM "ProductOrders"
  JOIN "Products" ON "Products"."Id" = "ProductOrders"."ProductId"
  JOIN "Orders" ON "Orders"."Id" = "ProductOrders"."OrderId"
  WHERE ("Products"."Name" = 'Flowbee');
  