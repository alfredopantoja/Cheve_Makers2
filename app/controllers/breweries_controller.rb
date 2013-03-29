class BreweriesController < ApplicationController
  before_filter :find_user
  before_filter :correct_user, only: [:destroy, :edit]

  def index
  	@breweries = @user.breweries
  end

  def show
  	@brewery = @user.breweries.find(params[:id])
  end

  def create
    @brewery = @user.breweries.new(params[:brewery])
    if @brewery.save
      redirect_to [@user, @brewery]
    else
      render @user
    end    
  end

  def update
    @brewery = @user.breweries.find(params[:id])
    if @brewery.update_attributes(params[:brewery])
      flash[:success] = "Brewery was updated."
      redirect_to root_url
    else
      render root_url
    end
  end

  def destroy
    @brewery = @user.breweries.find(params[:id])
    @brewery.destroy
    redirect_to root_url, notice: "Brewery deleted."
  end    

  private

  	def find_user
  		@user = User.find(params[:user_id])
  	end

    def correct_user
      redirect_to root_url unless current_user == User.find(params[:user_id])
    end
end
