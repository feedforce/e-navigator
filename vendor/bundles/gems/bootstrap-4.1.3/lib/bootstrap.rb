require 'bootstrap/version'
require 'popper_js'

module Bootstrap
  class << self
    # Inspired by Kaminari
    def load!
      if rails?
        register_rails_engine
      elsif hanami?
        register_hanami
      elsif sprockets?
        register_sprockets
      end

      configure_sass
    end

    # Paths
    def gem_path
      @gem_path ||= File.expand_path '..', File.dirname(__FILE__)
    end

    def stylesheets_path
      File.join assets_path, 'stylesheets'
    end

    def javascripts_path
      File.join assets_path, 'javascripts'
    end

    def assets_path
      @assets_path ||= File.join gem_path, 'assets'
    end

    # Environment detection helpers
    def sprockets?
      defined?(::Sprockets)
    end

    def rails?
      defined?(::Rails)
    end

    def hanami?
      defined?(::Hanami)
    end

    private

    def configure_sass
      require 'sass'

      ::Sass.load_paths << stylesheets_path
    end

    def register_rails_engine
      require 'bootstrap/engine'
    end

    def register_sprockets
      Sprockets.append_path(stylesheets_path)
      Sprockets.append_path(javascripts_path)
    end

    def register_hanami
      Hanami::Assets.sources << assets_path
    end
  end
end

Bootstrap.load!
