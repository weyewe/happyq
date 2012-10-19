class Office < ActiveRecord::Base
  attr_accessible :name
  has_many :users 
  has_many :bookings 
  has_many :deliveries 
  has_many :seat_categories 
  
  after_create :create_channel_code
  
  
  
  def create_channel_code
    creation_time = self.created_at
    channel_code = ""
    channel_code << creation_time.year.to_s + creation_time.month.to_s + creation_time.day.to_s 
    channel_code << self.id.to_s
    self.channel_code = channel_code.to_i.to_s(16)
    self.save 
  end
end
