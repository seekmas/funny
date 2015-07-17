class TaskCatalog < ActiveRecord::Base
	
	has_many :tasks, dependent: :destroy
	accepts_nested_attributes_for :tasks, :reject_if => proc { |attr| attr[:task_title].blank? }, :allow_destroy => true

	belongs_to :task_basket
end
