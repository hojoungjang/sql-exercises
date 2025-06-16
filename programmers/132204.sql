/*
https://school.programmers.co.kr/learn/courses/30/lessons/132204
*/

SELECT
    apt.APNT_NO,
    p.PT_NAME,
    p.PT_NO,
    apt.MCDP_CD,
    d.DR_NAME,
    apt.APNT_YMD
FROM (
    SELECT
        APNT_NO,
        PT_NO,
        MDDR_ID,
        MCDP_CD,
        APNT_YMD
    FROM
        APPOINTMENT
    WHERE
        MCDP_CD = 'CS' AND
        DATE(APNT_YMD) = '2022-04-13' AND
        APNT_CNCL_YN = 'N'
) AS apt
JOIN
    PATIENT AS p
ON
    apt.PT_NO = p.PT_NO
JOIN
    DOCTOR AS d
ON
    apt.MDDR_ID = d.DR_ID
ORDER BY
    apt.APNT_YMD;
