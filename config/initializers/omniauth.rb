f_app_id = Option.find_by_key('facebook_app_id')
f_app_secret = Option.find_by_key('facebook_secret_id')

OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, (f_app_id.get_value if f_app_id), (f_app_secret.get_value if f_app_secret), :image_size => 'normal'
end

