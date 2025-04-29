/*
프로그래머스
특정 기간동안 대여 가능한 자동차들의 대여비용 구하기
https://school.programmers.co.kr/learn/courses/30/lessons/157339
*/

/*
CAR_RENTAL_COMPANY_CAR - 자동차 정보
CAR_RENTAL_COMPANY_RENTAL_HISTORY - 대여 기록 정보
CAR_RENTAL_COMPANY_DISCOUNT_PLAN - 할인 정책

자동차 종류 enum - '세단', 'SUV', '승합차', '트럭', '리무진'
자동차 옵션 enum - '주차감지센서', '스마트키', '네비게이션', '통풍시트', '열선시트', '후방카메라', '가죽시트'

DURATION_TYPE (대여 기간 종류)
'7일 이상' (대여 기간이 7일 이상 30일 미만인 경우),
'30일 이상' (대여 기간이 30일 이상 90일 미만인 경우),
'90일 이상' (대여 기간이 90일 이상인 경우)

Query condition
- 자동차 종류가 '세단' 또는 'SUV'
- 2022년 11월 1일부터 2022년 11월 30일까지 대여 가능
- 30일간의 대여 금액이 50만원 이상 200만원 미만

자동차 ID, 자동차 종류, 대여 금액(컬럼명: FEE)

대여 금액을 기준으로 내림차순 정렬하고
대여 금액이 같은 경우 자동차 종류를 기준으로 오름차순 정렬
자동차 종류까지 같은 경우 자동차 ID를 기준으로 내림차순
*/

WITH RESERVED_CAR_INFO AS (
    SELECT
        DISTINCT(car.CAR_ID)
    FROM
        CAR_RENTAL_COMPANY_CAR AS car
    LEFT JOIN
        CAR_RENTAL_COMPANY_RENTAL_HISTORY AS history
        ON car.CAR_ID=history.CAR_ID
    WHERE history.END_DATE >= '2022-11-1' AND history.START_DATE <= '2022-11-30'
)

SELECT
    info.CAR_ID,
    info.CAR_TYPE,
    FLOOR(info.DAILY_FEE * (100 - plan.DISCOUNT_RATE) / 100 * 30) as FEE
FROM
    CAR_RENTAL_COMPANY_CAR as info
JOIN
    CAR_RENTAL_COMPANY_DISCOUNT_PLAN AS plan
    ON info.CAR_TYPE=plan.CAR_TYPE
WHERE
    info.CAR_ID NOT IN (SELECT CAR_ID FROM RESERVED_CAR_INFO)
    AND
    info.CAR_TYPE IN ('세단', 'SUV')
    AND
    plan.DURATION_TYPE='30일 이상'
    AND 
    FLOOR(info.DAILY_FEE * (100 - plan.DISCOUNT_RATE) / 100 * 30) >= 500000 
    AND 
    FLOOR(info.DAILY_FEE * (100 - plan.DISCOUNT_RATE) / 100 * 30) < 2000000
ORDER BY
    FEE desc,
    CAR_TYPE asc,
    CAR_ID desc;