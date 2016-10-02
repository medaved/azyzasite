class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.valid?
      MessageMailer.new_message(@message).deliver
      flash[:alert] = "Thank you for your message, in the near future I will try to answer you."
      redirect_to contact_path
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