class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]





  def interests
    @interests = Interest.all
    @group = Group.find(params[:id])
    groupID = @group.id
    $groupTest = Group.find(params = groupID)
  end

  # GET /groups
  # GET /groups.json
  def index

    @groups = Group.all.sort_by {|group| group.groupsInterest(current_user)}.reverse
    @user = current_user

    followingGroupsIds = @user.followingG.map(&:id)
    @groupsFollow = Group.find(params = followingGroupsIds).sort_by &:updated_at

  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @interests = Interest.all
    followingGroupIds = @group.followersG.map(&:id)
    @groupFollowers = User.find(params = followingGroupIds).sort_by &:updated_at
    groupID = @group.id
    $groupTest = Group.find(params = groupID)
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
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
