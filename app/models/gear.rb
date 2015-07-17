class Gear < ActiveRecord::Base
	belongs_to :component
	belongs_to :gear_type

	def to_s
		gear_key
	end
end
