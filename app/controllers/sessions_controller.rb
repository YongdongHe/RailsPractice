class SessionsController < ApplicationController
	
	def create			
		user = User.find_by( :email  => params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			#密码正确
			flash.now[:success] = '登陆成功'
			#下面的还未定义
			sign_in user
			# redirect_to user
			# 修改为登陆后转向之前访问的地址
			redirect_back_or user
		else
			flash.now[:error] = '登陆失败'
			render 'new'	
		end
	end

	def new
	end

	def destroy
		sign_out
		redirect_to root_path
	end
end
