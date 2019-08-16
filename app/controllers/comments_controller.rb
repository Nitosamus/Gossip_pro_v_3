class CommentsController < ApplicationController
    before_action :authenticate_user, only: [:create]
  def index
  end

  def show
@comment = Comment.find(params[:id])

  end

  def new
  end

  def create
    @gossip = Gossip.find(params[:gossip_id])
     @user = User.all[rand(0..User.all.length)]
      @comment = Comment.new(content: params[:content], gossip: @gossip, user: @user)
      if @comment.save
        redirect_to gossip_path(params[:gossip_id])
        flash.now[:notice] = "You have been commenting"
     else
      flash[:notice]= "LET COMMENT!!!"
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    puts params
    if @comment.update(comment_params)
      redirect_to gossip_path(params[:gossip_id])
    else
      render "edit"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    puts params
    redirect_to gossip_path(params[:gossip_id])

  end


  private
  def comment_params
    params.require(:comment).permit(:content)
  end
  def authenticate_user
    unless current_user
      flash[:danger] = "Please login!!"
      redirect_to new_session_path
    end
  end
end
