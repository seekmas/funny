class UserTaskCatalog < ActiveRecord::Base
	has_many :user_tasks
	belongs_to :project
end
