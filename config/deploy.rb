# config valid only for current version of Capistrano
lock '3.6.1'

set :application, 'AzyzaSite'
set :repo_url, 'https://github.com/medaved/azyzasite.git'
application = 'AzyzaSite'
set :rvm_type, :user
set :rvm_ruby_version, '2.3.0-p0'
set :deploy_to, '/var/www/apps/AzyzaSite'


set :linked_dirs, %w{public/galleries}

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, 'config/database.yml', 'config/secrets.yml'

# Default value for linked_dirs is []
# append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
namespace :deploy do
  desc 'Setup'
  task :setup do
    on roles(:all) do
      execute "mkdir  #{shared_path}/config/"
      execute "mkdir  /var/www/apps/#{application}/run/"
      execute "mkdir  /var/www/apps/#{application}/log/"
      execute "mkdir  /var/www/apps/#{application}/socket/"
      execute "mkdir #{shared_path}/system"

      upload!('shared/database.yml', "#{shared_path}/config/database.yml")
      upload!('shared/secrets.yml', "#{shared_path}/config/secrets.yml")



      upload!('shared/nginx.conf', "#{shared_path}/nginx.conf")
      sudo 'stop nginx'
      sudo "rm -f /usr/local/nginx/conf/nginx.conf"
      sudo "ln -s #{shared_path}/nginx.conf /usr/local/nginx/conf/nginx.conf"
      sudo 'start nginx'

      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, "db:create"
        end
      end



    end
  end

  desc 'Create symlink'
  task :symlink do
    on roles(:all) do
      execute "ln -s #{shared_path}/config/database.yml #{release_path}/config/database.yml"
      execute "ln -s #{shared_path}/config/secrets.yml #{release_path}/config/secrets.yml"
      execute "ln -s #{shared_path}/galleries #{release_path}/public/galleries"
    end
  end

   desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      "thin restart -C /etc/thin/#{application}.yml"
    end
  end

  after :finishing, 'deploy:cleanup'
  after :finishing, 'deploy:restart'

  after :updating, 'deploy:symlink'


  before :setup, 'deploy:starting'
  before :setup, 'deploy:updating'
  before :setup, 'bundler:install'
end