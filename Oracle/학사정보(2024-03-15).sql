-- 학생정보
CREATE TABLE tbl_student(
    st_num	VARCHAR2(5)		PRIMARY KEY,
    st_name	nVARCHAR2(10)	NOT NULL	,
    st_dept	nVARCHAR2(20)	NOT NULL	,
    st_grade	VARCHAR2(2)	NOT NULL	,
    st_tel	VARCHAR2(15)		,
    st_addr	nVARCHAR2(50)		
);

-- 성적정보
CREATE TABLE tbl_score(
    sc_num	VARCHAR2(5)		PRIMARY KEY,
    sc_kor	VARCHAR2(3)	NOT NULL	,
    sc_eng	VARCHAR2(3)	NOT NULL	,
    sc_math	VARCHAR2(3)	NOT NULL	,
    sc_music	VARCHAR2(3)	NOT NULL,	
    sc_art	VARCHAR2(3)	NOT NULL	,
    sc_sw	VARCHAR2(3)	NOT NULL	,
    sc_db	VARCHAR2(3)	NOT NULL	
);
-- 과목코드 테이블
CREATE TABLE tbl_subject (
    su_code	VARCHAR2(5) PRIMARY KEY,
    su_name	nVARCHAR2(8)	NOT NULL	   
);

select * from tbl_subject;

SELECT 
    st_num,
    st_name,
    su_name AS Subject,
    score
FROM 
    (SELECT 
        st_num,
        st_name,
        sc_num,
        sc_kor,
        sc_eng,
        sc_math,
        sc_music,
        sc_art,
        sc_sw,
        sc_db
    FROM 
        tbl_student
    JOIN 
        tbl_score ON tbl_student.st_num = tbl_score.sc_num) StudentScore
UNPIVOT 
    (score FOR su_name IN (sc_kor, sc_eng, sc_math, sc_music, sc_art, sc_sw, sc_db)) UnpivotedScores;

CREATE TABLE tbl_stu_sub(
    r_stcode	VARCHAR2(5)	NOT NULL,
    r_sucode	VARCHAR2(5)	NOT NULL,
	CONSTRAINT ah_pk PRIMARY KEY(r_stcode,r_sucode),
        r_score VARCHAR(3) NOT NULL

);

-- Relation 과 tbl_student 간의 관계설정
ALTER TABLE tbl_stu_sub
ADD CONSTRAINT fk_stcode 
FOREIGN KEY(r_stcode)
REFERENCES tbl_student(st_num);

-- Relation 과 tbl_subject 간의 관계설정
ALTER TABLE tbl_stu_sub
ADD CONSTRAINT fk_sucode
FOREIGN KEY(r_sucode)
REFERENCES tbl_subject(su_code);

 SELECT ST.st_name, SS.r_stcode, SU.su_name, SS.r_score FROM tbl_student ST 
    JOIN tbl_stu_sub SS
    ON st_num = r_stcode 
    JOIN tbl_subject SU
    ON r_sucode = su_code;
    
SELECT * FROM TBL_SUBJECT;