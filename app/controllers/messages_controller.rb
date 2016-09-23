class MessagesController < ApplicationController

  def new
    @message = Message.new
    @title = 'Azyza | Contacts'
    @section = 'contacts'
  end

  def create
    @message = Message.new(message_params)
    @title = 'Azyza | Contacts'
    @section = 'contacts'

    if @message.valid?
      MessageMailer.new_message(@message).deliver
    else
      flash[:alert] = "An error occurred while delivering this message."
      render :new
    end

  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :content)
  end

end