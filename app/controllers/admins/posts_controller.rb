class Admins::PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :declined, :publish, :close, :update]

  def index
    @applies = Apply.where(user_id: current_user.id)
  end

  def show
  end
  
  def edit
  end

  def update
    if @post.update(post_content_params)
      redirect_to edit_admins_post_path, notice: '正常に保存されました。'
    else
      redirect_to edit_admins_post_path, alert: '更新に失敗しました。もう一度お試しください'
    end
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

  def close
    if @post.update(closed_params)
      redirect_to delivered_admins_posts_path, notice: '正常に非公開にされました。'
    else
      render :show, alert: '非公開に失敗しました。もう一度お試しください。'
    end
  end

  def delivered
    @posts = Post.where(post_status: 1)
  end

  def published
    @posts = Post.where(post_status: 2)
  end

  def closed
    @posts = Post.where(post_status: 2)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def declined_params
    params.permit(:post_status).merge(post_status: 0)
  end

  def publish_params
    params.permit(:post_status, :publish_date).merge(post_status: 2, publish_date: Time.now)
  end

  def closed_params
    params.permit(:post_status, :publish_date).merge(post_status: 3, publish_date: nil)
  end

  def post_content_params
    params.require(:post).permit(:content)
  end
end
