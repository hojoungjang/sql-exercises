/*
https://school.programmers.co.kr/learn/courses/30/lessons/164670
*/

SELECT
    u.USER_ID,
    u.NICKNAME,
    CONCAT(u.CITY, ' ', u.STREET_ADDRESS1, ' ', u.STREET_ADDRESS2) AS '전체주소',
    CONCAT(SUBSTRING(u.TLNO, 1, 3), '-', SUBSTRING(u.TLNO, 4, 4), '-', SUBSTRING(u.TLNO, 8, 4)) AS '전화번호'
FROM
    USED_GOODS_USER AS u
JOIN (
    SELECT
        WRITER_ID
    FROM
        USED_GOODS_BOARD
    GROUP BY
        WRITER_ID
    HAVING
        COUNT(BOARD_ID) >= 3
) AS w
ON
    u.USER_ID = w.WRITER_ID
ORDER BY
    u.USER_ID DESC;
