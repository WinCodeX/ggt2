class PricesController < ApplicationController
    before_action :set_price, only: %i[show edit update destroy]
  
    def index
      @prices = Price.all
    end
  
    def new
      @price = Price.new
    end
  
    def create
      @price = Price.new(price_params)
      if @price.save
        redirect_to prices_path, notice: "Price successfully set."
      else
        render :new
      end
    end
  
    def calculate
        price = Price.find_by(sender_agent_id: params[:sender_agent_id], receiver_agent_id: params[:receiver_agent_id])
        render json: { cost: price ? price.cost : "N/A" }
      end
      

    def edit; end
  
    def update
      if @price.update(price_params)
        redirect_to prices_path, notice: "Price updated successfully."
      else
        render :edit
      end
    end
  
    def destroy
      @price.destroy
      redirect_to prices_path, notice: "Price removed."
    end
  
    private
  
    def set_price
      @price = Price.find(params[:id])
    end
  
    def price_params
      params.require(:price).permit(:origin_agent_id, :receiver_agent_id, :cost)
    end
  end
  