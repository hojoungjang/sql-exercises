/*
프로그래머스
5월 식품들의 총매출 조회하기
https://school.programmers.co.kr/learn/courses/30/lessons/131117
*/

/*
FOOD_PRODUCT
FOOD_ORDER

식품 ID, 식품 이름, 총매출
PRODUCT_ID, PRODUCT_NAME, PRICE * AMOUNT

TOTAL_SALES desc
PRODUCT_ID asc
*/

SELECT
    product.PRODUCT_ID,
    product.PRODUCT_NAME,
    product.price * COALESCE(SUM(orders.AMOUNT), 0) AS TOTAL_SALES
FROM
    FOOD_PRODUCT AS product
LEFT JOIN
    FOOD_ORDER AS orders ON product.PRODUCT_ID=orders.PRODUCT_ID
WHERE
    orders.PRODUCE_DATE BETWEEN '2022-05-01' AND '2022-05-31'
GROUP BY
    product.PRODUCT_ID
ORDER BY
    product.price * COALESCE(SUM(orders.AMOUNT), 0) desc,
    product.PRODUCT_ID asc;
