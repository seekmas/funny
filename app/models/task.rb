class Task < ActiveRecord::Base
	belongs_to :task_catalog
	belongs_to :task_type
end
