class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.find_by(email: params[:email])
  	if @user && @user.authenticate(params[:password])
  		flash[:success] = "You have connected, weclome #{@user.first_name}!!"
  		session[:user_id] = @user.id
  		session[:user] = @user
  		redirect_to users_path
  		puts "#" * 50
  		puts session[:user_id]
  		puts session[:user]
  		puts "dsdkjksdsjkdjfskdddddddddddkdddddddddddddddddddddddddddddd"
  	else
  		render "new"
  		flash[:danger] = "Wrong email or password"
  	end

  end

  def destroy
  	
  	session.delete(:user_id)
  	redirect_to users_path
  	flash[:notice] = "Are you sure???"

  end
end
