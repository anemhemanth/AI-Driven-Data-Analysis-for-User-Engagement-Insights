use aidatausage;
show tables;
select *from daily_ai_assistant_usage_behavior_dataset;

SELECT COUNT(*) AS total_rows
FROM daily_ai_assistant_usage_behavior_dataset;    #total records

SELECT COUNT(DISTINCT user_id) AS total_users
FROM daily_ai_assistant_usage_behavior_dataset; 

SELECT churn_flag,
COUNT(DISTINCT user_id) AS users
FROM daily_ai_assistant_usage_behavior_dataset
GROUP BY churn_flag;                                 #churn analysis

SELECT ROUND(COUNT(DISTINCT CASE WHEN churn_flag = 1 THEN user_id END) * 100.0 / COUNT(DISTINCT user_id),2) AS churn_rate_percentage
FROM daily_ai_assistant_usage_behavior_dataset;     #churn rate

SELECT device,
COUNT(DISTINCT user_id) AS churned_users
FROM daily_ai_assistant_usage_behavior_dataset
WHERE churn_flag = 1
GROUP BY device
ORDER BY churned_users DESC;                 #churn by device

SELECT usage_category,
COUNT(DISTINCT user_id) AS churned_users
FROM daily_ai_assistant_usage_behavior_dataset
WHERE churn_flag = 1
GROUP BY usage_category
ORDER BY churned_users DESC;          #churn by usage category

SELECT churn_flag, ROUND(AVG(session_length_minutes), 2) AS avg_session_length
FROM daily_ai_assistant_usage_behavior_dataset
GROUP BY churn_flag;                   #AVG session_length

SELECT churn_flag, ROUND(AVG(satisfaction_rating), 2) AS avg_satisfaction
FROM daily_ai_assistant_usage_behavior_dataset
GROUP BY churn_flag;                    #AVG satisfaction rating

SELECT DISTINCT user_id, days_since_usage
FROM daily_ai_assistant_usage_behavior_dataset
WHERE days_since_usage BETWEEN 20 AND 29
ORDER BY days_since_usage DESC;      #highest users

SELECT assistant_model,
COUNT(*) AS total_sessions,
ROUND(AVG(tokens_used), 2) AS avg_tokens
FROM daily_ai_assistant_usage_behavior_dataset
GROUP BY assistant_model
ORDER BY total_sessions DESC;            #model usage and cost 







