/*
프로그래머스
대장균들의 자식의 수 구하기
https://school.programmers.co.kr/learn/courses/30/lessons/299305
*/

SELECT
    d.ID,
    IF(cc.CHILD_COUNT IS null, 0, cc.CHILD_COUNT) AS CHILD_COUNT
FROM
    ECOLI_DATA AS d
LEFT JOIN (
    SELECT
        PARENT_ID,
        COUNT(PARENT_ID) AS CHILD_COUNT
    FROM
        ECOLI_DATA
    GROUP BY
        PARENT_ID
) AS cc
ON 
    d.ID = cc.PARENT_ID
ORDER BY
    d.ID;
