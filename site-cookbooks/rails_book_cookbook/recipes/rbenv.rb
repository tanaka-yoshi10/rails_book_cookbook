rbenv_ruby "2.2.4" do
  global true
end

rbenv_gem "bundler" do
  ruby_version "2.2.4"
end

execute "chown" do
  command "chown -R rbenv.rbenv /opt/rbenv"
end
