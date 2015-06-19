# TODO update once we decide what to do with staging
set :deploy_to, "/home/deployer/rails/waverly"
set :branch, "master"
set :rails_env, "staging"
server '184.154.158.74', roles: [:app, :web, :db], user: 'deployer'
