class PostsController < ApplicationController
  def index
    @applies = Apply.where(user_id: current_user.id)
    @post = Post.joins(:order)
  end

  def new
    @applies = Apply.where(user_id: current_user.id)
  end

  def create
    @post = Post.new(post_params)
    binding.pry
    if @post.save
      redirect_to applies_path, notice: '応募が完了しました。'
    else
      redirect_to new_apply_path, alert: '応募に失敗しました。もう一度お試しください'
    end
  end

  private

  def post_params
    params.permit(:title, :user_id, :order_id).merge(title: params[:title], user_id: current_user.id, order_id: params[:order_id])
  end

end
