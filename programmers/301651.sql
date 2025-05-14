/*
프로그래머스
멸종위기의 대장균 찾기
https://school.programmers.co.kr/learn/courses/30/lessons/301651
*/

WITH RECURSIVE ECOLI_GEN AS (
    SELECT 
        ID,
        PARENT_ID,
        1 AS GENERATION
    FROM 
        ECOLI_DATA
    WHERE
        PARENT_ID IS null
    
    UNION ALL
    
    SELECT
        e.ID,
        e.PARENT_ID,
        eg.GENERATION + 1 AS GENERATION
    FROM
        ECOLI_DATA AS e
    JOIN
        ECOLI_GEN AS eg ON eg.ID = e.PARENT_ID
)

SELECT
    COUNT(eg1.ID) AS COUNT,
    eg1.GENERATION
FROM
    ECOLI_GEN as eg1
LEFT JOIN
    ECOLI_GEN as eg2 ON eg1.ID = eg2.PARENT_ID
WHERE
    eg2.PARENT_ID IS null
GROUP BY
    GENERATION
ORDER BY
    GENERATION;
