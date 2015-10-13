class UsersController < ApplicationController
  before_action :set_user, only: %i(show edit update destroy)
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      respond_to do |format|
        format.html { redirect_to users_path, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created }
      end
    else
      respond_to do |format|
        format.html {
          render :new
        }
        format.json { render json: @user.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def update

    if @user.update_attributes(user_params)
      respond_to do |format|
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
        format.json { render json: @user, status: :created }
      end
    else
      edit
      render :edit
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'User was successfully removed.' }
      format.json { render json: @user, status: :ok }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end
