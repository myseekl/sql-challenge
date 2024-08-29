CREATE TABLE "salaries" (
  "emp_no" integer,
  "salary" integer,
  PRIMARY KEY ("emp_no", "salary")
);

CREATE TABLE "departments" (
  "dept_no" character varying(4),
  "dept_name" character varying(30),
  PRIMARY KEY ("dept_no")
);

CREATE TABLE "titles" (
  "title_id" character varying(5),
  "title" character varying(30),
  PRIMARY KEY ("title_id")
);

CREATE TABLE "employees" (
  "emp_no" integer,
  "emp_title_id" character varying(5),
  "birth_date" date,
  "first_name" character varying(30),
  "last_name" character varying(30),
  "sex" character varying(1),
  "hire_date" date,
  PRIMARY KEY ("emp_no"),
  CONSTRAINT "FK_employees.emp_title_id"
    FOREIGN KEY ("emp_title_id")
      REFERENCES "titles"("title_id")
);

CREATE TABLE "dept_emp" (
  "emp_no" integer,
  "dept_no" character varying(4),
  PRIMARY KEY ("emp_no", "dept_no"),
  CONSTRAINT "FK_dept_emp.emp_no"
    FOREIGN KEY ("emp_no")
      REFERENCES "employees"("emp_no"),
  CONSTRAINT "FK_dept_emp.dept_no"
    FOREIGN KEY ("dept_no")
      REFERENCES "departments"("dept_no")
);

CREATE TABLE "dept_manager" (
  "dept_no" character varying(4),
  "emp_no" integer,
  PRIMARY KEY ("dept_no", "emp_no"),
  CONSTRAINT "FK_dept_manager.dept_no"
    FOREIGN KEY ("dept_no")
      REFERENCES "departments"("dept_no"),
  CONSTRAINT "FK_dept_manager.emp_no"
    FOREIGN KEY ("emp_no")
      REFERENCES "dept_emp"("emp_no")
);

