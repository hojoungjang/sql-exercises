/*
https://school.programmers.co.kr/learn/courses/30/lessons/284527
*/

SELECT
    s.SCORE,
    e.EMP_NO,
    e.EMP_NAME,
    e.POSITION,
    e.EMAIL
FROM
    HR_EMPLOYEES AS e
JOIN (
    SELECT
        EMP_NO,
        SUM(SCORE) AS SCORE,
        DENSE_RANK() OVER (ORDER BY SUM(SCORE) DESC) AS RANKING
    FROM
        HR_GRADE
    WHERE
        YEAR = 2022
    GROUP BY
        EMP_NO
) AS s
ON
    s.EMP_NO = e.EMP_NO
WHERE
    s.RANKING = 1;
