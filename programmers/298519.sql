/*
프로그래머스
특정 조건을 만족하는 물고기별 수와 최대 길이 구하기
https://school.programmers.co.kr/learn/courses/30/lessons/298519
*/

SELECT
    COUNT(f.ID) AS FISH_COUNT,
    MAX(f.LENGTH) AS MAX_LENGTH,
    f.FISH_TYPE
FROM (
    SELECT
        FISH_TYPE,
        ID,
        COALESCE(LENGTH, 10) AS LENGTH
    FROM
        FISH_INFO
) AS f
GROUP BY
    f.FISH_TYPE
HAVING
    AVG(f.LENGTH) >= 33
ORDER BY
    f.FISH_TYPE;
