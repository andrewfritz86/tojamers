class UsersController < ApplicationController

# before_action :load_user, only: [:show, :edit, :destroy, :update,]
# before_action :authenticate, only: [:show, :edit, :destroy, :update,]
# before_action :authorize, only: [:show, :edit, :destroy, :update,]

before_action :authenticate_user!


  def index
  end

  def new
    @user = User.new
  end

  def create
    a = User.create(user_params)
    session[:user_id] = a.id
    redirect_to user_path(a)
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:password, :first_name, :last_name, :email, :phone, :company, :user_type)
  end

    def load_user
      @user = User.find(params[:id])
      redirect_to root_path if !@user
    end

    def authenticate
      redirect_to root_path if !logged_in?#if the sessions u?er is returning nil, let's redirect to login
    end

    def authorize

      if current_user != @user #here we are making sure that the user coming from params is the same as the user in params
      redirect_to user_path(current_user)
      end

    end

end
