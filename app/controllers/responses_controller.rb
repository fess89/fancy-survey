class ResponsesController < ApplicationController
  def index
  	@response = Response.new
  end

  def create
  	@response = Response.new(params[:response])
  		if @response.save
		render :json => @response
  	else
  		head 422
  	end
  end

  def gifbin
    @gifbin = HTTParty.get('http://gifbin.com/random')
    render :partial => "gifbin"
  end

end