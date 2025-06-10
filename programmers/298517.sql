/*
프로그래머스
가장 큰 물고기 10마리 구하기
https://school.programmers.co.kr/learn/courses/30/lessons/298517
*/

SELECT
    ID,
    LENGTH
FROM
    FISH_INFO
ORDER BY
    COALESCE(LENGTH, 0) DESC,
    ID ASC
LIMIT 10;
