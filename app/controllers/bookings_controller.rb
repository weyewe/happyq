class BookingsController < ApplicationController
  def index
    @objects = Booking.joins(:deliveries)
    @new_object = Booking.new 
    
    
    add_breadcrumb "Queue Management", 'bookings_url'
  end
  
  
  def create 
    @new_object =  Booking.create_object( current_user, params[:booking])  
  end
  
  def send_table_ready_notification
    @booking = Booking.find_by_id params[:entity_id]
    @booking.send_table_ready_notification(current_user)
  end
  
  def close_booking
    @booking = Booking.find_by_id params[:entity_id]
    @booking.close_booking(current_user)
  end
  
  def cancel_booking
    @booking = Booking.find_by_id params[:entity_id]
    @booking.cancel_booking(current_user)
  end
  
  def refresh_booking_queue_row
    @object = Booking.find_by_id params[:object_id]
  end
  
end
