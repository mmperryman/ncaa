ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['SENDGRID_USERNAME'],
  :password       => ENV['SENDGRID_PASSWORD'],
  :domain         => 'heroku.com'
}
ActionMailer::Base.delivery_method = :smtp
# 
# ActionMailer::Base.smtp_settings = {
#   :address              => "smtp.gmail.com",
#   :port                 => "587",
#   :domain               => "gmail.com",
#   :user_name            => "mmperryman@gmail.com",
#   :password             => "lowes88",
#   :authentication       => :plain,
#   :enable_starttls_auto => true
# }

# ActionMailer::Base.delivery_method = :sendmail
# 
# ActionMailer::Base.sendmail_settings = { :address => "smtp.gmail.com", :port => "587", :domain => "gmail.com", :user_name => "mmperryman@gmail.com", :password => "lowes88", :authentication => "plain", :enable_starttls_auto => true }