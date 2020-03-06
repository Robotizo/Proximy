class TestUsersController < ApplicationController
  before_action :set_test_user, only: [:show, :edit, :update, :destroy]

  # GET /test_users
  # GET /test_users.json
  def index
    @test_users = TestUser.all
  end

  # GET /test_users/1
  # GET /test_users/1.json
  def show
  end

  # GET /test_users/new
  def new
    @test_user = TestUser.new
  end

  # GET /test_users/1/edit
  def edit
  end

  # POST /test_users
  # POST /test_users.json
  def create
    @test_user = TestUser.new(test_user_params)

    respond_to do |format|
      if @test_user.save
        format.html { redirect_to root_url, notice: 'Test user was successfully created.' }
        format.json { render :show, status: :created, location: @test_user }
      else
        format.html { render :new }
        format.json { render json: @test_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_users/1
  # PATCH/PUT /test_users/1.json
  def update
    respond_to do |format|
      if @test_user.update(test_user_params)
        format.html { redirect_to @test_user, notice: 'Test user was successfully updated.' }
        format.json { render :show, status: :ok, location: @test_user }
      else
        format.html { render :edit }
        format.json { render json: @test_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_users/1
  # DELETE /test_users/1.json
  def destroy
    @test_user.destroy
    respond_to do |format|
      format.html { redirect_to test_users_url, notice: 'Test user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_user
      @test_user = TestUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_user_params
      params.require(:test_user).permit(:email)
    end
end
