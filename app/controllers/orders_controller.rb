class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :checking_admin

  def index
    @orders = Order.all
    @exist = Order.where(created_at: Date.today.beginning_of_day..Date.today.end_of_day)
  end

  def download
    respond_to do |format|
      format.csv do
        send_data render_to_string, filename: '発注テンプレート.csv', type: :csv
      end
    end
  end

  def import
    if params[:file].blank?
      redirect_to orders_path, alert: '読み込むCSVを選択してください'
    elsif File.extname(params[:file].original_filename) != ".csv"
      redirect_to orders_path, alert: 'csvファイルのみ読み込み可能です'
    else
    Order.import(params[:file])
    redirect_to orders_path, notice: '発注が完了しました'
    end
  end

  private

  def checking_admin
    if @user.admin_flg == false
      redirect_to root_path
    end
  end 
end
