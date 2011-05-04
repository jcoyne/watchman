ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => 'getmilemarker.com',
  :user_name            => 'accounts@getmilemarker.com',
  :password             => 'g3tm1l3mark3r',
  :authentication       => 'plain',
  :enable_starttls_auto => true  
}

