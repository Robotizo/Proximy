class NotificationEventsController < ApplicationController
  before_action :set_notification_event, only: [:show, :edit, :update, :destroy]

  # GET /notification_events
  # GET /notification_events.json
  def index
    @notification_events = NotificationEvent.all
    @user = current_user
    @userSentInvites = current_user.sent_invites
    @users = User.all
  end

  # GET /notification_events/1
  # GET /notification_events/1.json
  def show
  end

  # GET /notification_events/new
  def new
    @notification_event = NotificationEvent.new
    @events = Event.all
    @users = User.all
  end

  # GET /notification_events/1/edit
  def edit
  end

  # POST /notification_events
  # POST /notification_events.json
  def create
    @notification_event = NotificationEvent.new(notification_event_params)

    respond_to do |format|
      if @notification_event.save
        format.html
        format.json { render :show, status: :created, location: @notification_event }
      else
        format.html { render :new }
        format.json { render json: @notification_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notification_events/1
  # PATCH/PUT /notification_events/1.json
  def update
    respond_to do |format|
      if @notification_event.update(notification_event_params)
        format.html { redirect_to @notification_event, notice: 'Notification event was successfully updated.' }
        format.json { render :show, status: :ok, location: @notification_event }
      else
        format.html { render :edit }
        format.json { render json: @notification_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notification_events/1
  # DELETE /notification_events/1.json
  def destroy
    @notification_event.destroy
    respond_to do |format|
      format.html { redirect_to notification_events_url, notice: 'Notification event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification_event
      @notification_event = NotificationEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_event_params
      params.require(:notification_event).permit(:greet, :event_id, :sender_id, :recipient_id)
    end
end
