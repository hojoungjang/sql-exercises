/*
https://school.programmers.co.kr/learn/courses/30/lessons/293257
*/

SELECT
    FISH_COUNT,
    COALESCE(name.FISH_NAME, '') AS FISH_NAME
FROM (
    SELECT
        FISH_TYPE,
        COUNT(*) AS FISH_COUNT
    FROM 
        FISH_INFO
    GROUP BY
        FISH_TYPE
) AS info
LEFT JOIN
    FISH_NAME_INFO AS name
ON
    info.FISH_TYPE = name.FISH_TYPE
ORDER BY
    FISH_COUNT DESC;
