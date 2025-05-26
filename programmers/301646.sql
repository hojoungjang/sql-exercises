/*
프로그래머스
특정 형질을 가지는 대장균 찾기
https://school.programmers.co.kr/learn/courses/30/lessons/301646
*/

SELECT
    COUNT(ID) AS COUNT
FROM
    ECOLI_DATA
WHERE
    GENOTYPE & 2 = 0 AND (GENOTYPE & 1 = 1 OR GENOTYPE & 4 = 4);
