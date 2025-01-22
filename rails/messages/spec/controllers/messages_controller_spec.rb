
require 'rails_helper'

describe MessagesController, type: :controller do

  describe 'POST create' do

    # it 'creates a new message' do
    #   params = ActionController::Parameters.new({ message: { title: 'a quick brown fox' } })
    #   expect(Message).to receive(:new).with(params.expect(message: [:title]))
    #   # expect(Message).to receive(:new).with(message: { text: 'a quick brown fox' })
    #   post :create, params: { message: { title: 'a quick brown fox' } }
    # end

    let(:message_params) do
      # ActionController::Parameters
      #   .new(message: { text: 'ok' })
      #   .require(:message)
      #   .permit(:text)
      ActionController::Parameters
        .new(message: { text: 'ok' })
        .expect(message: [:text])
    end

    let(:message) { stub_model(Message) }

    it 'creates a new message' do
      # message = stub_model(Message)
      expect(Message).to receive(:new).with(message_params).and_return(message)
      post :create, params: { message: { text: 'ok' } }
    end

    it 'redirects to the Message index' do
      post :create, params: { message: { text: 'ok' } }
      expect(response).to redirect_to(messages_path)
    end

    # it 'saves the message'

    # it 'redirects to the Messages index' do
    #   post :create, params: { message: { title: 'a quick brown fox' } }
    #   expect(response).to redirect_to(action: :index)
    # end
  end
end

