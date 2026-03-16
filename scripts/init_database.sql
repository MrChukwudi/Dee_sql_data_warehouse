-- This particular script must be run in the postgress 'Master' database level:
-- Kick everyone out
SELECT pg_terminate_backend(pid)  -- The "Action" (Kill this process)
FROM pg_stat_activity            -- The "Source" (The list of all active users)
WHERE datname = 'deedatawarehouse' -- The "Filter" (Only people in MY database)
  AND pid <> pg_backend_pid();   -- The "Safety" (Don't kill MY current connection)

-- Drop and Rebuild
DROP DATABASE IF EXISTS deedatawarehouse;
CREATE DATABASE deedatawarehouse;


