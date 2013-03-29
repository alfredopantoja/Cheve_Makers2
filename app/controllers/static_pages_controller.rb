class StaticPagesController < ApplicationController
  def home
  	@users = User.all
  	@user = current_user
  	@brewery = current_user.breweries.build
  end

  def help
  end

  def about
  end

  def contact
  end
end
