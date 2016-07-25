#
# Cookbook Name:: rails_book_cookbook
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%W{ vim zip unzip telnet wget curl sqlite-devel libcurl-devel tcpdump nodejs}.each do |pkg|
  package "#{pkg}" do
    action [ :install, :upgrade ]
  end
end

# execute "create-database-user" do
#   code = <<-EOH
#   psql -U postgres -c "select * from pg_user where usename='#{node[:dbuser]}'" | grep -c #{node[:dbuser]}
#   EOH
#   command "createuser -U postgres -sw #{node[:dbuser]}"
#   not_if code
# end

execute "echo \"D /var/run/mongodb 0755 mongod mongod -\" > /etc/tmpfiles.d/mongod.conf" do
  not_if { File.exists?("/etc/tmpfiles.d/mongod.conf") }
end

execute "timedatectl set-timezone Asia/Tokyo" do
  not_if "timedatectl status |grep JST"
end
