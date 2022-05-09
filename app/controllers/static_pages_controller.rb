class StaticPagesController < ApplicationController
  def home
    @user = current_user
    @active_sessions = @user&.active_sessions&.order(created_at: :desc)
  end
end
