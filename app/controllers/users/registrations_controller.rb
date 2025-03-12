class Users::RegistrationsController < Devise::RegistrationsController
    before_action :authenticate_user!
  
    def update_profile_picture
      if current_user.update(profile_picture_params)
        redirect_to edit_user_registration_path, notice: "Profile picture updated successfully."
      else
        redirect_to edit_user_registration_path, alert: "Failed to update profile picture."
      end
    end
  
    private
  
    def profile_picture_params
      params.require(:user).permit(:profile_picture)
    end
  end
  