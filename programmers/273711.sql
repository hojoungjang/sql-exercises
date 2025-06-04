/*
프로그래머스
업그레이드 된 아이템 구하기
https://school.programmers.co.kr/learn/courses/30/lessons/273711
*/

SELECT
    info.ITEM_ID,
    info.ITEM_NAME,
    info.RARITY
FROM
    ITEM_INFO AS info
JOIN (
    SELECT
        tree.ITEM_ID
    FROM
        ITEM_INFO AS info
    JOIN
        ITEM_TREE AS tree
    ON
        info.ITEM_ID = tree.PARENT_ITEM_ID
    WHERE
        info.RARITY = 'RARE'
) AS upgrade_item
ON
    info.ITEM_ID = upgrade_item.ITEM_ID
ORDER BY
    ITEM_ID desc;
