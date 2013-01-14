class Brewery < ActiveRecord::Base
  attr_accessible :address, :city, :description, :email, :name, :phone_number, :state, :user_id, :zipcode
  belongs_to :user
end
