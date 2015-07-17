class AdminController < ApplicationController
	before_action :authenticate_user!
	before_action :get_components
	layout "admin"

	private
	def get_components
		@components = Component.all
	end
end
