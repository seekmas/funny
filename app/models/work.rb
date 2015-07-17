class Work < ActiveRecord::Base

  acts_as_followable

  has_many :work_tasks
  belongs_to :user
end
