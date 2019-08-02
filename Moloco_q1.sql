SELECT site_id, COUNT(DISTINCT user_id) AS unique_users FROM views
WHERE country_id='BDV'
GROUP BY 1;

SELECT user_id, site_id, COUNT(*) AS visits FROM views
WHERE ts BETWEEN '2019-02-03' AND '2019-02-05'
GROUP BY 1, 2
HAVING COUNT(*) > 10;

SELECT site_id, COUNT(DISTINCT user_id) AS last_time_site FROM views v
WHERE ts = (SELECT MAX(ts) FROM views v2 WHERE v2.user_id = v.user_id)
GROUP BY 1
ORDER BY last_time_site DESC;

SELECT COUNT(*) FROM
(
SELECT user_id, site_id FROM views v
WHERE ts = (SELECT MAX(ts) FROM views v2 WHERE v2.user_id = v.user_id)
) t1
JOIN
(
SELECT user_id, site_id FROM views v
WHERE ts = (SELECT MIN(ts) FROM views v2 WHERE v2.user_id = v.user_id
)t2
ON t1.user_id = t2.user_id
AND t1.site_id = t2.site_id;
