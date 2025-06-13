/*
https://school.programmers.co.kr/learn/courses/30/lessons/164671
*/

SELECT
    CONCAT('/home/grep/src/', f.BOARD_ID, '/', f.FILE_ID, f.FILE_NAME, f.FILE_EXT) AS FILE_PATH
FROM (
    SELECT
        BOARD_ID
    FROM
        USED_GOODS_BOARD
    ORDER BY
        `VIEWS` DESC
    LIMIT 1
) AS TOP_BOARD
JOIN
    USED_GOODS_FILE AS f
ON
    f.BOARD_ID = TOP_BOARD.BOARD_ID
ORDER BY
    f.FILE_ID DESC;
