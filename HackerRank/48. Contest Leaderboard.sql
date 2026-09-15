SELECT
    h.hacker_id,
    h.name,
    SUM(high_scores) AS TotalScore
FROM Hackers AS h
JOIN(
    SELECT
        s.hacker_id,
        s.challenge_id,
        MAX(s.score) AS high_scores
    FROM Submissions AS s
    GROUP BY s.hacker_id,s.challenge_id
)t 
ON h.hacker_id=t.hacker_id
GROUP BY h.hacker_id,h.name
HAVING TotalScore>0
ORDER BY TotalScore DESC,h.hacker_id;