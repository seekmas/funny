json.array!(@works) do |work|
  json.extract! work, :id, :work_title, :user_id, :work_description
  json.url work_url(work, format: :json)
end
