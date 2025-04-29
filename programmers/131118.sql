/*
프로그래머스
서울에 위치한 식당 목록 출력하기
https://school.programmers.co.kr/learn/courses/30/lessons/131118
*/

/*
REST_ID
REST_NAME
FOOD_TYPE
FAVORITES
ADDRESS

REVIEW_SCORE AVG
*/

# SELECT * FROM REST_INFO;

# SELECT * FROM REST_REVIEW;

SELECT
    rest.REST_ID,
    rest.REST_NAME,
    rest.FOOD_TYPE,
    rest.FAVORITES,
    rest.ADDRESS,
    ROUND(AVG(review.REVIEW_SCORE), 2) as SCORE
FROM
    REST_INFO as rest
JOIN
    REST_REVIEW as review
    ON rest.REST_ID=review.REST_ID
WHERE
    rest.ADDRESS LIKE '서울%'
GROUP BY
    rest.REST_ID
ORDER BY
    SCORE desc,
    rest.FAVORITES desc;