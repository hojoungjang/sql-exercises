/*
프로그래머스
자동차 대여 기록 별 대여 금액 구하기
https://school.programmers.co.kr/learn/courses/30/lessons/151141
*/

WITH HISTORY AS (
    SELECT
        h.HISTORY_ID,
        c.CAR_TYPE,
        c.DAILY_FEE,
        DATEDIFF(h.END_DATE, h.START_DATE) + 1 AS DURATION
    FROM
        CAR_RENTAL_COMPANY_RENTAL_HISTORY AS h
    JOIN CAR_RENTAL_COMPANY_CAR AS c ON c.CAR_ID = h.CAR_ID
)

SELECT
    h.HISTORY_ID,
    ROUND(h.DURATION * (1 - COALESCE(p.DISCOUNT_RATE, 0)/100) * h.DAILY_FEE) AS FEE
FROM HISTORY AS h
LEFT JOIN 
    CAR_RENTAL_COMPANY_DISCOUNT_PLAN AS p 
        ON
            p.CAR_TYPE = h.CAR_TYPE
            AND 
            CASE
                WHEN h.DURATION >= 7 AND h.DURATION < 30 THEN p.DURATION_TYPE = '7일 이상'
                WHEN h.DURATION >= 30 AND h.DURATION < 90 THEN p.DURATION_TYPE = '30일 이상'
                WHEN h.DURATION >= 90 THEN p.DURATION_TYPE = '90일 이상'
            END
WHERE h.CAR_TYPE = '트럭'
ORDER BY
    FEE DESC,
    HISTORY_ID DESC
