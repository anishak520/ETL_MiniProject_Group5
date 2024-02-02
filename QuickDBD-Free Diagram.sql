-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/lXZTcc
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- gym stuff
-- Trainers
-- -
-- first_name VARCHAR(255)
-- last_name VARCHAR(255)
-- gym VARCHAR(255) PK
-- certification VARCHAR(255)
-- classes VARCHAR(255) PK
-- trainer_id VARCHAR(255) PK
-- Members
-- -
-- first_name VARCHAR(255)
-- last_name VARCHAR(255)
-- gym VARCHAR(255) FK - Trainers.gym
-- classes VARCHAR(255) FK - Trainers.classes
-- member_id VARCHAR(255) PK
-- Gym
-- -
-- address VARCHAR(255)
-- zip_code INT
-- classes VARCHAR(255) FK - Trainers.classes
-- member_id VARCHAR(255) FK >-< Members.member_id
-- assigned_trainer_id VARCHAR(255) FK - Trainers.trainer_id
-- Payment
-- -
-- member_id VARCHAR(255) FK -< Members.member_id
-- credit_card_info INT
-- billing_zip_code INT
-- departments
-- -
-- dept_no VARCHAR(255)
-- dept_name VARCHAR(255) PK
-- dept_emp
-- -
-- emp_no INT PK
-- dept_no VARCHAR(255) FK - departments.dept_no
-- dept_manager
-- -
-- dept_no VARCHAR(255) FK - departments.dept_no
-- emp_no INT FK - dept_emp.emp_no
-- employees
-- -
-- emp_no INT FK - dept_emp.emp_no
-- emp_title_id VARCHAR(255) FK - titles.title_id
-- birth_date VARCHAR(255)
-- first_name VARCHAR(255)
-- last_name VARCHAR(255)
-- sex VARCHAR(255)
-- hire_date VARCHAR(255)
-- salaries
-- -
-- emp_no INT FK - dept_emp.emp_no
-- salary INT
-- titles
-- -
-- title_id VARCHAR(255) PK
-- title VARCHAR(255)
-- departments
-- -
-- dept_no varchar PK
-- dept_name varchar UNIQUE
-- dept_emp
-- -
-- emp_no  INT PK FK -  employees.emp_no
-- dept_no VARCHAR(255) FK -  departments.dept_no
-- dept_manager
-- -
-- dept_no VARCHAR(255) PK FK -  departments.dept_no
-- emp_no INT PK FK -  dept_emp.emp_no
-- employees
-- -
-- emp_no INT PK
-- emp_title_id VARCHAR(255) FK - titles.title_id
-- birth_date VARCHAR(255)
-- first_name VARCHAR(255)
-- last_name VARCHAR(255)
-- sex VARCHAR(255)
-- hire_date date
-- salaries
-- -
-- emp_no INT FK -  dept_emp.emp_no
-- salary INT
-- titles
-- -
-- title_id VARCHAR(255) PK
-- title VARCHAR(255)

CREATE TABLE "campaign" (
    "cf_id" INT   NOT NULL,
    "contact_id" INT   NOT NULL,
    "company_name" VARCHAR(100)   NOT NULL,
    "description" VARCHAR(100)   NOT NULL,
    "goal" INT   NOT NULL,
    "pledged" INT   NOT NULL,
    "outcome" VARCHAR(100)   NOT NULL,
    "backers_count" INT   NOT NULL,
    "country" VARCHAR(100)   NOT NULL,
    "currency" VARCHAR(100)   NOT NULL,
    "launch_date" DATE   NOT NULL,
    "end_date" DATE   NOT NULL,
    "category_id" VARCHAR(4)   NOT NULL,
    "subcategory_id" VARCHAR(10)   NOT NULL
);

CREATE TABLE "category" (
    "category_id" INT   NOT NULL,
    "category" VARCHAR(100)   NOT NULL,
    CONSTRAINT "pk_category" PRIMARY KEY (
        "category_id"
     )
);

CREATE TABLE "contacts" (
    "contact_id" INT   NOT NULL,
    "first_name" VARCHAR(100)   NOT NULL,
    "last_name" VARCHAR(100)   NOT NULL,
    "email" VARCHAR(100)   NOT NULL,
    CONSTRAINT "pk_contacts" PRIMARY KEY (
        "contact_id"
     )
);

CREATE TABLE "subcategory" (
    "subcategory_id" VARCHAR(10)   NOT NULL,
    "subcategory" VARCHAR(100)   NOT NULL,
    CONSTRAINT "pk_subcategory" PRIMARY KEY (
        "subcategory_id"
     )
);

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "contacts" ("contact_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "category" ("category_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "subcategory" ("subcategory_id");

