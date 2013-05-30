# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
SendgridCloudfoundryRails::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => '',
  :password       => '',
  :domain         => 'example.com',
  :enable_starttls_auto => true
}
