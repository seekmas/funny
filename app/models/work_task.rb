class WorkTask < ActiveRecord::Base
  belongs_to :work
  belongs_to :work_category

  has_many :users
end
