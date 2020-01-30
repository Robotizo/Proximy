class ChatsController < ApplicationController
  before_action :require_login
  def index
    @messages = Message.order(created_at: :asc)
    @users = User.all
    @eventNotifs = EventNotif.where(user_id: current_user, is_checked: false)
  end

   def list_messages
    active_user_id = params[:id]
    
    @messages = Message.where(sender_id: current_user.id, receiver_id: active_user_id).or(Message.where(sender_id: active_user_id, receiver_id: current_user.id)).last(10)
    # @messages = Message.where(sender_id: active_user_id, receiver_id: current_user.id)
    
    render partial: 'list_messages', locals: { messages: @messages }
  end
end



