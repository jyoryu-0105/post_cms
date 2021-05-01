class Admins::PostsController < ApplicationController
  before_action :set_post, only: [:show, :declined, :publish]

  def index
    @applies = Apply.where(user_id: current_user.id)
  end

  def new
    @applies = Apply.where(user_id: current_user.id)
  end


  def show
  end

  def declined
    if @post.update(declined_params)
      redirect_to delivered_admins_posts_path, notice: '正常に差し戻されました。'
    else
      render :show, alert: '差し戻しに失敗しました。もう一度お試しください。'
    end
  end

  def publish
    if @post.update(publish_params)
      redirect_to delivered_admins_posts_path, notice: '正常に公開されました。'
    else
      render :show, alert: '公開に失敗しました。もう一度お試しください。'
    end
  end

  def delivered
    @posts = Post.where(post_status: 1)
  end

  def published
    @posts = Post.where(post_status: 2)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.permit(:title, :user_id, :order_id).merge(title: params[:title], user_id: current_user.id, order_id: params[:order_id])
  end

  def declined_params
    params.permit(:post_status).merge(post_status: 0)
  end

  def publish_params
    params.permit(:post_status, :publish_date).merge(post_status: 2, publish_date: Time.now)
  end

end
