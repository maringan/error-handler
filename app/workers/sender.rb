class Sender
  include SuckerPunch::Job

  def perform(title, body)
    ActiveRecord::Base.connection_pool.with_connection do
      User.all.each do |user|
        er = ErrorRepeater.new(user, title, body)
        er.send_and_update_user!
      end
    end
  end
end