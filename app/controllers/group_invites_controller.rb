class GroupInvitesController < ApplicationController
  def index
  	@group_invites = GroupInvite.all
  end
  def new 
  	@group_invites = GroupInvite.new
  	@groups = Group.all
    @users = User.all

  end
  def show
  	@group_invite = GroupInvite.find(params[:id])
  end
  def create
  	@group_invite = GroupInvite.new(group_invite_params)
  	if @group_invite.save
  		
  	else 
  		redirect_to :back
  	end
  end

   private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_invite_params
      params.require(:group_invite).permit(:group_id, :sender_id, :recipient_id)
    end
end
