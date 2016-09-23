class ApplicationMailer < ActionMailer::Base
  default from: 'noreplyazyza@gmail.com'
  layout 'mailer'
  def new_message(message)
    @message = message

    mail subject: "Message from #{message.name}"
  end
end
