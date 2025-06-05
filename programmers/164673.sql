/*
프로그래머스
조건에 부합하는 중고거래 댓글 조회하기
https://school.programmers.co.kr/learn/courses/30/lessons/164673
*/

SELECT
    b.TITLE,
    b.BOARD_ID,
    r.REPLY_ID,
    r.WRITER_ID,
    r.CONTENTS,
    DATE_FORMAT(r.CREATED_DATE, '%Y-%m-%d') AS CREATED_DATE
FROM
    USED_GOODS_BOARD AS b
JOIN
    USED_GOODS_REPLY AS r
ON
    b.BOARD_ID = r.BOARD_ID
WHERE
    b.CREATED_DATE BETWEEN '2022-10-01' AND '2022-10-31'
ORDER BY
    r.CREATED_DATE,
    b.TITLE;
