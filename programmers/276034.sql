/*
프로그래머스
조건에 맞는 개발자 찾기
https://school.programmers.co.kr/learn/courses/30/lessons/276034
*/

SELECT
    DISTINCT d.ID,
    d.EMAIL,
    d.FIRST_NAME,
    d.LAST_NAME
FROM
    DEVELOPERS AS d
JOIN (
    SELECT
        CODE
    FROM
        SKILLCODES
    WHERE
        NAME = 'Python' OR NAME = 'C#'
) AS c
ON
    (d.SKILL_CODE & c.CODE) = c.CODE
ORDER BY
    ID;
