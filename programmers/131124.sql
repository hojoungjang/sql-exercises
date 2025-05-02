/*
프로그래머스
그룹별 조건에 맞는 식당 목록 출력하기
https://school.programmers.co.kr/learn/courses/30/lessons/131124
*/

WITH REST_REVIEW_COUNT AS (
    SELECT
        MEMBER_ID,
        COUNT(MEMBER_ID) AS REVIEW_COUNT
    FROM
        REST_REVIEW AS r
    GROUP BY
        MEMBER_ID
)

SELECT
    p.MEMBER_NAME,
    r.REVIEW_TEXT,
    DATE_FORMAT(r.REVIEW_DATE, '%Y-%m-%d') AS REVIEW_DATE
FROM (
    SELECT
        rc.MEMBER_ID
    FROM
        REST_REVIEW_COUNT AS rc
    JOIN (
        SELECT 
            MAX(REST_REVIEW_COUNT.REVIEW_COUNT) AS MAX_COUNT
        FROM
            REST_REVIEW_COUNT
    ) AS mc ON rc.REVIEW_COUNT = mc.MAX_COUNT
) AS rp
JOIN
    MEMBER_PROFILE AS p ON rp.MEMBER_ID = p.MEMBER_ID
JOIN
    REST_REVIEW AS r ON rp.MEMBER_ID = r.MEMBER_ID
ORDER BY
    r.REVIEW_DATE asc,
    r.REVIEW_TEXT asc;
