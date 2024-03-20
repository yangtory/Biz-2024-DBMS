-- 주문서 프로젝트
/*
주문서 excel 파일의 고객정보, 상품정보 
데이터를 참조하여
1. 주문원장의 '상품코드' 칼럼의 데이터를 분리 후
2. '주문내역 테이블' 로 이전하는 정규화 실행
3. 주문원장, 주문내역, 고객정보, 상품정보
	4가지 Entity 의 개념적 모델링
4. 논리적, 물리적 모델링
5. 테이블 명세 생성

Database : tmp_orderDB
*/

CREATE DATABASE tmp_orderDB;
USE tmp_orderDB;

CREATE TABLE tbl_customer(
c_code	VARCHAR(5)		PRIMARY KEY,
c_name	VARCHAR(5)	NOT NULL	,
c_tel	VARCHAR(15)	NOT NULL	
);

CREATE TABLE tbl_product(
p_code	VARCHAR(6)		PRIMARY KEY,
p_name	VARCHAR(30)	NOT NULL	,
p_category	VARCHAR(15)	NOT NULL	,
p_price	INT	NOT NULL	
);

CREATE TABLE tbl_tmp_order(
o_num	VARCHAR(6)		PRIMARY KEY,
o_date	VARCHAR(10)	NOT NULL	,
o_ccode	VARCHAR(5)	NOT NULL	,
o_pcode1	VARCHAR(6)	NOT NULL,	
o_pcode2	VARCHAR(6)		,
o_pcode3	VARCHAR(6)
);

CREATE TABLE tbl_order(
r_onum	VARCHAR(6)	,
r_ccode	VARCHAR(30)	,
r_pcode	VARCHAR(10)	,
	CONSTRAINT ocp_pk PRIMARY KEY(r_onum,r_ccode,r_pcode),
r_date	VARCHAR(10)	
);

SELECT o_num, o_date, o_ccode, o_pcode1 AS o_pcode
FROM tbl_tmp_order
UNION 
SELECT o_num, o_date, o_ccode, o_pcode2 AS o_pcode
FROM tbl_tmp_order
WHERE o_pcode2 IS NOT NULL
UNION 
SELECT o_num, o_date, o_ccode, o_pcode3 AS o_pcode
FROM tbl_tmp_order
WHERE o_pcode3 IS NOT NULL
ORDER BY o_num;

SELECT * FROM tbl_tmp_order;

SELECT OL.*, C.c_name, P.p_name FROM tbl_order OL
JOIN tbl_customer C
ON c_code = r_ccode 
JOIN tbl_product P
ON p_code = r_pcode
where c_name='김권수';