class RegisterController < ApplicationController
	def index
		@user = User.new
	end

	def create
		@user = User.new(user_whitelist)
		if @user.save
			session[:user] = @user
			session[:korisnik] = 'netko'
			redirect_to "/" # registration successfull
		else
			render 'index' # registration failed
		end
	end

	def error
	end

	private
  	def user_whitelist
  		params.require(:user).permit(:first_name, :last_name, :email, :password)
  	end
end
