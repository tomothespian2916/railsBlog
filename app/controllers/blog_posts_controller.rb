class BlogPostsController < ApplicationController
  def index
    @blogPost = BlogPost.new
  end

  def create
    if params[:blogpost][:title].blank?
      @response = {error: true, message: 'Missing blog post title'}
    else
      @blogPost = BlogPost.new(whitelist)
      @blogPost.owner = session[:user]['id']
      @blogPost.user_id = session[:user]['id']
      @blogPost.description = ''
      if @blogPost.save
        @response = {error: false, message: 'Blog post successfully saved', blogPost: @blogPost}
      else
        @response = {error: true, message: 'Something went wrong, please try again!', user: session[:user]}
      end
    end
    render :json => @response
  end

  def single
    @user = User.find(session[:user]['id'])
    @blogPost = BlogPost.find(params[:id])
    if request.xhr?
      render :json => @blogPost
    end
  end

  def update
    @blogPost = BlogPost.find(params[:id])
    @blogPost.description = params[:blogpost][:description] || @blogPost.description
    @blogPost.title = params[:blogpost][:title] || @blogPost.title
    @blogPost.isPublic = params[:blogpost][:isPublic] || @blogPost.isPublic
    if @blogPost.save
      @response = {error: false, message: 'Blog post successfully updated', blogPost: @blogPost}
    else
      @response = {error: true, message: 'Something went wrong, please try again!'}
    end
    render :json => @response
  end

  def whitelist
    params.require(:blogpost).permit(:title)
  end
end