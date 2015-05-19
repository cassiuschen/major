require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MajorSelector
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
    config.generators do |g|
      g.factory_girl true
      g.assets false
      g.view_specs false
    end

    config.action_view.sanitized_allowed_tags = Set.new(%w(strong em b i p code pre tt samp kbd var sub sup dfn cite big small address hr br div span h1 h2 h3 h4 h5 h6 ul ol li dl dt dd abbr acronym a img blockquote del ins))
    config.action_view.sanitized_allowed_tags += %w(embed iframe strike u table td tr thead tbody tfoot th article header section footer figure figcaption)
    config.action_view.sanitized_allowed_attributes = Set.new(%w(href src width height alt cite datetime title class name xml:lang abbr))
    config.action_view.sanitized_allowed_attributes += %w(target data-knewone-embed-type data-knewone-embed-key data-knewone-embed-options data-knewone-embed-id contenteditable data-score data-profile-popover data-original)

    config.active_support.escape_html_entities_in_json = true
  end
end
