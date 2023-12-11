USE cd; 
SELECT 
  DATE(b.starttime) AS date, 
  SUM(IF(b.memid = 0, f.guestcost * b.slots, f.membercost * b.slots)) as revenue,
  AVG(SUM(IF(b.memid = 0, f.guestcost * b.slots, f.membercost * b.slots))) OVER (ORDER BY DATE(b.starttime) ROWS BETWEEN 15 PRECEDING AND CURRENT ROW) AS moving_average
FROM bookings b 
LEFT JOIN facilities f ON b.facid = f.facid 
WHERE DATE(b.starttime) BETWEEN '2012-08-01' AND '2012-08-31' 
GROUP BY DATE(b.starttime)
ORDER BY DATE(b.starttime);