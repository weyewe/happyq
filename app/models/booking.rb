class Booking < ActiveRecord::Base
  attr_accessible :name, :phone_number, :seat_category_id, :number_of_people
  belongs_to :seat_category
  belongs_to :office 

  validates_presence_of :number_of_people, :seat_category_id, :name, :phone_number 
  validates_numericality_of :number_of_people 
  
=begin
  Object Creation
=end
  def self.create_object( employee, object_params ) 
    new_object = self.new object_params  
    new_object.creator_id = employee.id 

    # check that the phone number is the international format starts with +62
    if not new_object.is_international_format?( new_object.phone_number ) 
      new_object.errors.add(:phone_number , "Phone number has to be in international format: <b>+62</b> 821 255 73759." )  
      return new_object
    end
    
    if new_object.number_of_people.nil? or not new_object.number_of_people > 0 
      new_object.errors.add(:number_of_people , "Number of Guests has to be specified" )  
      return new_object
    end
 
    new_object.save 
    if new_object.persisted? 
      new_object.generate_yday
      new_object.generate_booking_code 
      new_object.send_confirmation_sms 
      # do the after_create activities 
      # send the sms confirmation 
    end

    return new_object
  end
  
  def is_international_format?( phone_number ) 
    if phone_number.nil? or phone_number.length ==0  
      return false 
    end
      
    phone_number = phone_number.gsub(/\s+/, '')  
      
    regex = /^\+/
    
    if phone_number.match regex
      return true 
    else
      return false 
    end
  end
  
  def generate_yday 
    creation_date = self.created_at.to_date
    self.yday = creation_date.yday
    self.year = creation_date.year 
    self.save 
  end
  
  def generate_booking_code
    today_date = DateTime.now.to_date 
    total_booking_for_today = Booking.bookings_for_date( self.yday, self.year ).count 
    booking_code = ( (self.year%1000).to_s + self.yday.to_s + total_booking_for_today.to_s ).to_i.to_s(16)
    self.booking_code = booking_code
    self.save 
  end
  
  
  def Booking.bookings_for_date( yday, year )
    Booking.where(:yday => yday , :year => year ) 
  end
  
  def send_confirmation_sms
    puts "SMS IS SENT"
  end
end
