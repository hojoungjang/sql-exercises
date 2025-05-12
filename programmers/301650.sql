/*
프로그래머스
특정 세대의 대장균 찾기
https://school.programmers.co.kr/learn/courses/30/lessons/301650#
*/

WITH RECURSIVE GRAPH as (
    SELECT
        ID,
        PARENT_ID,
        1 as GEN
    FROM
        ECOLI_DATA
    WHERE
        PARENT_ID IS NULL
    
    UNION ALL
    
    SELECT
        d.ID,
        d.PARENT_ID,
        g.GEN + 1 AS GEN
    FROM
        ECOLI_DATA AS d
    JOIN
        GRAPH AS g ON g.ID = d.PARENT_ID
    WHERE
        g.GEN < 3
)

SELECT ID FROM GRAPH WHERE GEN = 3 ORDER BY ID ASC;
