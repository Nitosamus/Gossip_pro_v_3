class CitiesController < ApplicationController
  def index
  end

  def show
    
  end

  def new
  end

  def create
    user_id = session[:user_id]
    @user = session[:user]
    like = Like.new(user_id: session[:user_id], gossip_id:params[:id])
    if @like.save 
            redirect_back fallback_location: '/', allow_other_host: false
    end
  end

  def show
    @city = City.find(params[:id])

  end

  def update
  end

  def destroy
  end
end
