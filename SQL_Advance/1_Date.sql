-- เปลี่ยน Format เป็น date โดยใช้ :: date
SELECT job_posted_date::date
FROM job_postings_fact
LIMIT 10;

-- บอก time zone เดิมก่อนค่อยบอก time zone ใหม่
SELECT job_posted_date at time zone 'UTC' at time zone 'EST'
FROM job_postings_fact
LIMIT 10;

SELECT  
    EXTRACT(MONTH FROM job_postings_fact.job_posted_date) as month_posted, -- day month year
    count(job_postings_fact.job_id) as number_of_posted
FROM
    job_postings_fact
WHERE
    job_postings_fact.job_title_short like 'Data Analyst'
Group by
    month_posted
ORDER BY number_of_posted DESC
LIMIT 12;