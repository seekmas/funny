module Design
	class DefaultController < AdminController

		before_action :authenticate_user!
		before_action :form_of_component

		def index
			if params[:commit]
				@component = Component.new
				@component.update(component_params)
			end
		end

		

		def struct
			
		end

		def edit
			@component = Component.find(params[:id])

			if params[:commit]
				@component.update(component_params)
				redirect_to design_default_edit_get_path(params[:id]), :notice => "更新好了"
			end

		end

		def form
			@component = Component.find(params[:id])
			@rows = Row.where(:component_id => params[:id]).all
			if params[:commit]

				@row = Row.create({ :component_id => row_params[:component_id], :user_id => current_user.id })
				unless row_data == nil
					row_data.each do |row|
						@user_column = UserColumn.create({ :gear_id => row[0].to_i, :column_value => row[1].to_s , :row_id => @row.id })
					end
				end

				redirect_to design_default_form_get_path(params[:id])
				return
			end
		end

		private
		def form_of_component
			@component = Component.new
			@gear = Gear.new
			@component.gears << @gear
		end

		def row_params
			params.require(:implementation).permit(:component_id)
		end

		def row_data
			params[:Component]
		end 

		def component_params
			params.require(:component).permit(:name, :description, :available, :gears_attributes => [:id, :gear_key, :gear_description, :gear_type_id, :select_data])
		end

	end
end