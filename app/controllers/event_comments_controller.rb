class EventCommentsController < ApplicationController
  before_action :set_event_comment, only: [:show, :edit, :update, :destroy]

  # GET /event_comments
  # GET /event_comments.json
  def index
    @event_comments = EventComment.all
  end

  # GET /event_comments/1
  # GET /event_comments/1.json
  def show
  end

  # GET /event_comments/new
  def new
    @event_comment = EventComment.new
  end

  # GET /event_comments/1/edit
  def edit
  end

  # POST /event_comments
  # POST /event_comments.json
  def create
    @event_comment = current_user.event_comments.build(event_comment_params)

    respond_to do |format|
      if @event_comment.save
        format.html { redirect_to :back }
        format.json { render :show, status: :created, location: @event_comment }
      else
        format.html { render :new }
        format.json { render json: @event_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_comments/1
  # PATCH/PUT /event_comments/1.json
  def update
    respond_to do |format|
      if @event_comment.update(event_comment_params)
        format.html { redirect_to @event_comment, notice: 'Event comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_comment }
      else
        format.html { render :edit }
        format.json { render json: @event_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_comments/1
  # DELETE /event_comments/1.json
  def destroy
    @event_comment.destroy
    respond_to do |format|
      format.html { redirect_to event_comments_url, notice: 'Event comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_comment
      @event_comment = EventComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_comment_params
      params.require(:event_comment).permit(:content, :user_id, :event_post_id)
    end
end
