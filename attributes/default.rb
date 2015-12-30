#
# Cookbook Name:: xdebug
# Attributes:: default
#
# Copyright 2014, Escape Studios
#

default['xdebug']['version'] = 'latest'
default['xdebug']['pear_options'] = ''
default['xdebug']['config_file'] = nil
default['xdebug']['execute_php5enmod'] = false
default['xdebug']['web_server']['service_name'] = 'apache2'
default['xdebug']['directives'] = {}
default['xdebug']['stand_along'] = false
