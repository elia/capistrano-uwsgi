module Capistrano
  module Uwsgi
    module Generators
      class ConfigGenerator < Rails::Generators::Base
        desc 'Create local uwsgi configuration file for customization'
        source_root File.expand_path('../templates', __FILE__)

        def copy_template
          copy_file '_uwsgi_conf.erb', 'config/uwsgi.ini.erb'
        end
      end
    end
  end
end
