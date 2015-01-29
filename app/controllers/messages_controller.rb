class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def create
    @message = Message.new(message_params)
    current_user.messages.push @message
  end

  private
  def message_params
    params.require(:message).permit(:body)
  end
end
