class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_groups_list, only: [:edit, :update, :new, :create]



  def interests
    @interests = Interest.all
    @event = Event.find(params[:id])

    unless current_user == @event.user
       redirect_to(@event, notice: "You cannot edit interests") and return
    end
  end

  # GET /events
  # GET /events.json
  def index
    @events = Event.all.sort_by {|event| event.eventsInterest(current_user)}.reverse
    @user = current_user
    @user_events = @user.events.order(:event_date)
    followingEventsIds = @user.followingE.map(&:id)
    @eventsFollow = Event.find(params = followingEventsIds).sort_by &:event_date

  end

  # GET /events/1
  # GET /events/1.json
  def show
    @eventNotifs = EventNotif.all
    @interests = Interest.all
    followingEventIds = @event.followersE.map(&:id)
    @eventFollowers = User.find(params = followingEventIds).sort_by &:updated_at


  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])

    unless current_user == @event.user
       redirect_to(@event, notice: "You cannot edit this event") and return
    end
  end

  # POST /events
  # POST /events.json
  def create
    @event = current_user.events.build(event_params)


    respond_to do |format|
      if @event.save
        if @event.group_id.present?
          followingGroupIds = @event.group.followersG.map(&:id)
          @groupFollowers = User.find(params = followingGroupIds)
          @groupFollowers.each do |groupFollower|
            EventNotif.create(event_id: @event.id, user_id: groupFollower.id)
          end

        end
        format.html { redirect_to interests_event_path(@event), notice: 'Event is successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    def set_groups_list
      followingGroupsIds = current_user.followingG.map(&:id)
      @groupsFollow = Group.find(params = followingGroupsIds).sort_by &:updated_at
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :description, :image, :group_id, :event_date, :event_time, :event_end_date, :event_end_time, :address, :latitude, :longitude)
    end
end
