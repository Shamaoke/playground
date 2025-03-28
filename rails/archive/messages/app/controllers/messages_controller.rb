
class MessagesController < ApplicationController

  def create

    @message = Message.new(message_params)
    if @message.save
      redirect_to messages_path, notice: 'The message was saved successfully'
    else
      flash.now[:alert] = 'The message saving was failed'
      render :new
    end
  end

  private
    ##
    ## def message_params = params.require(:message).permit(:text)
    ##
    ## Is the same as the following.
    ##
    def message_params = params.expect(message: [:text])
end

