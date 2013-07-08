class UsersController < ApplicationController
  def index
  	@user = User.new
  	@response = Response.new
  end

  def create
  	@user = User.new(params[:user])
  		if @user.save
		render :json => @user
  	else
  		head 422
  	end
  end

end
