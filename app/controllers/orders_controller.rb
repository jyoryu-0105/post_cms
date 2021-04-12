class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :checking_admin

  def index
  end

  private

  def checking_admin
    if @user.admin_flg == false
      redirect_to root_path
    end
  end 
end
