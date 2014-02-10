module Users
  class Base < Grape::API
    def self.inherited(subclass)
      super
      subclass.instance_eval do
        rescue_from ActiveRecord::RecordNotFound do |e|
          Rack::Response.new([ 'Record not found' ], 404, { 'Content-type' => 'error/text' }).finish
        end

        rescue_from ActiveRecord::RecordInvalid do |e|
          Rack::Response.new(e.record.errors.to_json, 422, { 'Content-type' => 'application/json' }).finish
        end
      end
    end
  end
end