/*
프로그래머스
저자 별 카테고리 별 매출액 집계하기
https://school.programmers.co.kr/learn/courses/30/lessons/144856
*/

WITH JAN_BOOK_SALES AS (
    SELECT
        b.BOOK_ID,
        b.AUTHOR_ID,
        b.CATEGORY,
        SUM(b.PRICE * bs.SALES) AS TOTAL_SALES
    FROM
        BOOK as b
    JOIN
        BOOK_SALES as bs ON b.BOOK_ID = bs.BOOK_ID
    WHERE
        SALES_DATE BETWEEN "2022-01-01" AND "2022-01-31"
    GROUP BY
        b.AUTHOR_ID, b.CATEGORY
)

SELECT
    a.AUTHOR_ID,
    a.AUTHOR_NAME,
    b.CATEGORY,
    b.TOTAL_SALES
FROM
    AUTHOR as a
JOIN
    JAN_BOOK_SALES as b ON a.AUTHOR_ID = b.AUTHOR_ID
ORDER BY
    a.AUTHOR_ID ASC,
    b.CATEGORY DESC;
