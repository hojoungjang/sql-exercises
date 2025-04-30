/*
프로그래머스
주문량이 많은 아이스크림들 조회하기
https://school.programmers.co.kr/learn/courses/30/lessons/133027

만약 FIRST_HALF 와 JULY 테이블에 둘중 하나에만 나오는 FLAVOR 값이 있으면
어쩌나 하는 생각에 FULL OUTER JOIN 을 쓰고 싶었으나 MySQL 은 UNION 문법을
사용해야 하여 코드가 지저분해진다. FULL OUTER JOIN 을 구현하지 않아도 답을
통과한다.
*/

WITH TOTAL AS (
    SELECT
        fh.FLAVOR,
        fh.TOTAL_ORDER + IFNULL(july.TOTAL_ORDER, 0) AS TOTAL_ORDER
    FROM
        (SELECT FLAVOR, SUM(TOTAL_ORDER) AS TOTAL_ORDER FROM FIRST_HALF GROUP BY FLAVOR) AS fh
    LEFT JOIN
        (SELECT FLAVOR, SUM(TOTAL_ORDER) AS TOTAL_ORDER FROM JULY GROUP BY FLAVOR) AS july
        ON fh.FLAVOR = july.FLAVOR

    UNION

    SELECT
        july.FLAVOR,
        IFNULL(fh.TOTAL_ORDER, 0) + july.TOTAL_ORDER AS TOTAL_ORDER
    FROM
        (SELECT FLAVOR, SUM(TOTAL_ORDER) AS TOTAL_ORDER FROM JULY GROUP BY FLAVOR) AS july
    LEFT JOIN
        (SELECT FLAVOR, SUM(TOTAL_ORDER) AS TOTAL_ORDER FROM FIRST_HALF GROUP BY FLAVOR) AS fh
        ON july.FLAVOR = fh.FLAVOR
)

SELECT
    FLAVOR
FROM
    TOTAL
ORDER BY
    TOTAL_ORDER desc
LIMIT
    3;
