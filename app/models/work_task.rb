class WorkTask < ActiveRecord::Base
  belongs_to :work
  belongs_to :work_category
  belongs_to :task_type
  has_many :users
end
