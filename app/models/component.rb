class Component < ActiveRecord::Base
	has_many :gears
	accepts_nested_attributes_for :gears, :reject_if => proc { |attr| attr[:gear_key].blank? }, :allow_destroy => true

	before_create :set_available

	def set_available
		self.available = 0
	end
end
