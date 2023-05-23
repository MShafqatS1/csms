class UsersController < ApplicationController

  before_action :select_user, only: [:show, :edit, :update, :destroy]

  before_action :require_login, except: [:new, :create]
  before_action :require_correct_user, only: [:edit, :update, :destroy]

  def index
    #Instance Variables for Admin Users
    @users = User.all
    @app = Appointment.all
    @user_admin = User.where(admin: true)

    #Instance Variables for Technician Users
    @tuser = current_user.appointments
    @techpassedapp = current_user.appointments.techpassedapp
    @techupcomingapp = current_user.appointments.techupcomingapp.order("appdate asc")
    @techupcomingappfirstrecord = current_user.appointments.techupcomingappfirstrecord

    #Instance Variables for Customer Users
    @cuser = current_user.appointments.order("appdate asc")
    @customerpastapp = current_user.appointments.customerpastapp
    @customerupcomingapp = current_user.appointments.customerupcomingapp.order("appdate asc")
    @customerupcomingappfirst = current_user.appointments.customerupcomingapp.first
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "User is Successfully Created"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user.update(user_params)
    if @user.save
      redirect_to @user, notice: "Data is Successfully Updated"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    if @user.destroy
      session[:user_id] = nil
      redirect_to users_path, notice: "User is Successfully Deleted"
    else
      render :show
    end
  end
  
  private
    def select_user
      @user = User.find(params[:id])
    end

    def require_correct_user
      redirect_to root_path unless current_user?(@user)
    end

    def user_params
      params.require(:user).
        permit(:name, :fname, :mname, :address, :number, :email, :country, :password, :password_confirmation, :dob, :role, :main_image)
    end
end