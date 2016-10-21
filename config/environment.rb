ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => 'app47202154@heroku.com',
  :password       => 't1sau2pc8549',
  :domain         => 'heroku.com',
  :enable_starttls_auto => true
}

# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
