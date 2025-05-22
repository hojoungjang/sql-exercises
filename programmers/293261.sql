/*
프로그래머스
물고기 종류 별 대어 찾기
https://school.programmers.co.kr/learn/courses/30/lessons/293261
*/

SELECT
    info.ID,
    name.FISH_NAME,
    info.LENGTH
FROM FISH_INFO AS info
JOIN
    FISH_NAME_INFO AS name
ON info.FISH_TYPE = name.FISH_TYPE
JOIN (
    SELECT
        FISH_TYPE,
        MAX(LENGTH) AS LENGTH
    FROM
        FISH_INFO
    GROUP BY
        FISH_TYPE
) AS max_length
ON
    info.FISH_TYPE = max_length.FISH_TYPE AND info.LENGTH = max_length.LENGTH
ORDER BY
    ID
