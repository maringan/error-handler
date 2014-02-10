class ErrorReceiver::Version1 < ErrorReceiver::Base
  version 'v1', using: :path

  post '/newrelic/webhook' do
    #ErrorRepeater.new(params['alert']).create_worker
  end
end

