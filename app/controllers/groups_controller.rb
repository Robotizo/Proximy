class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :check, only: [:show, :index, :edit, :update, :destroy]



  def check
    if signed_in?
      if !current_user.avatar? & !current_user.image?
        redirect_to root_path
      end
    end
  end 



  def interests
    @interests = Interest.all
    @group = Group.find(params[:id])
    # Interest List Start
      @arts = Interest.where(category: "Arts")
      @animals = Interest.where(category: "Animals")
      @business = Interest.where(category: "Business")
      @community = Interest.where(category: "Community")
      @crafts = Interest.where(category: "Crafts")
      @dance = Interest.where(category: "Dance")
      @eating = Interest.where(category: "Eating & Drinking")
      @education = Interest.where(category: "Education")
      @entertainment = Interest.where(category: "Entertainment")
      @fashion = Interest.where(category: "Fashion")
      @fitness = Interest.where(category: "Fitness")
      @games = Interest.where(category: "Games")
      @health = Interest.where(category: "Health & Wellness")
      @culture = Interest.where(category: "Culture")
      @LGBTQA = Interest.where(category: "LGBTQA")
      @auto = Interest.where(category: "Motor Sports")
      @perspective = Interest.where(category: "Perspective")
      @outdoors = Interest.where(category: "Outdoor")
      @relationships = Interest.where(category: "Relationships")
      @sports = Interest.where(category: "Sports")
      @tech = Interest.where(category: "Tech")
    # Interest List End

    unless current_user == @group.user
       redirect_to(@group, notice: "You cannot edit interests") and return
    end
  end



  def follow
    @user = current_user
    followingGroupsIds = @user.followingG.map(&:id)
    @groupsFollow = Group.find(params = followingGroupsIds).sort_by &:updated_at
    render :layout => false
  end



  def mygroups
    @user = current_user
    followingGroupsIds = @user.followingG.map(&:id)
    @groupsFollow = Group.find(params = followingGroupsIds).sort_by &:updated_at
    @user_groups = @user.groups

    respond_to do |format|
      format.html # show_rec_horses.html.erb
      format.js   # show_rec_horses.js.erb
    end
  end 


  # GET /groups
  # GET /groups.json
  def index




    @groups = Group.all.sort_by {|group| group.groupsInterest(current_user)}.reverse
    @user = current_user

    followingGroupsIds = @user.followingG.map(&:id)
    @groupsFollow = Group.find(params = followingGroupsIds).sort_by &:updated_at

    @userFriendships = Friendship.where(friend_id: current_user.id, status: "pending")
    @eventNotifs = EventNotif.where(user_id: current_user, is_checked: false)


    respond_to do |format|
      format.html # show_rec_horses.html.erb
      format.js   # show_rec_horses.js.erb
    end



  end

  # GET /groups/1
  # GET /groups/1.json
  def show

    
    @group_events = @group.events.where('event_date >= ?', Date.today).sort_by &:event_date
    @interests = Interest.all
    followingGroupIds = @group.followersG.map(&:id)
    @groupFollowers = User.find(params = followingGroupIds).sort_by &:updated_at


    @userFriendships = Friendship.where(friend_id: current_user.id, status: "pending")
    @eventNotifs = EventNotif.where(user_id: current_user, is_checked: false)



  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find(params[:id])

    unless current_user == @group.user
       redirect_to(@group, notice: "You cannot edit this group") and return
    end


  end

  # POST /groups
  # POST /groups.json
  def create
    @group = current_user.groups.build(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to interests_group_path(@group), notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:title, :description, :image, :cover_image)
    end
end
