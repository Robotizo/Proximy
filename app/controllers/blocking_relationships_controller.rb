class BlockingRelationshipsController < ApplicationController

    def create
      @user = User.find(params[:blocked_id])
      current_user.block(@user)
      respond_to do |format|
          format.html { redirect_to blocked_user_path(current_user.id) }
          format.js
      end
  end

  def destroy
      @user = BlockingRelationship.find(params[:id]).blocked
      current_user.unblock(@user)
      respond_to do |format|
          format.html { redirect_to :back }
          format.js
      end
  end


end
