# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Ncaa::Application.initialize!
WIN_THRESHOLD = 40

ActionMailer::Base.smtp_settings = {
  :address        => "smtp.sendgrid.net",
  :port           => "25",
  :authentication => :plain,
  :user_name      => ENV['SENDGRID_USERNAME'],
  :password       => ENV['SENDGRID_PASSWORD'],
  :domain         => ENV['SENDGRID_DOMAIN']
}