class ConversationsController < ApplicationController
	def index
		@users = User.all
		@conversations = Conversation.all
	end


	def show
		@conversation = Conversation.includes(:messages).find_by(id: params[:id])
	    @message = Message.new
	    @user = current_user	
	end

	def create
		if Conversation.between(params[:sender_id],params[:recipient_id]).present?
		@conversation = Conversation.between(params[:sender_id],
		params[:recipient_id]).first
		else
			@conversation = Conversation.create!(conversation_params)
		end
		redirect_to conversation_path(@conversation)
	end

	private
 		def conversation_params
  			params.permit(:sender_id, :recipient_id)
 		end
end
