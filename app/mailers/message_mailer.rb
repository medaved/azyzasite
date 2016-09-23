class MessageMailer < ApplicationMailer
  default from: 'noreplyazyza@gmail.com'
  def new_message(message)
    @message = message
    mail to: 'noreplyazyza@gmail.com',
         subject: "Message from #{message.name}"
  end
end
