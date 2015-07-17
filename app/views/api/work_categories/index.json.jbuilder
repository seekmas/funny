json.array!(@work_categories) do |work_category|
  json.extract! work_category, :id, :name, :work_id, :is_allowed
end
