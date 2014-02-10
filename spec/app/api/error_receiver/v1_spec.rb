require './spec/spec_helper'

describe ErrorReceiver::Version1 do
  def app
    App::Api
  end

  def request_example
    JSON.parse '{"alert": { "created_at":"2012-11-01T20:06:19Z", "application_name":"Application name", "account_name":"Account name", "severity":"critical", "message":"Apdex score fell below critical level of 0.70", "short_description":"domain.com alert opened", "long_description":"Alert opened on domain.com: Apdex score fell below critical level of 0.70", "alert_url":"http://rpm.newrelic.com/accounts/?????/applications/???????/incidents/???????" }}'
  end

  describe 'POST /newrelic/webhook' do
    it 'should work' do
      post 'api/v1/newrelic/webhook', request_example
      last_response.status.should == 200
    end
  end
end