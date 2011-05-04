class User < ActiveRecord::Base

  def email_address_with_name
    "#{name} <#{email}>"
  end
end
