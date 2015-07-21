json.task do
	json.id @task.id
	json.task_title @task.task_title
	json.task_requirement @task.task_description
	json.task_type @task.task_type_id ? @task.task_type.to_s : ""
	json.task_icon @task.task_type ? @task.task_type.task_icon : "default.png"
	json.expired_at @task.expired_at ? @task.expired_at.strftime("%Y-%m-%d") : @work.target_date - @task.before_task_days.to_i
end
