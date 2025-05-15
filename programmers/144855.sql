/*
프로그래머스
카테고리 별 도서 판매량 집계하기
https://school.programmers.co.kr/learn/courses/30/lessons/144855
*/

SELECT
    b.CATEGORY,
    SUM(bs.SALES) AS TOTAL_SALES
FROM
    BOOK AS b
JOIN
    BOOK_SALES AS bs ON b.BOOK_ID = bs.BOOK_ID
WHERE
    bs.SALES_DATE BETWEEN "2022-01-01" AND "2022-01-31"
GROUP BY
    b.CATEGORY
ORDER BY
    b.CATEGORY;
