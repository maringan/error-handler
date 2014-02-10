module Users
  class Base < Grape::API
    def self.inherited(subclass)
      super
      subclass.instance_eval do
        helpers Users::Base::Auth

        rescue_from ActiveRecord::RecordNotFound do
          Rack::Response.new([ 'Record not found' ], 404, { 'Content-type' => 'error/text' }).finish
        end

        rescue_from ActiveRecord::RecordInvalid do |e|
          Rack::Response.new(e.record.errors.to_json, 422, { 'Content-type' => 'application/json' }).finish
        end

        rescue_from :all do
          Rack::Response.new([ 'Error !' ], 500, { 'Content-type' => 'text/error' }).finish
        end
      end
    end

    module Auth
      def authenticate!
        error!({status: 401, status_code: 'unauthorized'}, 401) if params[:api_key] != ENV['API_KEY']
      end
    end
  end
end