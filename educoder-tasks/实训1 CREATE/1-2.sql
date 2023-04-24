# 请在以下适当的空白处填写SQL语句，完成任务书的要求。空白行可通过回车换行添加。 
CREATE DATABASE TestDb;
use TestDb;
CREATE TABLE t_emp(
    id INT,
    name VARCHAR(32),
    deptId INT,
    salary FLOAT COMMENT 'GAN',
    CONSTRAINT PK_t_emp PRIMARY KEY (id) 
);




/* *********** 结束 ************* */