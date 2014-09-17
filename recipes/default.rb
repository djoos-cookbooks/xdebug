#
# Cookbook Name:: xdebug
# Recipe:: default
#
# Copyright 2014, Escape Studios
#

include_recipe 'build-essential'

# install/upgrade xdebug
package = 'xdebug'

# upgrade when package is installed and latest version is required
if !(`pear list | grep #{package}`.empty?) && node['xdebug']['version'] == 'latest'
  action = :upgrade
else
  action = :install
end

php_pear package do
  version node['xdebug']['version'] if node['xdebug']['version'] != 'latest'
  action action
end

template node['xdebug']['config_file'] do
  source 'xdebug.ini.erb'
  owner 'root'
  group 'root'
  mode 0644
  unless node['xdebug']['web_server']['service_name'].empty?
    notifies :restart, resources("service[#{node['xdebug']['web_server']['service_name']}]"), :delayed
  end
end

directives = node['xdebug']['directives']

unless directives.nil?
  if directives.key?('remote_log')
    file directives['remote_log'] do
      owner 'root'
      group 'root'
      mode 0777
      not_if { directives['remote_log'].empty? }
    end
  end
end
