COMPANY_NAME = "happyQ"
COMPANY_TITLE = "happyQ"
=begin
  MODEL CONSTANT
=end
JAKARTA_HOUR_OFFSET = 7 
# in the whole application 
USER_ROLE = { 
  :manager => "Manager", 
  :employee => "Employee" 
}
 

 

DEFAULT_TIMEZONE = "Jakarta"
DEFAULT_TIME_OFFSET = 7 

MIN_YDAY = 1
MAX_YDAY = 366


DEFAULT_IMPORTANT_EVENT_PERIOD = 60

# JOB REQUEST SPECIFIC 

PROJECT_ROLE_COLOR = {
  :main_crew => 'red',
  :crew => 'pink',
  :project_manager => 'purple',
  :account_executive => 'blue',
  :production => 'orange',
  :post_production => '',
  :quality_control => 'green',
  
  :head_project_manager => 'yellow'
}

JOB_REQUEST_ROLE_TEXT = {
  :main_crew => "Main Crew",
  :crew => 'Crew',
  :project_manager => 'PM',
  :account_executive => 'AE',
  :production => 'Prod',
  :post_production => 'PostProd',
  :quality_control => 'QC'
}
 
=begin
  CONSTANT for AJAX
=end
TRUE_CHECK = 1
FALSE_CHECK = 0

PROPOSER_ROLE = 0 
APPROVER_ROLE = 1





=begin
  UTILITY ASSETs
=end
AVATAR_IMAGE = "https://s3.amazonaws.com/potoschool_icon/default_profile_pic.jpg"
TRANSLOADIT_UPLOAD_URL = "http://api2.transloadit.com/assemblies"
UPLOADIFY_SWF_URL = "http://s3.amazonaws.com/circle-static-assets/uploadify.swf"
UPLOADIFY_CANCEL_URL = "http://s3.amazonaws.com/circle-static-assets/uploadify-cancel.png"
UPLOADIFIVE_CANCEL_URL = "http://s3.amazonaws.com/circle-static-assets/uploadify-cancel.png"
PRELOADER_URL = "http://s3.amazonaws.com/circle-static-assets/ajax-loader.gif"


=begin
  DISPLAY RELATED
=end
INDEPENDENT_ARTICLE_VALUE = 0 
ARTICLE_FROM_PROJECT_VALUE =  1 

FRONT_PAGE_WIDTH = 325
ARTICLE_WIDTH = 800

S3_BUCKET_BLOG_DEV  = 'nomina-dev'
S3_BUCKET_BLOG_PROD = 'nomina-prod'


SHOWLOADING_LOADER_URL = "http://s3.amazonaws.com/circle-static-assets/loading.gif"

# APP HELPER
HIDE_TABLE = "object_list_hidden"

=begin
JOB REQUEST SPECIFIC
=end
NUMBER_OF_DAYS_TO_START_PRODUCTION = 7
NUMBER_OF_DAYS_TO_START_PRODUCTION_SCHEDULING = 4

SHOW_NOTE = true 


BOOKING_STATUS = {
  :pending_seat => 0, 
  :seat_ready => 1 , 
  :closed => 2, 
  :canceled => 3 
}

SMS_DELIVERY_STATUS=  {
  :pending_trigger_send => 0 ,
  :sent_not_confirmed => 1, 
  :sent_confirmed => 2 
}

SMS_DELIVERY_CASE = {
  :confirmation => 0, 
  :seat_ready => 1 
}

