class EventPostsController < ApplicationController
  before_action :set_event_post, only: [:show, :edit, :update, :destroy]
  before_action :set_events_list, only: [:edit, :update, :new, :create]

  # GET /event_posts
  # GET /event_posts.json
  def index
    @event_posts = EventPost.all
  end

  # GET /event_posts/1
  # GET /event_posts/1.json
  def show
    @event_comment = @event_post.event_comments.new
  end

  # GET /event_posts/new
  def new
    @event_post = current_user.event_posts.build
    @event = Event.find(params[:event_id])
  end

  # GET /event_posts/1/edit
  def edit
  end

  # POST /event_posts
  # POST /event_posts.json
  def create
 
    @event_post = current_user.event_posts.build(event_post_params)

    respond_to do |format|
      if @event_post.save
        format.html { redirect_to @event_post.event, notice: 'Your post was successfully created.' }
        format.json { render :show, status: :created, location: @event_post }
      else
        format.html { render :new }
        format.json { render json: @event_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_posts/1
  # PATCH/PUT /event_posts/1.json
  def update
    respond_to do |format|
      if @event_post.update(event_post_params)
        format.html { redirect_to @event_post, notice: 'Event post was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_post }
      else
        format.html { render :edit }
        format.json { render json: @event_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_posts/1
  # DELETE /event_posts/1.json
  def destroy
    @event_post.destroy
    respond_to do |format|
      format.html { redirect_to event_posts_url, notice: 'Event post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_post
      @event_post = EventPost.find(params[:id])
    end


    def set_events_list
      followingEventsIds = current_user.followingE.map(&:id)
      @eventsFollow = Event.find(params = followingEventsIds).sort_by &:updated_at
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_post_params
      params.require(:event_post).permit(:content, :image, :event_id)
    end
end









