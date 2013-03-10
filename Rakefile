task :default => ["index.html"]

file "index.html" do
  ruby "generate_index.rb"
end

task :install => "index.html" do
  sh "mv index.html .."
end

task :clean do
  sh "rm index.html"
end
