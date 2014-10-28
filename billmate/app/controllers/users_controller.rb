class UsersController < ApplicationController
  before_filter :authenticate_user!

  attr_accessible :id, :name, :email, :password, 
                  :password_confirmation, :remember_me

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

end