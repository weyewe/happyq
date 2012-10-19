require 'httparty'
class Delivery < ActiveRecord::Base
  # attr_accessible :title, :body
  
  
  SENTLY_BASE_URL =  'https://sent.ly/command/sendsms?'
  
  def self.extract_authentication
    params = {}
    if Rails.env.production?
      params = YAML::load( File.open( Rails.root.to_s + "/config/sently.yml") )
    elsif Rails.env.development?
      params = YAML::load( File.open( Rails.root.to_s + "/config/sently_dev.yml") )
    end
    
    return params
  end
  
  def self.send_sms(booking,  text)
    params = self.extract_authentication 
    office = booking.office 
    #compose URL
    # https://sent.ly/command/sendsms?username=w.yunnal@gmail.com&password=aramita1987W&to=%2B6282125573759&text=we.use+capital+letter.
    url = SENTLY_BASE_URL + 
          'username=' + params['auth']['username'] + '&' 
          'password=' + params['auth']['password'] + '&'  
          'to=' + CGI::escape( booking.phone_number) + '&' + 
          'text=' + CGI::escape(  text )
    puts "The URL: #{url}\n"*10
    response = HTTParty.get( url )
    
    response.parsed_response
    # successful : "Id:137967" 
    # error : "Error:0"
    # deduce the return value 
    {
      :error
    }
    
    
    return response 
  end
  
end
