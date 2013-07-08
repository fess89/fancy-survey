class UsersController < ApplicationController

  def index
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
    if @user.save
      render :create
  	else
      head 422
    end
  end

  def edit
    @user = User.find_by_id(params[:id])
    if @user
      render :edit
    else
      head 422
    end
  end

  def update
    @user = User.find_by_id(params[:id])
  end

  def answer
  end

end
