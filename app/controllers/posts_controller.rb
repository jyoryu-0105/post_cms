class PostsController < ApplicationController
  before_action :already_created

  def index
    @applies = Apply.where(user_id: current_user.id)
  end

  def new
    @applies = Apply.where(user_id: current_user.id)
  end

  def create
    @post = Post.new(post_params)
    binding.pry
    if @post.save
      redirect_to new_post_path, notice: '作成が開始できます。'
    else
      redirect_to new_post_path, alert: '記事作成に失敗しました。もう一度お試しください'
    end
  end

  def draft
    @posts = Post.where(user_id: current_user.id, post_status: 0)
  end

  private

  def post_params
    params.permit(:title, :user_id, :order_id).merge(title: params[:title], user_id: current_user.id, order_id: params[:order_id])
  end

  def already_created
    redirect_to new_post_path, alert: 'この記事はすでに作成が開始されています。' if Post.exists?(order_id: params[:order_id])
  end
end
