class PushBulletClient
  include APISmith::Client
  base_uri 'https://api.pushbullet.com/'

  def self.send_note(api_key, body = {})
    body.merge!({type: :note})

    post '/api/pushes', basic_auth: api_key, body: body
  end
end