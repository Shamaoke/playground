
require 'rails_helper'

describe MessagesController, type: :controller do

  describe 'POST create' do

    let(:message_params) do
      ##
      ## ActionController::Parameters
      ##   .new(message: { text: 'ok' })
      ##   .require(:message)
      ##   .permit(:text)
      ##
      ## Is the same as the following.
      ##
      ActionController::Parameters
        .new(message: { text: 'ok' })
        .expect(message: [:text])
    end

    let(:message) { stub_model(Message) }

    it 'creates a new message' do
      expect(Message).to receive(:new).with(message_params).and_return(message)
      post :create, params: { message: { text: 'ok' } }
    end

    it 'saves the message' do
      message = mock_model(Message)
      ##
      ## Message.stub(:new).and_return(message)
      ##
      ## The following is the new and preferred syntax for the former.
      ##
      allow(Message).to receive(:new).with(message_params).and_return(message)
      expect(message).to receive(:save)
      post :create, params: { message: { text: 'ok' } }
    end

    context 'save succeed' do

      it 'sets a notification message' do
        post :create, params: { message: { text: 'ok' } }
        expect(flash[:notice]).to eq('The message was saved successfully')
      end

      it 'redirects to the Message index' do
        post :create, params: { message: { text: 'ok' } }
        expect(response).to redirect_to(messages_path)
      end
    end

    context 'save failed' do

      before do
        allow(Message).to receive(:new).with(message_params).and_return(message)
        allow(message).to receive(:save).and_return(false)
      end

      it 'assigns @message' do
        post :create, params: { message: { text: 'ok' } }
        expect(assigns(:message)).to eq(message)
      end

      it 'renders the new template' do
        post :create, params: { message: { text: 'ok' } }
        expect(response).to render_template('new')
      end

      it 'sets an alert message' do
        post :create, params: { message: { text: 'ok' } }
        expect(flash[:alert]).to eq('The message saving was failed')
      end
    end
  end
end

