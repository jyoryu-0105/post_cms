class Users::AppliesController < ApplicationController
  before_action :applied
  before_action :set_apply, only: [:destroy]
  def index
    @applies = Apply.where(user_id: current_user.id)
  end

  def new
    @orders = Order.all - Order.joins(:apply)
  end

  def create
    @apply = Apply.new(apply_params)
    if @apply.save
      redirect_to users_applies_path, notice: '応募が完了しました。'
    else
      redirect_to new_users_apply_path, alert: '応募に失敗しました。もう一度お試しください'
    end
  end

  def destroy
    if @apply.user_id == current_user.id
      @apply.destroy
      redirect_to users_applies_path, notice: '応募をキャンセルしました。'
    else
      redirect_to users_applies_path, alert: '削除に失敗しました。もう一度お試しください。'
    end
  end

  private
  def apply_params
    params.permit(:user_id, :order_id).merge(user_id: current_user.id, order_id: params[:order_id])
  end

  def set_apply
    @apply = Apply.find(params[:id])
  end

  def applied
    redirect_to new_users_apply_path, alert: 'この記事はすでに応募されました。別の記事をお探しください。' if Apply.exists?(order_id: params[:order_id])
  end
end
