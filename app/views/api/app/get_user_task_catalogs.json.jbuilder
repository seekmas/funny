json.array!(@task_catalogs) do |catalog|
	json.id catalog.id
	json.catalog_name catalog.name
end
