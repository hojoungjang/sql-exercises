/*
프로그래머스
식품분류별 가장 비싼 식품의 정보 조회하기
https://school.programmers.co.kr/learn/courses/30/lessons/131116
*/

SELECT
    fp.CATEGORY,
    fp.PRICE AS MAX_PRICE,
    fp.PRODUCT_NAME
FROM
    FOOD_PRODUCT AS fp
JOIN (
    SELECT
        CATEGORY,
        MAX(PRICE) AS MAX_PRICE
    FROM
        FOOD_PRODUCT
    WHERE
        CATEGORY IN ("과자", "국", "김치", "식용유")
    GROUP BY
        CATEGORY
) AS mp ON fp.CATEGORY = mp.CATEGORY AND fp.PRICE = mp.MAX_PRICE
ORDER BY
    PRICE DESC;
