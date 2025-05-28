/*
프로그래머스
부모의 형질을 모두 가지는 대장균 찾기
https://school.programmers.co.kr/learn/courses/30/lessons/301647
*/
SELECT
    ecoli.ID,
    ecoli.GENOTYPE,
    parent.GENOTYPE AS PARENT_GENOTYPE
FROM
    ECOLI_DATA AS ecoli
JOIN
    ECOLI_DATA AS parent
ON
    ecoli.PARENT_ID = parent.ID
WHERE
    ecoli.GENOTYPE & parent.GENOTYPE = parent.GENOTYPE
ORDER BY
    ID;
