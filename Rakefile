task :default => ["index.html"]

ssh_server = "junkfood.cs.umd.edu"
remote_root = "/fs/www/projects/PL"

file "index.html" do
  ruby "generate_index.rb"
end

task :install => "index.html" do
  sh "mv index.html .."
end

task :clean do
  sh "rm index.html"
end

task :deploy, :user do |t,args|
  puts "*** Deploying the site ***"
  system "rsync -avz index.html #{args[:user]}@#{ssh_server}:#{remote_root}/index.html"
end
