require './spec/spec_helper'

describe ErrorRepeater do
  before(:all) { ENV['PUSH_BULLET_API_KEY'] = '123' }

  it 'should correct initialize object' do
    user = OpenStruct.new
    user.email = 'eamil@email.pl'
    title = 'title'
    body  = 'body'
    error_repeater = ErrorRepeater.new(user, title, body)

    error_repeater.should be_an_instance_of(ErrorRepeater)
    error_repeater.instance_variable_get(:@message).should == { title: title, body: body, target_email: user.email }
  end

  context 'send_and_update_user!' do
    it 'should update user iden' do
      PushBulletClient.stub(:send_note) { fake_response }
      user  = create(:user)
      title = 'fake title'
      body  = 'fake body'

      error_r = ErrorRepeater.new user, title, body
      error_r.send_and_update_user!

      User.first.iden.should == 'new iden'
    end
  end

  def fake_response
    os = OpenStruct.new
    os.iden = 'new iden'
    os
  end
end