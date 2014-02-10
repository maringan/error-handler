module App
  class Api < Grape::API
    prefix 'api'
    format :json

    mount ErrorReceiver::Version1
  end
end