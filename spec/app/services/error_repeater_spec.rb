require './spec/spec_helper'

describe ErrorRepeater do
  it 'should be creating with arguments' do
    ErrorRepeater.new({allert: 1}).should be_an_instance_of(ErrorRepeater)
  end
end