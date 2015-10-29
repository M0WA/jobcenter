CREATE OR REPLACE FUNCTION jobcenter.nexttask(error boolean, workflow_id integer, task_id integer, job_id bigint)
 RETURNS nexttask
 LANGUAGE sql
 IMMUTABLE
AS $function$SELECT (error, workflow_id, task_id, job_id)::nexttask;$function$
