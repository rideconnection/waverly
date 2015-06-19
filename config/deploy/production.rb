set :branch, 'stable'
set :rvm_ruby_version, '2.1.5@waverly'
set :passenger_rvm_ruby_version, '2.2.1@passenger'
set :deploy_to, '/home/deploy/rails/waverly'
set :default_env, { "RAILS_RELATIVE_URL_ROOT" => "/waverly" }

# capistrano-rails directives
set :rails_env, 'production'
set :assets_roles, [:web, :app]
set :migration_role, [:db]
set :conditionally_migrate, false

server 'apps.rideconnection.org', roles: [:app, :web, :db], user: 'deploy'
