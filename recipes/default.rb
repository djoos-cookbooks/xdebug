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

include_recipe "php"
include_recipe "build-essential"

# install xdebug apache module
php_pear "xdebug" do
  if node['xdebug']['version']
    version node['xdebug']['version']
  end
  zend_extensions ['xdebug.so']
  directives(node['xdebug']['directives'])
  action :install
end

file node['xdebug']['directives']['remote_log'] do
  owner "root"
  group "root"
  mode "0777"
  action :create_if_missing
  not_if { node['xdebug']['directives']['remote_log'].empty? }
end
