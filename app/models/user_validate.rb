class UserValidate < ActiveRecord::Base

	before_create :set_is_validated_to_false

	def set_is_validated_to_false
		is_validated = false
	end
end
