module Ajax
	class ProjectController < ApplicationController

		before_action :authenticate_user!
		before_action :get_project

		def set_project_date
			date = DateTime.parse(params[:date])
			@project.project_date = date
			@project.save
			render :json => @date
		end

	end
end