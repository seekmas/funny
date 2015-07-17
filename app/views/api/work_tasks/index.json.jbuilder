json.array!(@work_tasks) do |work_task|
  json.id work_task.id
  json.task_title work_task.task_title
  json.task_description work_task.task_description
  json.task_type_id work_task.task_type_id
  json.work_category_id work_task.work_category_id
  json.before_task_days work_task.before_task_days
  json.month work_task.expired_at ? work_task.expired_at.month : nil
  json.work_done work_task.work_done == true ? 1 : 0
  json.expired_at work_task.expired_at ? work_task.expired_at : nil
end
