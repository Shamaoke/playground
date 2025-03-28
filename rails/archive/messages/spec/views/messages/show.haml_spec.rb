
require 'rails_helper'

RSpec.describe 'messages/show', type: :view do
  it 'displays the text attribute of the message' do
    assign(:message, double('Message', text: 'Hello, world!'))
    render
    expect(rendered).to match /Hello, world!/
  end
end

