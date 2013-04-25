class ContactMailer < ActionMailer::Base

   default :from => "support@cairnbrain.com",
           :cc =>   "admin@cairnbrain.com"
   

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.message.subject
  #
  
  def ContactResponse_email(message)
   
   @message = message
   mail(:to => message.email, :subject => "Thank You For Your Inquiry")
  end
end

