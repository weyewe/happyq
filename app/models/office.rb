class Office < ActiveRecord::Base
  attr_accessible :name
  has_many :users 
  has_many :bookings 
  has_many :deliveries 
  has_many :seat_categories 
end
