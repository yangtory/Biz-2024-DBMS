CREATE DATABASE school1DB;
DROP DATABASE school1DB;
USE school1DB;

CREATE TABLE tbl_student(
st_code	VARCHAR(5)		PRIMARY KEY,
st_name	VARCHAR(10)	NOT NULL	,
st_dept	VARCHAR(20)	NOT NULL	,
st_grade	VARCHAR(2)	NOT NULL	,
st_tel	VARCHAR(15)		,
st_addr	VARCHAR(50)		
);

CREATE TABLE tbl_subject(
su_code	VARCHAR(5)		PRIMARY KEY,
su_name	VARCHAR(8)	NOT NULL
);

CREATE TABLE tbl_stu_sub(
r_stcode	VARCHAR(5)	NOT NULL,
r_sucode	VARCHAR(5)	NOT NULL,
	CONSTRAINT ss_pk PRIMARY KEY(r_stcode,r_sucode),
    r_score	VARCHAR(3)	NOT NULL
);

ALTER TABLE tbl_stu_sub
ADD CONSTRAINT fk_stcode 
FOREIGN KEY(r_stcode)
REFERENCES tbl_student(st_code);

ALTER TABLE tbl_stu_sub
ADD CONSTRAINT fk_sucode
FOREIGN KEY(r_sucode)
REFERENCES tbl_subject(su_code);

 SELECT ST.st_name, SS.r_stcode, SU.su_name, SS.r_score FROM tbl_student as ST 
    JOIN tbl_stu_sub as SS
    ON st_code = r_stcode 
    JOIN tbl_subject as SU
    ON r_sucode = su_code
    WHERE st_name = '갈한수';

SELECT * FROM tbl_subject;
