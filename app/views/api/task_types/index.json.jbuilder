json.array!(@task_types) do |task_type|
  json.extract! task_type, :id, :type_name, :task_icon
end
