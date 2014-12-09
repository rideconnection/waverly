namespace :rvmrc do
  desc "Trust rvmrc file" 
  task :trust do
    on roles(:app) do
      releases = capture("ls #{File.join(fetch(:deploy_to), 'releases')}")
      if this_host_last_release = releases.split("\n").sort.last
        execute "~/.rvm/bin/rvm rvmrc trust #{releases_path}/#{this_host_last_release}"
      end
    end
  end
end
