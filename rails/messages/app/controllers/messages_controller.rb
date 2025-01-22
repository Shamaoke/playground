
class MessagesController < ApplicationController

  def create
    # Message.new(params[:one])
    Message.new(message_params)
    redirect_to messages_path

    # Message.new(params.expect(message: [:title]))
    # redirect_to action: :index
  end

  private
    # def message_params = params.require(:message).permit(:text)
    def message_params = params.expect(message: [:text])
end

