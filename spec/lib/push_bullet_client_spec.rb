require './spec/spec_helper'

describe PushBulletClient do
  let(:push) { PushBulletClient }

  context 'self.send_note' do
    it 'should generate right arguments' do
      push.stub(:post) { true }
      body = { title: 1, targe_email: 'mail@mail.pl' }
      push.send_note('123', body)

      body.should include({type: :note})
    end
  end
end