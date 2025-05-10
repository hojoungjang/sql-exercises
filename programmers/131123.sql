/*
프로그래머스
즐겨찾기가 가장 많은 식당 정보 출력하기
https://school.programmers.co.kr/learn/courses/30/lessons/131123
*/

SELECT
    r.FOOD_TYPE,
    r.REST_ID,
    r.REST_NAME,
    r.FAVORITES
FROM
    REST_INFO AS r
JOIN (
    SELECT
        FOOD_TYPE,
        MAX(FAVORITES) AS MAX_FAVORITES
    FROM
        REST_INFO
    GROUP BY
        FOOD_TYPE
) AS max_fav ON r.FOOD_TYPE = max_fav.FOOD_TYPE
WHERE
    r.FAVORITES = max_fav.MAX_FAVORITES
ORDER BY
    FOOD_TYPE DESC;
