class WorkCategory < ActiveRecord::Base
  has_many :work_tasks
end
