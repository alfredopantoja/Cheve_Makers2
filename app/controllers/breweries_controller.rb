class BreweriesController < ApplicationController
  before_filter :find_user

  def index
  	@breweries = Brewery.all
  end

  def show
  	@brewery = @user.brewery.find(params[:id])
  end

  def new
  end

  def edit
  end

  private

  	def find_user
  		@user = User.find(params[:user_id])
  	end
end
