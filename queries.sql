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