-- db create

-- tax_period
CREATE TABLE tax_period (
 idx       INT NOT NULL AUTO_INCREMENT,
 start_date    DATE,
 end_date    DATE, 
  PRIMARY KEY(idx)
);

-- tax 

CREATE TABLE tax (
 idx       INT  NOT NULL AUTO_INCREMENT ,
 period_idx     INT ,
 min_base   BIGINT ,
 max_base   BIGINT ,
 tax_rate    FLOAT ,
 pro_deduct  BIGINT ,

 PRIMARY KEY  (idx),
  FOREIGN KEY (period_idx) REFERENCES  tax_period(idx)
);
---삽입 쿼리 
--날짜 삽입 ~ 다음 시기가 업데이트 되면 마지막 자료 하나 전의 end_date를 마지막 자료의 start_date -1 로 업데이트 
SET @start_date = '2014-01-01' ;
SET @end_date = '2099-12-31';

SET @day_before = @start_date  -  INTERVAL 1 DAY;
UPDATE tax_period SET end_date = @day_before WHERE  idx = (SELECT idx  FROM  tax_period ORDER BY idx DESC LIMIT 1);
INSERT INTO tax_period (start_date, end_date) VALUES (@start_date, @end_date);


[1200,4600,8800,30000,1]
[1200,4600,8800,15000,1] [0.06, 0.15,0.24,0.35,0.38] [0, 108,522,1490,1940]
[1200,4600,8800,15000,50000,1]
[1200,4600,8800,15000,50000,1]

SET @maximum  = 9223372036854775806;
SET @min_base = 0;


SET @max_base = 1;
SET @tax_rate = 0.38;
SET @pro_deduct = 19400000 ;

SET @max_base = IF (@max_base = 1, @maximum, @max_base );
SELECT @last_period := idx  FROM  tax_period ORDER BY idx DESC LIMIT 1;
INSERT INTO tax (period_idx,min_base,max_base,tax_rate,pro_deduct)
VALUES (@last_period, @min_base ,@max_base,@tax_rate,@pro_deduct) ;
SELECT @min_base := max_base from tax ORDER BY idx DESC LIMIT 1; 
SET @min_base = IF (@max_base = @maximum, 0, @min_base + 1);






-- 조회 쿼리 
-- 주어진 값 : @value = 3000000 , @date = '2015-10-11'

SELECT tax_rate, pro_deduct 
FROM tax 

WHERE 
period_idx = (SELECT idx FROM tax_period WHERE start_date <= @date and end_date>=@date  ) 
AND min_base<=@value  
AND max_base>=@value;
