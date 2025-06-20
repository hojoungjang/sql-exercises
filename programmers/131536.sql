/*
프로그래머스
재구매가 일어난 상품과 회원 리스트 구하기
https://school.programmers.co.kr/learn/courses/30/lessons/131536
*/

SELECT
    USER_ID,
    PRODUCT_ID
FROM
    ONLINE_SALE
GROUP BY
    USER_ID, PRODUCT_ID
HAVING
    COUNT(*) > 1
ORDER BY
    USER_ID ASC,
    PRODUCT_ID DESC;
