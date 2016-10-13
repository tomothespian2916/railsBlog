class HomeController < ApplicationController

	def index
		if !session[:user]
			redirect_to '/login'
		else
      @user = User.find(session[:user]["id"])
      @blogPosts = @user.blog_posts
      render :json => @blogPosts
      # RAW sql used because tables is not related
      @blogPosts = BlogPost.joins("INNER JOIN users ON blog_posts.owner = users.id ORDER BY blog_posts.created_at DESC").select('blog_posts.*, users.first_name, users.user_logo')
		end
	end
end
