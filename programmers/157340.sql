/*
프로그래머스
자동차 대여 기록에서 대여중 / 대여 가능 여부 구분하기
https://school.programmers.co.kr/learn/courses/30/lessons/157340
*/

WITH UNAVAILABLE_CARS AS (
    SELECT
        DISTINCT CAR_ID
    FROM
        CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE
        '2022-10-16' BETWEEN START_DATE AND END_DATE
    ORDER BY
        CAR_ID ASC
)

SELECT
    DISTINCT h.CAR_ID,
    IF(ISNULL(uc.CAR_ID), "대여 가능", "대여중") AS AVAILABILITY
FROM
    CAR_RENTAL_COMPANY_RENTAL_HISTORY AS h
LEFT JOIN
    UNAVAILABLE_CARS as uc ON h.CAR_ID = uc.CAR_ID
ORDER BY
    h.CAR_ID DESC;
