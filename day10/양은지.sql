-- 1번
SELECT email, mobile, names, addr
FROM membertbl;

-- 2번
SELECT names AS 도서명, author AS 저자, isbn AS ISBN, to_char(price,'99999') AS 정가
FROM bookstbl
ORDER BY isbn;

-- 3번
SELECT names AS 비대여자명, levels AS 등급, addr AS 주소, NULL AS 대여일
FROM membertbl
WHERE names NOT IN (
    SELECT DISTINCT m.names
    FROM rentaltbl r, membertbl m
    WHERE r.MEMBERIDX = m.IDX
)
ORDER BY levels, names; -- 정렬 순서 다름


-- 4번
SELECT 
    CASE 
        WHEN d.names IS NULL THEN '--합계--'
        ELSE d.names
    END AS names, 
    TO_CHAR(SUM(b.price), '999,999,999') || '원' AS 총합계금액
FROM bookstbl b, divtbl d
WHERE b.division = d.DIVISION
GROUP BY ROLLUP(d.names)
ORDER BY d.names;




COMMIT;