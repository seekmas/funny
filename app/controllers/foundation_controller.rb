class FoundationController < ApplicationController

	def put
		if params[:commit]
			@row = Row.create({ :component_id => row_params[:component_id], :user_id => current_user.id })
			unless row_data == nil
				row_data.each do |row|
					@user_column = UserColumn.create({ :gear_id => row[0].to_i, :column_value => row[1].to_s , :row_id => @row.id })
				end
			end
			redirect_to URI(request.referer).path, :notice => "操作成功"
		end
		return
	end


	def remove
	end

	private
	def row_params
		params.require(:implementation).permit(:component_id)
	end

	def row_data
		params[:Component]
	end 
end