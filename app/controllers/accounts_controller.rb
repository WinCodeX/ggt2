class AccountsController < ApplicationController
  before_action :authenticate_user!, :set_user

  def edit
    @user = current_user
  end

  def edit
    @account = current_user
  end
  
  def set_user
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to edit_account_path, notice: "Account updated successfully."
    else
      render :edit
    end
  end

  def update_profile_picture
    if params[:user][:profile_picture].present?
      current_user.update_profile_picture(params[:user][:profile_picture])
      flash[:notice] = "Profile picture updated successfully."
    else
      flash[:alert] = "No image selected."
    end
    redirect_to request.referer || account_path
  end
  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :business_name, :business_description, :profile_picture, :update_profile_picture)
  end
end
