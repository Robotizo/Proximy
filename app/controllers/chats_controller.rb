class ChatsController < ApplicationController
  before_action :require_login
  before_action :get_messages, only: %i[index]
  before_action :get_users, only: %i[index]
  before_action :get_notifications, only: %i[index]
  before_action :set_active_user, only: %i[list_messages ajax_messages]
  before_action :filter_page_number, only: %i[ajax_messages]
  before_action :check, only: [:index]



  def check
    if signed_in?
      if !current_user.avatar? & !current_user.image?
        redirect_to root_path
      end
    end
  end 


  def index

  end

  def list_messages
    @messages = Message.users_messages(current_user, @active_user).last(10)
    render partial: 'list_messages', locals: { messages: @messages }
  end

  def ajax_messages
    @messages = Message.users_messages(current_user, @active_user).between_range(@start, @last)
    render partial: 'ajax_messages', locals: { messages: @messages }
  end

  def list_user
    selected_user = User.find(params[:id])

    render json: {
      id: selected_user.id,
      name: selected_user.name,
      email: selected_user.email,
      avatar: selected_user.avatar_url(:thumb),
    }
  end


  private

  def filter_page_number
    @page_number = params[:page_number]
  end

  def set_active_user
    @active_user = User.find(params[:id])
    @start = start_index + base_index
    @last = end_index + base_index
  end

  def base_index
    Message.base_index
  end

  def start_index
    params[:start].to_i
  end

  def end_index
    params[:end].to_i
  end

  def get_messages
    @messages = Message.order(created_at: :asc)
  end

  # Display only friends and followers for now
  # TODO (Andy Lee): Consider and implement messaing request & limit feature for users 
  def get_users
    filteredRelation = (current_user.following + current_user.followers)
    listOfContacts = current_user.friends + filteredRelation.uniq
    @users = listOfContacts.sort_by &:updated_at
  end





  def get_notifications
    @eventNotifs = EventNotif.where(user_id: current_user, is_checked: false)
  end
end











































