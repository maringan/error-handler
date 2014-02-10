module App
  class Api < Grape::API
    prefix 'api'
    format :json

    mount ErrorReceiver::Version1
    mount Users::Version1

    add_swagger_documentation api_version: 'v1'
  end
end