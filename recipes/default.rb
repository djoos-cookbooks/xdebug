#
# Cookbook Name:: xdebug
# Recipe:: default
#
# Copyright 2014, Escape Studios
#

include_recipe 'apt'
include_recipe 'build-essential'
include_recipe 'php' if node['xdebug']['stand_along']

# install/upgrade xdebug
package = 'xdebug'

# upgrade when package is installed and latest version is required
if Mixlib::ShellOut.new("pecl list | grep -i #{package}").run_command.stdout.downcase.include?('xdebug') && node['xdebug']['version'] == 'latest'
  action = :upgrade
else
  action = :install
end

php_pear package do
  version node['xdebug']['version'] if node['xdebug']['version'] != 'latest'
  action action
  options node['xdebug']['pear_options'] unless node['xdebug']['pear_options'].empty?
end

#service 'apache2' if defined?(ChefSpec) #declare service to prevent unit testing component

template node['xdebug']['config_file'] do
  source 'xdebug.ini.erb'
  owner 'root'
  group 'root'
  mode 0644
  unless node['xdebug']['web_server']['service_name'].empty?
    notifies :restart, resources("service[#{node['xdebug']['web_server']['service_name']}]"), :delayed
  end
end

execute '/usr/sbin/php5enmod xdebug' do
  only_if { platform?('ubuntu') && node['platform_version'].to_f >= 12.04 && ::File.exist?('/usr/sbin/php5enmod') && node['xdebug']['execute_php5enmod'] }
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
