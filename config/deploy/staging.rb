set :deploy_to, "/home/deployer/rails/waverly"
set :branch, "master"
set :rvm_ruby_string, 'ruby-2.1.4@waverly'
set :rails_env, "staging"

role :web, "184.154.158.74"
role :app, "184.154.158.74"
role :db,  "184.154.158.74", primary: true # This is where Rails migrations will run
