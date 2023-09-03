class ManagementUsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :user
  before_action :set_user, only: %i[ show edit update destroy ]
  # GET /examples or /examples.json
  def index
    @users = User.all
    @user = User.new
  end

  # GET /examples/1 or /examples/1.json
  def show
  end

  # GET /examples/new
  def new
    @user = User.new
  end

  # GET /examples/1/edit
  def edit
  end

  # POST /examples or /examples.json
  def create
    actor = Users::Creator.result(user_params)

    respond_to do |format|
      if actor.success? 
        format.html { redirect_to management_users_path, notice: "user was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: actor.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    actor = Users::Updator.result(user: @user, **user_params)
    respond_to do |format|
      if actor.success? 
        format.html { redirect_to management_users_path, notice: "User #{@user.username} was successfully updated." }
        format.json { render :show, status: :ok, location: actor.user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: actor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /examples/1 or /examples/1.json
  def destroy
    @example.destroy

    respond_to do |format|
      format.html { redirect_to examples_url, notice: "Example was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :roles)
    end
end
