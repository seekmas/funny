json.task do
	json.id @task.id
	json.task_title @task.task_title
	json.task_requirement @task.task_requirement
	json.expired_at_format @task.expired_at_format
end