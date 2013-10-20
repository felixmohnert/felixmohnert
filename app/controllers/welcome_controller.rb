class WelcomeController < ApplicationController
  def index
    @posts = Post.last(2)
  end
end
