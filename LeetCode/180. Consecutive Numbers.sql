SELECT 
    DISTINCT num AS ConsecutiveNums
FROM(
    SELECT
        num,
        LEAD(num,1) OVER(ORDER BY id) AS next_num,
        LEAD(num,2) OVER(ORDER BY id) AS next_2_nums
    FROM Logs
)t
where num=next_num AND num=next_2_nums;