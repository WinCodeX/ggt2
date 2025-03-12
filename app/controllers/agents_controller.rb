class AgentsController < ApplicationController
    before_action :authenticate_admin! # Only admins can manage agents
  
    def index
      @agents = Agent.all
    end
  
    def new
      @agent = Agent.new
    end
  
    def create
      @agent = Agent.new(agent_params)
      if @agent.save
        redirect_to agents_path, notice: "Agent added successfully."
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit
      @agent = Agent.find(params[:id])
    end
  
    def update
      @agent = Agent.find(params[:id])
      if @agent.update(agent_params)
        redirect_to agents_path, notice: "Agent updated successfully."
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      @agent = Agent.find(params[:id])
      @agent.destroy
      redirect_to agents_path, notice: "Agent deleted successfully."
    end
  
    private
  
    def agent_params
      params.require(:agent).permit(:name, :location)
    end
  
    def authenticate_admin!
      redirect_to root_path, alert: "Access denied!" unless current_user.admin?
    end
  end
  