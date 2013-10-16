# Capistrano::Uwsgi


This gem provides two capistrano tasks:

* `uwsgi:setup` -- creates /etc/uwsgi/sites-available/YOUR\_APP and links it to /etc/uwsgi/sites-enabled/YOUR\_APP
* `uwsgi:reload` -- invokes `/etc/init.d/uwsgi reload` on server

And uwsgi configuration file generator, that will create local copy of default uwsgi config for customization.

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano-uwsgi'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-uwsgi

## Usage

Add this to your `config/deploy.rb` file:

    require 'capistrano/uwsgi/tasks'

Make sure, following variables are defined in your `config/deploy.rb`:

* `application` - application name
* `server_name` - your application's server_name in uwsgi (e.g. `example.com`)
* `deploy_to` - deployment path
* `sudo_user` - user name with sudo privileges (needed to config/restart uwsgi)
* `app_port` - application port (optional)

Launch new tasks:

    $ cap uwsgi:setup
    $ cap uwsgi:reload

Or you can add hook to call this tasks after `deploy:setup`. Add to your `config/deploy.rb`:

    after "deploy:setup", "uwsgi:setup", "uwsgi:reload"

If you want to customize uwsgi configuration, just generate local uwsgi config before running `uwsgi:setup`:

    $ rails generate capistrano:uwsgi:config

And then edit file `config/uwsgi.ini.erb` as you like.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## Credits

Original project structure and README from [Ivan Tkalin's capistrano-nginx](https://github.com/ivalkeen/capistrano-nginx).
