module ApplicationCable
  class Connection < ActionCable::Connection::Base
  	identified_by :current_user

    def connect
      self.current_user = find_verified_user
      logger.add_tags 'ActionCable', current_user.email
    end

    protected

    def find_verified_user 
      (current_user = env['warden'].user) ? current_user : reject_unauthorized_connection
    end


  end
end
