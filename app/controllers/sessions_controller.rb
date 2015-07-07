class SessionsController < ApplicationController
	
	def create
		render 'new'		
		user = User.find_by( :email  => params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			#密码正确
			flash.now[:success] = '登陆成功'
			#下面的还未定义
			sign_in user
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
