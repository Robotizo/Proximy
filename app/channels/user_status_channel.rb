class UserStatusChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'user_status_channel'
  end

  def unsubscribed
  end
end
