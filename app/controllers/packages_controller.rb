class PackagesController < ApplicationController
    before_action :authenticate_user!
  
    def new
      @package = Package.new
    end
  
    def create
      @package = current_user.packages.new(package_params)
      @package.state = "pending_unpaid" # Default state before payment
  
      if @package.save
        redirect_to payment_path(@package), notice: "Proceed to payment."
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    private
  
    def package_params
      params.require(:package).permit(
        :recipient_name, :recipient_phone, :package_description, :package_value, 
        :sender_agent_id, :delivery_type, :delivery_details, :receiver_agent_id,
        :exact_location, :courier_service, :destination, :price
      )
    end
  end
  