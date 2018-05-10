class UsersController < ApplicationController

  def index
  end

  def new
  end

  def create
    @user = User.new(params.require(:user).permit(:first_name, :last_name, :email))
    if @user.save
      flash[:notice] = ['User successfully created']
      redirect_to user_path(User.last)
    elsif @user.first_name.blank?
      flash[:notice] = ["First name can't be blank"]
      redirect_to new_user_path
    elsif @user.last_name.blank?
      flash[:notice] = ["Last name can't be blank"]
      redirect_to new_user_path
    elsif @user.email.blank?
      flash[:notice] = ["Email can't be blank"]
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
    render 'show'
  end
end
