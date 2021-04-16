class PostsController < ApplicationController
  def index
    @applies = Apply.where(user_id: current_user.id)
  end
end
