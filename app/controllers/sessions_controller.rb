class SessionsController < ApplicationController
	
	def create
		render 'new'
		user_email = :params[:session][:email]
		user_password = :params[:session][:passwor]
		user = User.find_by(:email => user_email)
		if user && user.authenticate(user_password)
			#密码正确
			flash.now[:success] = '登陆成功'
			#下面的还未定义
			sign_up user
			redirect_to user

		else
			flash.now[:error] = '登陆失败'
		end
	end

	def new
	end

	def destroy
	end
	
end
