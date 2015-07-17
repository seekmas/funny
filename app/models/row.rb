class Row < ActiveRecord::Base
	belongs_to :user
	belongs_to :component

	has_many :user_columns, dependent: :destroy
end
