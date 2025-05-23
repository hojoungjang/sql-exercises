/*
프로그래머스
업그레이드 할 수 없는 아이템 구하기
https://school.programmers.co.kr/learn/courses/30/lessons/273712
*/

SELECT
    info.ITEM_ID,
    info.ITEM_NAME,
    info.RARITY
FROM
    ITEM_INFO AS info
LEFT JOIN
    ITEM_TREE AS tree
ON
    info.ITEM_ID = tree.PARENT_ITEM_ID
WHERE
    tree.PARENT_ITEM_ID IS null
ORDER BY
    info.ITEM_ID DESC;
