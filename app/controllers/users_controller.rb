class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:new, :create, :confirm_email]


  def discover
    @user = current_user
    @users = User.all.sort_by {|user| user.userInterests(current_user) + user.ccLocation(current_user.latitude, current_user.longitude) }.reverse
    @userFriendships = Friendship.where(friend_id: current_user.id, status: "pending")
    @eventNotifs = EventNotif.where(user_id: current_user, is_checked: false)
  end

  def interests
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


    @user = current_user

  end

  def interestsMenu
    @user = current_user
  end

  def location
    @user = current_user
  end

  def avatar
    @user = current_user

  end

  def save_avatar
    @user = current_user
    @user.update_attributes(avatar_params)
    redirect_to root_path
  end


  def confirm_email
    user = User.friendly.find_by_confirm_token(params[:id])
    if user
      user.update_attribute(:email_confirmed, true)
      user.update_attribute(:confirm_token, nil)
      redirect_to login_path, notice: 'Thank you for confirming your email.'
    else
      flash[:error] = "Sorry. User does not exist"
      redirect_to root_url
    end
  end


  # GET /users
  # GET /users.json
  def index
    @users = User.all.sort_by {|user| user.userInterests(current_user) + user.ccLocation(current_user.latitude, current_user.longitude) }.reverse
    @user = current_user
    @latTest = params[:lat]


    if current_user.is_admin == false or current_user.is_admin == nil
      redirect_to root_path
    end

  end

  # GET /users/1 
  # GET /users/1.json
  def show
    @userFriendships = Friendship.where(friend_id: current_user.id, status: "pending")
    @eventNotifs = EventNotif.where(user_id: current_user, is_checked: false)
    @friendships = Friendship.where(user_id: @user.id, friend_id: current_user.id, status: "pending")
    @acceptedFriendships = Friendship.where(user_id: @user.id, friend_id: current_user.id, status: "accepted")


    @interests = Interest.all

    @users = User.all
    @userNow = current_user


    collide = current_user.followingI.ids & @user.followingI.ids
    @collideInterests = Interest.find(params = collide).sort_by &:updated_at





    
    
    @user_groups = @user.groups.order("created_at DESC")
    followingGroupsIds = @user.followingG.map(&:id)
    @groupsFollow = Group.find(params = followingGroupsIds).sort_by &:updated_at

    @user_events = @user.events.order("created_at DESC")
    followingEventsIds = @user.followingE.map(&:id)
    @eventsFollow = Event.where(id: [followingEventsIds]).where('event_date > ?', Date.today).sort_by &:event_date

    @user_posts = @user.posts.order("created_at DESC")
    
  end

  # GET /users/new
  def new
    @user = User.new

  end

  # GET /users/1/edit
  def edit
    @user = current_user
  end

  # POST /users
  # POST /users.json
  def create
    # Request IP for Geocoder
    params[:user][:ip] = request.ip

    
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        UserMailer.registration_confirmation(@user).deliver
        format.html { redirect_to login_path, notice: 'Please confirm your email to sign in.' }
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

        format.html { redirect_to :back, notice: 'Your profile has been updated.' }
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
      @user = User.friendly.find(params[:id])
    end

    def avatar_params
      params.require(:user).permit(:avatar, :image, :bio)
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :last_name, :email, :image, :avatar, :bio, :password, :password_confirmation, :latitude, :longitude, :distance_is_checked, :ip)
    end
end
