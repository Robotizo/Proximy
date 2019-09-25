class GroupCommentsController < ApplicationController
  before_action :set_group_comment, only: [:show, :edit, :update, :destroy]

  # GET /group_comments
  # GET /group_comments.json
  def index
    @group_comments = GroupComment.all
  end

  # GET /group_comments/1
  # GET /group_comments/1.json
  def show
  end

  # GET /group_comments/new
  def new
    @group_comment = GroupComment.new
  end

  # GET /group_comments/1/edit
  def edit
  end

  # POST /group_comments
  # POST /group_comments.json
  def create
    @group_comment = current_user.group_comments.build(group_comment_params)

    respond_to do |format|
      if @group_comment.save
        format.html { redirect_to :back }
        format.json { render :show, status: :created, location: @group_comment }
      else
        format.html { render :new }
        format.json { render json: @group_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_comments/1
  # PATCH/PUT /group_comments/1.json
  def update
    respond_to do |format|
      if @group_comment.update(group_comment_params)
        format.html { redirect_to @group_comment, notice: 'Group comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @group_comment }
      else
        format.html { render :edit }
        format.json { render json: @group_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_comments/1
  # DELETE /group_comments/1.json
  def destroy
    @group_comment.destroy
    respond_to do |format|
      format.html { redirect_to group_comments_url, notice: 'Group comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_comment
      @group_comment = GroupComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_comment_params
      params.require(:group_comment).permit(:content, :user_id, :group_post_id)
    end
end
