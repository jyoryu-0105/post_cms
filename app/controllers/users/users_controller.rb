class Users::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_draft

  def index
    @exist = Apply.where(user_id: current_user.id, created_at: Date.today.beginning_of_day..Date.today.end_of_day)
    @exists = Apply.where(user_id: current_user.id)
  end

  private

  def set_draft
    @posts = Post.where(user_id: current_user.id, post_status: 0)
  end
end
