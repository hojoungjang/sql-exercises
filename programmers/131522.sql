/*
프로그래머스
상품 별 오프라인 매출 구하기
https://school.programmers.co.kr/learn/courses/30/lessons/131533
*/

SELECT
    p.PRODUCT_CODE,
    SUM(p.PRICE * os.SALES_AMOUNT) AS SALES
FROM
    PRODUCT AS p
JOIN
    OFFLINE_SALE AS os ON p.PRODUCT_ID = os.PRODUCT_ID
GROUP BY
    p.PRODUCT_CODE
ORDER BY
    SUM(p.PRICE * os.SALES_AMOUNT) DESC,
    p.PRODUCT_CODE ASC;
