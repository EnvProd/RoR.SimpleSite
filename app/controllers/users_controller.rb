class UsersController < ApplicationController
  #before_action :set_user, only: [:show, :edit, :update, :update_name, :update_email, :update_password, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: [:destroy, :update_confirmed]
  before_action :signed_in_user, only: [:show, :index, :edit, :update]


  # GET /users
  # GET /users.json
  def index
    @users = User.paginate(page: params[:page])
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        cookies.permanent[:username] = params[:user][:first_name]
        cookies.permanent[:email] = params[:user][:email]
        #sign_in @user
        format.html { redirect_to registred_path }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash.now[:success] = "Изменения сохранены"
      render 'edit'
    else
      render 'edit'
    end
  end

  def update_name
    @user = User.find(params[:user_id])
    if @user.update_attributes(first_name: params[:user][:first_name], second_name: params[:user][:second_name])
      #if User.update(params[:user_id], first_name: params[:user][:first_name], second_name: params[:user][:second_name])
      flash.now[:success] = "Изменения сохранены"
      redirect_to edit_user_path(params[:user_id])
    else
      render 'edit'
    end
  end

  def update_email
    @user = User.find(params[:user_id])
    if @user.update_attributes(user_settings_email_params)
      flash.now[:success] = "Изменения сохранены"
      render 'edit'
    else
      render 'edit'
    end
  end

  def update_password
    @user = User.find(params[:user_id])
    if @user.update_attributes(user_settings_password_params)
      flash.now[:success] = "Изменения сохранены"
      render 'edit'
    else
      render 'edit'
    end
  end

  def update_confirmed
    @user = User.find(params[:user_id])
    if @user.update_attribute("is_confirmed", params[:user][:is_confirmed])
      #if @user.update_attributes(user_settings_confirm_params)
      redirect_to users_path, notice: "Изменения сохранены"
    else
      redirect_to users_path, notice: @user.errors
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Пользователь удален"
    redirect_to users_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :email, :password, :password_confirmation)
    end

    def user_settings_name_params
      params.require(:user).permit(:first_name, :second_name)
    end

    def user_settings_email_params
      params.require(:user).permit(:email)
    end

    def user_settings_password_params
      #params.require(:user).permit(:password, :password_confirmation)
    end

    def user_settings_confirm_params
      params.require(:user).permit(:is_confirmed)
    end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Для доступа войдите в свою учетную запись"
      end
    end

    def correct_user
      if current_user.admin?
        admin_user
      else 
        @user = User.find(params[:id])
        redirect_to(root_url) unless current_user?(@user)
      end
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
