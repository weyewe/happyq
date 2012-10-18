class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :office_id 
      t.integer :seat_category_id 
      
      t.integer :creator_id 
      t.integer :canceler_id 
      t.integer :closer_id 
      
      
      t.integer :number_of_people 
      
      t.string :name 
      t.string :phone_number
      t.string :booking_code 
      
      t.integer :booking_status , :default => BOOKING_STATUS[:pending_seat]
            # 
            # t.integer :is_canceled , :default => false 
            # t.integer :is_active , :default => true # if this guy is not in the pending list, set it as is_active => false 
            # 
      

      t.timestamps
    end
  end
end
