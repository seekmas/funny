module Api
	class AuthenticateController < ApplicationController

		skip_before_action :verify_authenticity_token

		def authenticate_user

			@user = User.find_by(:username => params[:phone])

			if @user
				render :json => @user.valid_password?(params[:password]) ? @user : { :error => "密码错误" }
			else
				render :json => { :error => "找不到用户" }
			end

		end

	end
end
