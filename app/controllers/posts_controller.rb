class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update]

  def index
    @posts = Post.where(post_status: 2)
  end

  def show
  end

  def update
    if @post.update(post_content_params)
      redirect_to edit_admins_post_path, notice: '正常に保存されました。'
    else
      redirect_to edit_admins_post_path, alert: '更新に失敗しました。もう一度お試しください'
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_content_params
    params.require(:post).permit(:content)
  end
end
