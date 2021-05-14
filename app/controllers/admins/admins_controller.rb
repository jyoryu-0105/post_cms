class Admins::AdminsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_delivered_post

  def index
    @orders = Order.where(created_at: Date.today.beginning_of_day..Date.today.end_of_day)
    @applies = Apply.where(created_at: Date.today.beginning_of_day..Date.today.end_of_day)
    @delivered = Post.where(post_status: 1, updated_at: Date.today.beginning_of_day..Date.today.end_of_day)
    @published = Post.where(publish_date: Date.today.beginning_of_day..Date.today.end_of_day)
  end


  private

  def set_delivered_post
    @posts = Post.where(post_status: 1)
  end

end
