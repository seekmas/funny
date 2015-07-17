class TaskType < ActiveRecord::Base
	has_many :tasks
	has_many :user_tasks
	def to_s
		type_name ? type_name : "未分类"
	end
end
