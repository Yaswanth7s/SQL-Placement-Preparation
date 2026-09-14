SELECT  
    h.hacker_id,
    h.name,
    COUNT(c.challenge_id)
FROM Hackers AS h
LEFT JOIN Challenges AS c
ON h.hacker_id=c.hacker_id
GROUP BY h.hacker_id,h.name
HAVING 
    COUNT(challenge_id)=(
        SELECT
            MAX(challenge_count)
        FROM(
            SELECT
                COUNT(challenge_id) AS challenge_count
            FROM Challenges
            GROUP BY hacker_id
        )AS counts
    )
    OR COUNT(challenge_id)IN (
        SELECT 
            challenge_count
        FROM(
            SELECT 
                COUNT(challenge_id) AS challenge_count
            FROM Challenges
            GROUP BY hacker_id
        )AS counts
        GROUP BY challenge_count
        HAVING COUNT(*)=1
    )
ORDER BY COUNT(c.challenge_id) DESC,hacker_id;
