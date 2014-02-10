class ErrorReceiver::Version1 < ErrorReceiver::Base
  version 'v1', using: :path

  desc 'NewRelic webhook endpoint'
  params do
    requires :alert, type: Hash, desc: 'Alert from NewRelic'
  end
  post '/newrelic/webhook' do
    Sender.new.async.perform(params['alert']['application_name'],
                             params['alert']['long_description'])
    status 200
    { status: :ok }
  end
end

