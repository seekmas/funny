class UserColumn < ActiveRecord::Base
	belongs_to :gear
	belongs_to :row
	
	# before_save :checkbox_null

	# def checkbox_null
	# 	if self.gear.gear_type.type_value.to_s == 'checkbox'
	# 		if self.column_value == nil or self.column_value == ''
	# 			self.column_value = "0"
	# 		end
	# 	end
	# end

end
