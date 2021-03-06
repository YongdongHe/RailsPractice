class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user , only: [:edit, :update, :index ]
  before_action :correct_user , only: [:edit, :update ]
  
  # GET /users.json
  def index
    @users = User.all
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

  def search
    # @user_id = params[:test]
    @user_name = params[:user_name]
    u = User.find_by(:name => @user_name)
    respond_to do |format|
      if u!=nil
        data = {'json'=>'json_data',:name => u.name ,id: u.id,:email => u.email, :status => 'success'}
        format.json { render json: data }
      else
        data = {:status => 'fail'}
        format.json { render json: data}
      end
      # format.json { render json: data }
    end

    # respond_to do |format|
    #   format.js
    # end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        flash[:success] = 'Welcome to 404 not found'
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def signed_in_user
      # if signed_in?
      # else
      #   store_location
      #   flash[:notice] = "Please sign in."
      #   redirect_to signin_url
      # end
      unless signed_in?
        store_location
        flash[:notice] = "Please sign in."
        redirect_to signin_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      unless current_user?(@user)
        redirect_to (root_path) 
      end
    end

    # def correct_user
    #   @user = User.find(params[:id])
    #   if current_user?(@user)
    #   else
    #     redirect_to root_path
    #   end          
    # end
end