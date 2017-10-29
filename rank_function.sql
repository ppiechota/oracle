-- TEST if rank takes under consideration 
-- duplicates on determining the ranking of value

CREATE TABLE rank_test (
    val1   NUMBER,
    val2   NUMBER
);


-- inserting dummy data
INSERT INTO rank_test SELECT
    level,
    level + 100
FROM
    dual
CONNECT BY
    level < 100;
    
-- Inserting duplicate value of 5
INSERT INTO rank_test (val1, val2) values (5, 105);
COMMIT;

--------------------------------------------

select * from rank_test order by val1;


-- checking the rank of value 6
-- it is 7th value so rank function takes under consideration duplicates 
-- (rows wise , not value wise)

SELECT
    RANK(
        6
    ) WITHIN GROUP(ORDER BY
        val1
    )
FROM
    rank_test;