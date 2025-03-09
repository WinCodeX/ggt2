class DashboardController < ApplicationController
  before_action :authenticate_user!  # Ensure user is logged in
  def show
    @user = current_user  # Make sure current_user is accessible
  end
end
