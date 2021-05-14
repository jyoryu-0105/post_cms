class ApplicationController < ActionController::Base
  before_action :set_user
  before_action :set_admin
  before_action :basic_auth

  def set_user
    @user = current_user
  end

    def set_admin
    @admin = current_admin
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"] 
    end
  end
end
