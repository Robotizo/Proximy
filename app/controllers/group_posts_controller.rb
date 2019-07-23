class GroupPostsController < ApplicationController
  before_action :set_group_post, only: [:show, :edit, :update, :destroy]
  before_action :set_groups_list, only: [:edit, :update, :new, :create]

  # GET /group_posts
  # GET /group_posts.json
  def index
    @group_posts = GroupPost.all
  end

  # GET /group_posts/1
  # GET /group_posts/1.json
  def show
  end

  # GET /group_posts/new
  def new
    @group_post = current_user.group_posts.build
  end

  # GET /group_posts/1/edit
  def edit
  end

  # POST /group_posts
  # POST /group_posts.json
  def create
    @group_post = current_user.group_posts.build(group_post_params)

    respond_to do |format|
      if @group_post.save
        format.html { redirect_to @group_post.group, notice: 'Your post was successfully created.' }
        format.json { render :show, status: :created, location: @group_post }
      else
        format.html { render :new }
        format.json { render json: @group_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_posts/1
  # PATCH/PUT /group_posts/1.json
  def update
    respond_to do |format|
      if @group_post.update(group_post_params)
        format.html { redirect_to @group_post, notice: 'Group post was successfully updated.' }
        format.json { render :show, status: :ok, location: @group_post }
      else
        format.html { render :edit }
        format.json { render json: @group_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_posts/1
  # DELETE /group_posts/1.json
  def destroy
    @group_post.destroy
    respond_to do |format|
      format.html { redirect_to group_posts_url, notice: 'Group post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_post
      @group_post = GroupPost.find(params[:id])
    end

    def set_groups_list
      followingGroupsIds = current_user.followingG.map(&:id)
      @groupsFollow = Group.find(params = followingGroupsIds).sort_by &:updated_at
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_post_params
      params.require(:group_post).permit(:content, :image, :group_id)
    end
end
