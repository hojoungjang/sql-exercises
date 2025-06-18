/*
https://school.programmers.co.kr/learn/courses/30/lessons/298518
*/

SELECT
    COUNT(*) AS FISH_COUNT
FROM
    FISH_INFO AS info
JOIN (
    SELECT
        FISH_TYPE
    FROM
        FISH_NAME_INFO
    WHERE
        FISH_NAME = 'BASS' OR
        FISH_NAME = 'SNAPPER'
) AS type
ON
    info.FISH_TYPE = type.FISH_TYPE;
