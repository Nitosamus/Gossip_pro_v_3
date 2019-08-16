class UsersController < ApplicationController
  def index
  end

  
  def new
    @user = User.new
  end


  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.now[:notice] = "create successfull!!!"
      redirect_to users_path
    else
      render :new
    end
    puts @user.errors.messages
  end

  def update
  end

  def destroy
  end

  private
  def user_params
    @city = City.all[rand(0..City.all.length)]
    params.require(:user).permit(:first_name, :last_name, :email, :age, :description, :password, city: @city)
  end
end
