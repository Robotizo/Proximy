class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:new, :create]



  # GET /users
  # GET /users.json
  def index
    @users = User.all.sort_by {|user| user.userInterests(current_user) + user.ccLocation(current_user.latitude, current_user.longitude) }.reverse




    @user = current_user


    @latTest = params[:lat]

  end

  # GET /users/1 
  # GET /users/1.json
  def show

    @interests = Interest.all

    @users = User.all
    @userNow = current_user

    followingIds = @userNow.followers.map(&:id)
    @followers = User.find(params = followingIds).sort_by &:updated_at


    currentUserInterests = @userNow.followingI.map(&:id)
    @userInterests = Interest.find(params = currentUserInterests).sort_by &:updated_at






    @currentUserInts = @userNow.followingI.map(&:id)

    @userInts = []
    @numTest = []
    
    @indexNums = []
   


    @users.each_with_index do |user, index|
      
        user.followingI.each do |uInt|
          ints = uInt.id 

          @userInts.push(ints)
        end
        @collide = @currentUserInts & @userInts
        @num = ( @collide.count.to_f / @currentUserInts.count.to_f )
        @numTest.push(@num)

        @indexNums.push(index)
    end





    @user_groups = @user.groups.order("created_at DESC")
    followingGroupsIds = @user.followingG.map(&:id)
    @groupsFollow = Group.find(params = followingGroupsIds).sort_by &:updated_at

    @user_events = @user.events.order("created_at DESC")
    followingEventsIds = @user.followingE.map(&:id)
    @eventsFollow = Event.find(params = followingEventsIds).sort_by &:event_date

    @user_posts = @user.posts.order("created_at DESC")
    
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :image, :avatar, :bio, :password, :password_confirmation, :latitude, :longitude)
    end
end
