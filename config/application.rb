require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.i18n.default_locale = :ja  #default_localeをjaに編集。そのあとにlocalesにja.yml精製
    config.time_zone= 'Tokyo'  #時間を日本時間するにはconfig/applicationに追加。
  end
end
