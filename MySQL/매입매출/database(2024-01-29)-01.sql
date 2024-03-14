-- 매입매출 
DROP TABLE tbl_iolist;
CREATE TABLE tbl_iolist(
io_seq	BIGINT		PRIMARY KEY,
io_date	VARCHAR(10)		NOT NULL,
io_time	VARCHAR(10)		NOT NULL,
io_pcode	VARCHAR(6)		NOT NULL,
io_dcode	VARCHAR(5)		NOT NULL,			
io_div	VARCHAR(1)		,
io_quan	INT		,
io_iprice	INT	,	
io_oprice	INT		
);

-- 확인하기
SELECT COUNT(*) FROM tbl_depts;
SELECT COUNT(*) FROM tbl_iolist;
SELECT COUNT(*) FROM tbl_products;

SELECT * FROM tbl_depts;
SELECT * FROM tbl_iolist LIMIT 10;
SELECT * FROM tbl_products;

SELECT * FROM tbl_iolist LIMIT 10;
-- 정규화(제3정규화) 된 데이터의
-- tbl_iolist 테이블만 가지고는 상품에 대한 구체적인 정보(이름포함)
-- 거래처에 대한 구체적인 정보(이름포함)을 알수 없다
-- 이 때 테이블 간에 JOIN 을 실행하여 확인을 해야한다

-- Table 을 JOIN 을 통해 "참조무결성"검증
-- 상품과 매입매출 테이블의 Relation 검증
-- 결과가 하나라도 출력이 되면 tbl_iolist 에는
-- 상품 코드가 데이터가 포함되어 있지만 tbl_products 에는 누락되어 있다
-- 참조관계(참조무결성)가 문제가 있다 라는 것
SELECT io_pcode, p_name
FROM tbl_iolist
	LEFT JOIN tbl_products
		ON io_pcode = p_code
WHERE p_name is NULL; -- NULL 인거 있어?

-- 거래처 데이터와 매입매출 "참조무결성" 검증
SELECT io_dcode, d_name
FROM tbl_iolist
	LEFT JOIN tbl_depts
		ON 	io_dcode = d_code
WHERE d_name IS NULL;

/*
외래키 설정(FOREIGN KEY, FK) : 참조무결성 제약조건 설정
다중 테이블간에 관계에서 참조무결성이 무너지지 않도록
미리 테이블에 제약조건을 설정하고
데이터의 추가, 수정, 삭제를 할 때 적용한다.

외래키는 1:N 관계에서 N 인 테이블에 설정한다
1 의 조건 테이블의 PK 와 연결한다
*/
-- 매입매출과 상품 테이블의 FK 설정
-- 매입매출과 상품은 N : 1 의 관계이다
-- N 인 매입매출 테이블에 FK 를 설정한다
-- tbl iolist 와 tblproducts 를 참고관계로 만들겟다,
-- foreign key 와 reperence 코드를 연결해서 FK_CODE 이름으로 만들어라
ALTER TABLE tbl_iolist 
ADD CONSTRAINT FK_PCODE
FOREIGN KEY (io_pcode)
REFERENCES tbl_products(p_code);

SELECT * FROM tbl_iolist LIMIT 10;

/*
tbl_iolist 에 P00012 상품의 거래데이터가 있기 때문에
tbl_products(상품테이블)에서 P00012 인 상품의 데이터는
절대 삭제할수 없게 되었다
*/
DELETE FROM tbl_products WHERE p_code = "P00012"; -- FK 이어서 삭제,수정할수 없다
SELECT * FROM tbl_iolist WHERE io_pcode = "P00012";

-- 매입매출과 거래처 테이블 간에 FK 설정하기
ALTER TABLE tbl_iolist
ADD CONSTRAINT FK_DCODE
FOREIGN KEY (io_dcode)
REFERENCES tbl_depts(d_code);

