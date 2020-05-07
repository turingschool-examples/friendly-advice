require 'rails_helper'

describe 'advice generator' do
  it 'should return an advice message', :vcr do
    message = AdviceGenerator.new.message

    expect(message).to_not be_empty
    expect(message.is_a?(String)).to be_truthy
  end
end
