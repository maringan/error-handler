module ErrorReceiver
  class Base < Grape::API
    def self.inherited(subclass)
      super
      subclass.instance_eval do
        version 'v1', using: :path, format: :json
      end
    end
  end
end
