class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def index
    @posts = Post.where(post_status: 2)
  end

  def show
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

end
