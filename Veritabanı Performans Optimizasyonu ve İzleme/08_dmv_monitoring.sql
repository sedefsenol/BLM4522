

USE PerformanceDB;
GO



SELECT TOP 10
    qs.total_worker_time AS TotalCPUTime,
    qs.execution_count,
    qs.total_elapsed_time AS TotalElapsedTime,
    qs.total_logical_reads AS LogicalReads,
    st.text AS QueryText
FROM sys.dm_exec_query_stats qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) st
ORDER BY qs.total_worker_time DESC;
GO

SELECT TOP 10
    qs.execution_count,
    qs.total_worker_time,
    st.text AS QueryText
FROM sys.dm_exec_query_stats qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) st
ORDER BY qs.execution_count DESC;
GO


SELECT
    type,
    pages_kb,
    virtual_memory_committed_kb
FROM sys.dm_os_memory_clerks
ORDER BY pages_kb DESC;
GO


SELECT
    name AS FileName,
    physical_name,
    size * 8 / 1024 AS SizeMB
FROM sys.master_files
WHERE database_id = DB_ID('PerformanceDB');
GO



SELECT
    session_id,
    login_name,
    status,
    cpu_time,
    memory_usage
FROM sys.dm_exec_sessions
WHERE is_user_process = 1;
GO