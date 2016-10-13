class LoginController < ApplicationController
	def index
		if session[:user]
			redirect_to '/'
		else
			@user = User.new
		end
	end

	def login
		if params[:user][:email].blank?
			@errors = ["Email can't be empty"]
		end
		if params[:user][:password].blank?
		(@errors ||= []).push("Password can't be empty")
		end

		if !@errors
			@user = User.find_by_email(params[:user][:email])
		end

		if @user
			session[:user] = @user
			redirect_to '/'
		else
			if !@errors
				@errors = ["Invalid email or password"]
			end
			@user = User.new
			render 'index'
		end
	end
end
