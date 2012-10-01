#
# Cookbook Name:: drupal
# Recipe:: default
#
# Copyright 2012, Joe Balancio
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'php'

php_pear_channel 'pear.drush.org' do
  action :discover
end

pear 'drush/drush' do
  action :install
end
#execute "mysql-install-drupal-privileges" do
#  command "/sr/bin/mysql -u root p\"#{node[:mysql][:server_root_password]}\" < #{node[:mysql][:conf_dir]}/drupal-grants.sql"
#  action :nothing
#end
#
#template "#{node[:mysql][:conf_dir]}/drupal-grants.sql" do
#  source "grants.sql.erb"
#  owner "root"
#  group "root"
#  mode "0600"
#  variables(
#    :user => node[:drupal][:db][:user]
#    :password => node[:drupal][:db][:password]
#    :database => node[:drupal][:db][:database]
#  )
#  notifies :run, "execute[mysql-install-drupal-privileges]", :immediately
#end
#
#execute "create #{node[:drupal][:db][:database]} database" do
#  command "/usr/bin/mysqladmin -u root -p\"#{node[:mysql][:server_root_password]}\" create #{node[:drupal][:db][:database]}"
#  not if do
#    require 'rubygems'
#    Gem.clear_paths
#    require 'mysql'
#    m = Mysql.new("localhost", "root", node[:mysql][:server_root_password])
#    m.list_dbs.include?(node[:drupal][:db][:database])
#  end
#  notifies :create, "ruby_block[save node data]", :immediately unless Chef::Config[:solo]
#end
#
#unless Chef::Config[:solo]
#  ruby_block "save node data" do
#    block do
#      node.save
#    end
#    action :create
#  end
#end
#
#log "Navigate to 'http://#{server_fqdn}/drupal' to complete drupal installation" do
#  action :nothing
#end
#
#template "#{node[:drupal][:dir]}/settings"
#
