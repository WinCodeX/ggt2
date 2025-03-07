class BusinessesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_business, only: [:edit, :update, :show]

  def new
    @business = current_user.build_business
  end

  def create
    @business = current_user.build_business(business_params)
    if @business.save
      redirect_to business_path(@business), notice: "Business profile created successfully."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @business.update(business_params)
      redirect_to business_path, notice: "Business profile updated successfully."
    else
      render :edit
    end
  end

  def show
    if current_user.business.present?
      @business = current_user.business
    else
      redirect_to new_business_path, alert: "You don't have a business profile yet. Create one to access business features."
    end
  end
  

  private

  def set_business
    @business = current_user.business || redirect_to(new_business_path, alert: "You need to create a business profile first.")
  end

  def business_params
    params.require(:business).permit(:name, :description, :logo)
  end
end
