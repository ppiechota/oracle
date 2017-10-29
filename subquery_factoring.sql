/*** DDL ***/

create table sub_test (
    id_1 number,
    id_2 number,
    type_1 char(1)
)

/*** DML ***/

select dbms_random.string('U', 1) str from dual;

INSERT INTO sub_test SELECT
    trunc(dbms_random.value(
        1,
        100
    ) ),
    trunc(dbms_random.value(
        10,
        1000
    ) ),
    dbms_random.string(
        'U',
        1
    )
FROM
    dual
CONNECT BY
    level < 1000000;
commit;

/*** TEST CASE ***/

-- BAD

SELECT
    AVG(sum_id_2)
FROM
    (
        SELECT
            id_1,
            type_1,
            sum_id_2
        FROM
            (
                SELECT
                    id_1,
                    type_1,
                    SUM(id_2) AS sum_id_2
                FROM
                    sub_test
                GROUP BY
                    id_1,
                    type_1
            ) base
        WHERE
            base.sum_id_2 > (
                SELECT
                    AVG(sum_id_2)
                FROM
                    (
                        SELECT
                            type_1,
                            SUM(id_2) AS sum_id_2
                        FROM
                            sub_test
                        WHERE
                            id_1 = base.id_1
                        GROUP BY
                            type_1
                    )
            )
    ); 
    
    -- 603398,146875
    -- 603398,146875


--- GOOD

WITH base AS (
    SELECT /*+ materialize */
        id_1,
        type_1,
        SUM(id_2) AS sum_id_2
    FROM
        sub_test
    GROUP BY
        id_1,
        type_1
),ab AS (
    SELECT /*+ materialize */
        id_1,
        AVG(sum_id_2) AS av_sum
    FROM
        base
    GROUP BY
        id_1
) SELECT
    AVG(sum_id_2)
FROM
    (
        SELECT
            base.id_1,
            base.type_1,
            base.sum_id_2
        FROM
            base,
            ab
        WHERE
                base.id_1 = ab.id_1
            AND
                base.sum_id_2 > ab.av_sum
    );