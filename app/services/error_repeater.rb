class ErrorRepeater
  def initialize(user, title, body)
    @user = user
    @message = { title: title, body: body, target_email: @user.email }
  end

  def send_and_update_user!
    response = PushBulletClient.send_note api_key, @message
    @user.update_attributes!(iden: response['iden'])
  end

  private
    def api_key
      @@API_KEY ||= { username: ENV['PUSH_BULLET_API_KEY'], password: ''}
    end
end