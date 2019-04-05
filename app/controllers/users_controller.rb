class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:new, :create]



  # GET /users
  # GET /users.json
  def index
    @users = User.all
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




    @userIds = []


# Work
    @users.each do |user|
      @userIds.push(user.id)
      user.followingI.each do |interest|

      end
    end 
# Work

=begin
    @numTestSorted = @numTest.sort { |a, b| b <=> a }


    @userIntsFound = Interest.find(params = @userInts).sort_by &:updated_at

    @userIntsInto5 = @userInts.each_slice(5).to_a


    @into5Nums = []
    @into5Nums2 = []

    @into5Ids = []




    @userIntsInto5.each_with_index do |into5, index|
      @collide5 = @currentUserInts & into5
      @num5 = ( @collide5.count.to_f / @currentUserInts.count.to_f )
      @into5Nums.push( @num5 )
      if @num5 > 0.1
        @into5Nums2.push( @num5 )
      end
    end




    @into5NumsSorted = @into5Nums.sort { |a, b| b <=> a }










    @userIntsInto5Found = Interest.find(params = @userIntsInto5).sort_by &:updated_at





    @johnMarston = @userIntsInto5[0]
    @jmCollide = @currentUserInts & @johnMarston


    @johnMarstonCollide = Interest.find(params = @jmCollide).sort_by &:updated_at
    @johnMarstonFound = Interest.find(params = @johnMarston).sort_by &:updated_at

    @vsJohn = ( @jmCollide.count.to_f / @currentUserInts.count.to_f )



    @kakacarrotcake = @userIntsInto5[1]
    @kakaCollide = @currentUserInts & @kakacarrotcake

    @kakacarrotcakeCollide = Interest.find(params = @kakaCollide).sort_by &:updated_at
    @kakacarrotcakeFound = Interest.find(params = @kakacarrotcake).sort_by &:updated_at

    @vsKaka = ( @kakaCollide.count.to_f / @currentUserInts.count.to_f )



    @hunter = @userIntsInto5[2]
    @hunterCollide = @currentUserInts & @hunter

    @hunterNameCollide = Interest.find(params = @hunterCollide).sort_by &:updated_at
    @hunterFound = Interest.find(params = @hunter).sort_by &:updated_at

    @vsHunter = ( @hunterCollide.count.to_f / @currentUserInts.count.to_f )


    @vapor = @userIntsInto5[3]
    @vaporCollide = @currentUserInts & @vapor

    @vaporNameCollide = Interest.find(params = @vaporCollide).sort_by &:updated_at
    @vaporFound = Interest.find(params = @vapor).sort_by &:updated_at

    @vsVapor = ( @vaporCollide.count.to_f / @currentUserInts.count.to_f )


        


    @collide = @currentUserInts & @userInts
    @commonInterests = Interest.find(params = @collide).sort_by &:updated_at

    @num = ( @collide.count.to_f / @currentUserInts.count.to_f )


    interestUser = @user.followingI.map(&:id)
    @userInterests = Interest.find(params = interestUser).sort_by &:updated_at


=end



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
      params.require(:user).permit(:name, :email, :image, :avatar, :bio, :password, :password_confirmation)
    end
end
