/*
프로그래머스
연간 평가점수에 해당하는 평가 등급 및 성과금 조회하기
https://school.programmers.co.kr/learn/courses/30/lessons/284528
*/

SELECT
    e.EMP_NO,
    e.EMP_NAME,
    CASE
        WHEN s.SCORE >= 96 THEN 'S'
        WHEN s.SCORE >= 90 THEN 'A'
        WHEN s.SCORE >= 80 THEN 'B'
        ELSE 'C'
    END AS GRADE,
    CASE
        WHEN s.SCORE >= 96 THEN 0.2 * e.SAL
        WHEN s.SCORE >= 90 THEN 0.15 * e.SAL
        WHEN s.SCORE >= 80 THEN 0.1 * e.SAL
        ELSE 0
    END AS BONUS
FROM
    HR_EMPLOYEES AS e
JOIN (
    SELECT
        EMP_NO,
        AVG(SCORE) AS SCORE
    FROM
        HR_GRADE
    GROUP BY
        EMP_NO
) AS s
ON
    e.EMP_NO = s.EMP_NO
ORDER BY
    EMP_NO;