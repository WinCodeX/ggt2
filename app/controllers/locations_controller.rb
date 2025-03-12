class LocationsController < ApplicationController
    before_action :set_location, only: %i[show edit update destroy]
  
    def index
      @locations = Location.all
    end
  
    def new
      @location = Location.new
    end
  
    def create
      @location = Location.new(location_params)
      if @location.save
        redirect_to locations_path, notice: "Location successfully created."
      else
        render :new
      end
    end
  
    def edit; end
  
    def update
      if @location.update(location_params)
        redirect_to locations_path, notice: "Location updated successfully."
      else
        render :edit
      end
    end
  
    def destroy
      @location.destroy
      redirect_to locations_path, notice: "Location deleted."
    end
  
    private
  
    def set_location
      @location = Location.find(params[:id])
    end
  
    def location_params
      params.require(:location).permit(:name)
    end
  end
  