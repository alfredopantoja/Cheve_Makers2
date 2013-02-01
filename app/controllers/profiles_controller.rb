class ProfilesController < ApplicationController
	before_filter :find_user
  before_filter :correct_user, only: [:destroy, :edit]

  def index
  	@profiles = Profile.all
  end

  def show
  	@profile = @user.profile
  end

  def new
  	@profile = @user.build_profile
  end

  def edit
  	@profile = @user.profile
  end

  def create
  	@profile = @user.create_profile(params[:profile])
  	if @profile.save
  		flash[:success] = "Profile was successfully created."
  		redirect_to user_profile_url(@user)
  	else
  		render 'new'
  	end
  end

  def update
  	@profile = @user.profile
  	if @profile.update_attributes(params[:profile])
  		flash[:success] = "Profile was updated."
  		redirect_to user_profile_url(@user)
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@user.profile.destroy
  	flash[:success] = "Profile destroyed."
  	redirect_to root_url
  end

  private

  	def find_user
  		@user = User.find(params[:user_id])
  	end

    def correct_user
      redirect_to root_url unless current_user == User.find(params[:user_id])
    end

end
