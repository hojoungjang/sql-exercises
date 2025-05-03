/*
프로그래머스
대여 횟수가 많은 자동차들의 월별 대여 횟수 구하기
https://school.programmers.co.kr/learn/courses/30/lessons/151139
*/

WITH CARS as (
    SELECT
        CAR_ID
    FROM
        CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE
        START_DATE BETWEEN '2022-08-01' AND '2022-10-31'
    GROUP BY
        CAR_ID
    HAVING
        COUNT(HISTORY_ID) >= 5
    ORDER BY
        CAR_ID asc
)

SELECT
    MONTH(history.START_DATE) AS MONTH,
    c.CAR_ID,
    COUNT(history.HISTORY_ID) AS RECORDS
FROM
    CAR_RENTAL_COMPANY_RENTAL_HISTORY as history
JOIN
    CARS AS c ON c.CAR_ID = history.CAR_ID
WHERE
    START_DATE BETWEEN '2022-08-01' AND '2022-10-31'
GROUP BY
    DATE_FORMAT(history.START_DATE, '%c'), c.CAR_ID
ORDER BY
    MONTH(history.START_DATE) ASC,
    c.CAR_ID DESC
;
