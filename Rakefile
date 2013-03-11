task :default => ["index.html"]

ssh_server = "junkfood.cs.umd.edu"
remote_root = "/fs/www/projects/PL"

desc "Create index.html"
file "index.html" do
  ruby "generate_index.rb"
end

desc "Install index.html in parent directory"
task :install => "index.html" do
  mv 'index.html', '..', verbose: true
end

desc "Remove generated files"
task :clean do
  rm 'index.html', force: true, verbose: true
end

desc "Deploy on junkfood as username"
task :deploy, [:username] => "index.html" do |t,args|
  user = args[:username]
  remote = "#{ssh_server}:#{remote_root}"
  puts "*** Deploying the site to #{remote} as #{user}***"
    sh %Q{rsync -avz index.html "#{user}@#{remote}/index.html"} do |ok, res|
    puts "Deployment failed (status = #{res.exitstatus})" if !ok
  end
end
