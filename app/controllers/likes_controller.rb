class LikesController < ApplicationController
	def new 	
        #k = Gossip.find(params[:gossip_id]).likes
        if already_liked?
        	flash[:notice] = "you can't like more than once"
        redirect_back fallback_location: '/', allow_other_host: true
    	else
    	redirect_to new_session_path
    	 @like = Like.create(user_id: session[:user_id], gossip_id:params[:gossip_id])
    	puts @like.errors.messages 
 		end    
	end
	def create	
		 
	end

	private
	def already_liked?
		Like.find_by(user_id: current_user)
	end

end
