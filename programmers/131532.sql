/*
프로그래머스
https://school.programmers.co.kr/learn/courses/30/lessons/131532
*/
SELECT
    YEAR(s.SALES_DATE) AS `YEAR`,
    MONTH(s.SALES_DATE) AS `MONTH`,
    u.GENDER,
    COUNT(DISTINCT u.USER_ID) AS USERS
FROM
    USER_INFO AS u
JOIN (
    SELECT
        USER_ID,
        SALES_DATE
    FROM
        ONLINE_SALE
) AS s
ON
    u.USER_ID = s.USER_ID AND u.GENDER IS NOT NULL
GROUP BY
    YEAR(s.SALES_DATE),
    MONTH(s.SALES_DATE),
    u.GENDER
ORDER BY
    YEAR(s.SALES_DATE),
    MONTH(s.SALES_DATE),
    u.GENDER;
