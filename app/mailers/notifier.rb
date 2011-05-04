class Notifier < ActionMailer::Base
  default :from => 'justin@refactr.com',
          :return_path => 'system@refactr.com'

  def alert(recipient, test)
    @account = recipient
    @test = test
    mail(:to => recipient.email_address_with_name, :subject=>"Watchman: Test failed") do |format|
      format.text
    end
  end
end

