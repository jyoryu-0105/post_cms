class Users::PostsController < ApplicationController
  before_action :already_created
  before_action :set_post, only: [:edit, :deliver]

  def index
    @applies = Apply.where(user_id: current_user.id)
  end

  def new
    @applies = Apply.where(user_id: current_user.id)
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to draft_users_posts_path, notice: '作成が開始できます。'
    else
      redirect_to new_users_post_path, alert: '記事作成に失敗しました。もう一度お試しください'
    end
  end

  def edit
  end

  def draft
    @posts = Post.where(user_id: current_user.id, post_status: 0)
  end

  def deliver
    if @post.update(deliver_params)
      redirect_to draft_users_posts_path, notice: '正常に納品されました。'
    else
      redirect_to edit_users_post_path, alert: '納品に失敗しました。もう一度お試しください。'
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.permit(:title, :user_id, :order_id).merge(title: params[:title], user_id: current_user.id, order_id: params[:order_id])
  end

  def deliver_params
    params.permit(:post_status).merge(post_status: 1)
  end

  def already_created
    redirect_to new_users_post_path, alert: 'この記事はすでに作成が開始されています。' if Post.exists?(order_id: params[:order_id])
  end
end
