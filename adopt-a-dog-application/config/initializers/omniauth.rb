Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], scope: "user", provider_ignores_state: true
end

OmniAuth.config.logger = Rails.logger