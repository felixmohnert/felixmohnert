class PostsController < ApplicationController

  before_filter :authenticate, :only => [:new, :create]


  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: 'Post was successfully created'}
      else
        format.html { render action: 'new' }
      end
    end
  end


  protected

  def post_params
    params.require(:post).permit([:title, :content])
  end

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['USER'] && password == ENV['PASSWORD']
    end
  end

end