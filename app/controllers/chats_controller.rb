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
    @userFriendships = Friendship.where(friend_id: current_user.id, status: "pending")
      @eventNotifs = EventNotif.where(user_id: current_user, is_checked: false)
    $new_unread_messages_cnt = Message.current_user_unread(current_user).unread_messages.length

  end


  def list_messages
    @messages = Message.users_messages(current_user, @active_user).last(10)
    @unread_messages = Message.users_messages(current_user, @active_user).unread_messages
    @unread_messages.update_all(read_status: true)
    render partial: 'list_messages', locals: { messages: @messages }
  end


  def ajax_messages
    @messages = Message.users_messages(current_user, @active_user).between_range(@start, @last)
    render partial: 'ajax_messages', locals: { messages: @messages }
  end

  def read_messages
    message = Message.find(params[:id])
    message.read!
  end

  def list_user
    selected_user = User.find(params[:id])


    render json: {
      id: selected_user.id,
      name: selected_user.name,
      last_name: selected_user.last_name,
      email: selected_user.email,
      avatar: selected_user.avatar_url(:thumb),
      interests: selected_user.followingI
    }
  end


  def set_online
    if current_user.is_offline?
      current_user.online!
      send_status_changed_notification(true)
    end
  end

  def set_offline
    if current_user.is_online?
      current_user.offline!
      send_status_changed_notification(false)
    end
  end


  private

  def send_status_changed_notification(status)
    ActionCable.server.broadcast 'user_status_channel', user_id: current_user.id, status: status
  end

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
    listOfContacts = (current_user.friends + filteredRelation).uniq.map(&:id)

    @users = User.where(id: [listOfContacts]).where.not(id: [current_user.blocks.ids]).where.not(id: [current_user.blockers.ids])

    # @users = listOfContacts.sort_by &:updated_at
    @users.each do |user|
      unread_messages_cnt = Message.users_messages(user, current_user).unread_messages.length
 
      if unread_messages_cnt == 0
        user.has_unread_messages = false
      else 
        user.has_unread_messages = true
      end 
    end

  end





  def get_notifications
    @eventNotifs = EventNotif.where(user_id: current_user, is_checked: false)
  end
end











































