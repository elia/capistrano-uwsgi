Capistrano::Configuration.instance.load do
  set(:uwsgi_ini) { "/etc/uwsgi/apps-enabled/#{application}-#{stage}.ini" }

  namespace :uwsgi do
    desc 'Setup application in uwsgi'
    task :setup, :role => :web do
      config_file = 'config/uwsgi.ini.erb'
      unless File.exists?(config_file)
        config_file = File.expand_path('../../../generators/capistrano/uwsgi/templates/_uwsgi_conf.ini.erb', __FILE__)
      end
      config = ERB.new(File.read(config_file)).result(binding)
      set :user, sudo_user
      temp_file = '/tmp/#{application}-#{$$}-#{Time.now.to_i}'
      put config, temp_name
      run "#{sudo} mv /tmp/#{application} /etc/uwsgi/sites-available/#{application}"
      run "#{sudo} ln -fs /etc/uwsgi/sites-available/#{application} /etc/uwsgi/sites-enabled/#{application}"



      uwsgi_config = <<-INI
      INI
      conf_name = File.basename(uwsgi_ini)
      tmp_name = "/tmp/#{conf_name}"
      sudo "rm #{tmp_name} || true"
      put uwsgi_config, tmp_name
      sudo "mv -f #{tmp_name} #{uwsgi_ini}"
    end

    desc "Reload uwsgi configuration"
    task :reload, :role => :web do
      set :user, sudo_user
      run "#{sudo} /etc/init.d/uwsgi reload"
    end
  end
end
