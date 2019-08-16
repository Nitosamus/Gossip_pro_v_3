class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:show]
  def new
    @gossip = Gossip.new
  end

  def create
          ##@user = User.all[rand(0..User.all.length)]
      @gossip = Gossip.new(gossip_params)

      if @gossip.update(user_id: session[:user_id])
      flash[:success] = "The super potin was succesfully saved !"
         redirect_to gossips_path
      else
        flash[:danger] = "Error : you need to complete this field / the title must be at least 3 characters longue"
        render "new"
        puts @gossip.errors.messages
        puts session[:user]
      end

  end

  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def edit
    puts params
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(title: params[:title], content: params[:content])
    redirect_to gossips_path
  else 
    render :edit
  end
  
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path

  end

  private
  def gossip_params
    params.permit(:title, :content)
  end
  def authenticate_user
    unless current_user
      flash[:danger] = "Please login!!"
      redirect_to new_session_path
    end
  end
end
