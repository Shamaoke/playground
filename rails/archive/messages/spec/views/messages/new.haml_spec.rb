
require 'rails_helper'

RSpec.describe 'messages/new', type: :view do

  let(:message) { mock_model('Message').as_new_record }
  let(:page) { Capybara.string(rendered) }
  let(:form) { page.find("form[method='post'][action='#{messages_path}']") }

  before(:each) do

    assign(:message, message)

    # p message.null_object?

    render
  end

  context 'page' do

    subject { page }

    it { is_expected.to have_selector "form[method='post'][action='#{messages_path}']" }
  end

  context 'form' do

    subject { form }

    it { is_expected.to have_selector "input[type='text'][name='message[title]']" }
    it { is_expected.to have_selector "input[type='submit']" }
  end

  # it 'renders a form to create a message' do
  #   assign(:message, mock_model('Message').as_new_record)
  #   render
  #   expect(rendered).to have_selector("form[method='post'][action='#{messages_path}']")
  # end

  # it 'renders a text field for the message title' do
  #   assign :message, mock_model('Message').as_new_record
  #   render
  #   page = Capybara.string(rendered)
  #   form = page.find("form[method='post'][action='#{messages_path}']")
  #   expect(form).to have_selector("input[type='text'][name='message[title]']")
  # end
end

