#
# Cookbook Name:: xdebug
# Recipe:: default
#
# Author:: David King, xforty technologies <dking@xforty.com>
# Contributor:: Patrick Connolly, Myplanet Digital <patrick@myplanetdigital.com>
#
# Copyright 2012, xforty technologies
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "build-essential"
include_recipe "php"

# install/upgrade xdebug
package = "xdebug"

php_pear package do
    if node['xdebug']['version'] != "latest"
        version "#{node['xdebug']['version']}"
    end
    #upgrade when package is installed and latest version is required
    action ( !(`pear list | grep #{package}`.empty?) and node['xdebug']['version'] == "latest" ) ? :upgrade : :install
end

# copy over xdebug.ini to node
template "#{node['php']['ext_conf_dir']}/xdebug.ini" do
  source "xdebug.ini.erb"
  owner "root"
  group "root"
  mode 0644
  # TODO: Move logic from template to recipe later?
  # variable( :extension_dir => node['php']['php_extension_dir'] )
  notifies :restart, resources("service[apache2]"), :delayed
end

file node['xdebug']['remote_log'] do
  owner "root"
  group "root"
  mode "0777"
  action :create_if_missing
  not_if { node['xdebug']['remote_log'].empty? }
end