class ErrorReceiver::Version1 < ErrorReceiver::Base
  version 'v1', using: :path

  post '/newrelic/webhook' do
    Sender.new.async.perform(params['alert']['application_name'],
                             params['alert']['long_description'])
    status 200
    { status: :ok }
  end
end

