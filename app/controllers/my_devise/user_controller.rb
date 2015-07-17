module MyDevise
	class UserController < ApplicationController 
		
		layout "default"
		def login
		end

		def register

			if current_user
				redirect_to root_path
			end

			@user = User.new

			if params[:user]
				flash[:phone] = params[:user][:username]
				flash[:password] = params[:user][:password]

				if params[:user][:password] == nil or params[:user][:password].length < 6
					redirect_to user_register_path, :flash => { :password_is_too_short => "密码不应少于6位" }
					return
				end

				if params[:user][:username].length != 11 or params[:user][:username][/\d{11}/] == nil
					redirect_to user_register_path, :flash => { :username_has_been_taken => "请填写正确的手机号" }
					return
				end



				if User.find_by({ :username => params[:user][:username] }) == nil
					code = params[:user][:validate_code].to_i
					#if validate_code = UserValidate.find_by({ :phone => params[:user][:username], :validate_code => code })
					@user = User.create({
						:email => "#{params[:user][:username]}@hunge.me",
						:username => params[:user][:username], 
						:password => params[:user][:password], 
					})

					if @user
						sign_in('user' , @user)
						redirect_to root_path, :flash => { :notice => "注册成功" }
						return
					end
					# else
					# 	redirect_to user_register_path, :flash => { :code_is_failed => "验证码错误" }
					# 	return
				else
					redirect_to user_register_path, :flash => { :username_has_been_taken => "用户已经注册" }
					return
				end

			end
		end

		def authenticate
		end

		def send_sms()
			phone= params[:phone]
			password= params[:password]
			
			if phone == nil or password == nil
				render :json => { :response => '手机号/密码不能为空' }
				return
			end

			rd = rand(1000...9999)
			@validate = UserValidate.find_or_create_by(
				{ 
					:phone => phone, 
					:password => password,
					:validate_code => rd
				}
			)
			@validate.validate_code = rd
			@validate.save

			# render :json => @validate.inspect
			# return
			code = validate.validate_code
			response = RestClient.get 'http://api.chanyoo.cn/utf8/interface/send_sms.aspx', 
				{
					:params => 
					{
						:username => 'kaizen',
						:password => 'TlwP6Mm4',
						:receiver => phone,
						:content => "注册验证码：#{code},一天内提交有效,如不是本人操作请忽略！【婚格】",
						:sendtime => ''
					}
				}
			render :json => { :response => "发送成功#{code}" }
		end

	end
end