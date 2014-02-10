class ErrorReceiver::Version1 < ErrorReceiver::Base
  version 'v1', using: :path, format: :json

  post '/newrelic/webhook' do

  end
end
