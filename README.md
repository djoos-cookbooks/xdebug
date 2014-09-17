[![Build Status](https://travis-ci.org/escapestudios-cookbooks/xdebug.png)](https://travis-ci.org/escapestudios-cookbooks/xdebug)

Description
===========

This cookbook provides an easy way to install Xdebug.

More information?
* http://xdebug.org/

Requirements
============

## Platforms:

* Debian
* Ubuntu
* RHEL
* CentOS
* Fedora
* Scientific
* Amazon
* Windows
* SmartOS

Attributes
==========

## default.rb:

* `node['xdebug']['version']` - The Xdebug version that will be installed, defaults to 'latest'
* `node['xdebug']['config_file']` - defaults to nil
* `node['xdebug']['web_server']['service_name']` - defaults to 'apache2'
* `node['xdebug']['directives']` - hash of directives and values to append to `xdebug.ini`, defaults to {}

Usage
=====

1. include `recipe[xdebug]` in a run list
2. change the `node['xdebug']['config_file']` attribute to your xdebug.ini path (eg. '/etc/php5/conf.d/xdebug.ini'), double-check the value of `node['xdebug']['web_server']['service_name']` and set the values of the directives (eg. { "remote_autostart" => 1, "remote_connect_back" => 1, "remote_enable" => 1, "remote_log" => '/tmp/remote.log' }).
--- OR ---
override the attributes on a higher level (http://wiki.opscode.com/display/chef/Attributes#Attributes-AttributesPrecedence)

References
==========

* [Xdebug home page] (http://xdebug.org/)
* a very big thanks to David King <dking@xforty.com> for the original version of this cookbook

License and Authors
===================

Author: David Joos <david.joos@escapestudios.com>
Author: Escape Studios Development <dev@escapestudios.com>
Copyright: 2014, Escape Studios

Unless otherwise noted, all files are released under the MIT license,
possible exceptions will contain licensing information in them.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.