# frozen_string_literal: true

# config valid for current version and patch releases of Capistrano
lock '~> 3.16.0'

set :application, 'shipit_test'
set :repo_url, 'git@github.com:anyelopetit/shipit-test.git'
set :deploy_subdir, './backend-rails-api'
set :repo_tree, 'backend-rails-api'
set :rbenv_path, '/home/deploy/.rbenv'

# Default branch is :master
set :branch, 'main'
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/deploy/shipit-test'

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, 'config/database.yml'

# Default value for linked_dirs is []
# append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

# Default value for default_env is {}
# set :default_env, { path: '/opt/ruby/bin:$PATH' }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

set :linked_dirs, fetch(:linked_dirs, []).push(
  'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle',
  'public/system', 'public/uploads'
)

append :linked_files, 'config/database.yml', 'config/secrets.yml'

# set :rvm_ruby_version, '3.0.1'

set :passenger_restart_with_touch, true

namespace :deploy do
  task :install_dependencies do
    on roles(:web), in: :sequence, wait: 5 do
      within release_path do
        execute :bundle, "--without development test"
      end
    end
  end
  after :published, :install_dependencies
end
