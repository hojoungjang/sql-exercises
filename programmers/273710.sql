/*
https://school.programmers.co.kr/learn/courses/30/lessons/273710
*/

SELECT
    item.ITEM_ID,
    item.ITEM_NAME
FROM
    ITEM_INFO AS item
JOIN (
    SELECT
        ITEM_ID
    FROM
        ITEM_TREE
    WHERE
        PARENT_ITEM_ID IS NULL
) AS root
ON
    item.ITEM_ID = root.ITEM_ID
ORDER BY
    ITEM_ID;
