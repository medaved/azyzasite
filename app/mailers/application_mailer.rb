class ApplicationMailer < ActionMailer::Base
  default from: 'medavedik@yandex.ru'
  layout 'mailer'
  def new_message(message)
    @message = message

    mail subject: "Message from #{message.name}"
  end
end
