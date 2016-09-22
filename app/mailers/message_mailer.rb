class MessageMailer < ApplicationMailer
  default from: 'medavedik@yandex.ru'
  def new_message(message)
    @message = message

    mail subject: "Message from #{message.name}"
  end
end
