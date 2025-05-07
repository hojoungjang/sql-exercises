/*
프로그래머스
FrontEnd 개발자 찾기
https://school.programmers.co.kr/learn/courses/30/lessons/276035
*/

WITH FRONT_END_SKILLS AS (
    SELECT
        s.NAME,
        s.CODE
    FROM
        SKILLCODES AS s
    WHERE
        s.CATEGORY = "Front End"
)

SELECT
    DISTINCT d.ID,
    d.EMAIL,
    d.FIRST_NAME,
    d.LAST_NAME
FROM
    DEVELOPERS AS d
CROSS JOIN
    FRONT_END_SKILLS AS s
WHERE
    (d.SKILL_CODE & s.CODE) = s.CODE
ORDER BY
    d.ID ASC
;