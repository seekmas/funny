class GearType < ActiveRecord::Base
	has_many :gear

	validates :name, :presence => true

	def to_s
		name
	end
end
