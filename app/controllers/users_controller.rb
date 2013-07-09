class UsersController < ApplicationController

  def index
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
    if @user.save
      render :edit
  	else
      head 422
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user
      render :edit
    else
      head 422
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(params[:user])
    if @user.save
      @gifbin = HTTParty.get('http://gifbin.com/random')
      render :prize
    else
      head 422
    end
  end

  def gifbin
    @gifbin = HTTParty.get('http://gifbin.com/random')
    render :prize
  end

end
