# 
# Cookbook Name:: xdebug
# Attributes:: default
#
# Author:: David King, xforty technologies <dking@xforty.com>
# Contributor:: Patrick Connolly <patrick@myplanetdigital.com>
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

# Pear search does not currently work with the preferred state. So we have to
# specify a default version for now.  https://pear.php.net/bugs/bug.php?id=19138
# TODO: implement preferred_state attribute and logic once pear bug is fixed

default[:xdebug][:version] = nil

# XDEBUG.INI OPTIONS
default[:xdebug][:directives][:auto_trace]                = 0
default[:xdebug][:directives][:cli_color]                 = 0
default[:xdebug][:directives][:collect_assignments]       = 0
default[:xdebug][:directives][:collect_includes]          = 1
default[:xdebug][:directives][:collect_params]            = 0
default[:xdebug][:directives][:collect_return]            = 0
default[:xdebug][:directives][:collect_vars]              = 0
default[:xdebug][:directives][:coverage_enable]           = 1
default[:xdebug][:directives][:default_enable]            = 1
#default['xdebug'][:directives]['dump.*']                 = Empty
default[:xdebug][:directives][:dump_globals]              = 1
default[:xdebug][:directives][:dump_undefined]            = 0
default[:xdebug][:directives][:extended_info]             = 1
default[:xdebug][:directives][:file_link_format]          = ''
#default[:xdebug][:directives][:idekey]                   = *complex*
default[:xdebug][:directives][:manual_url]                = 'http://www.php.net'
default[:xdebug][:directives][:max_nesting_level]         = 100
default[:xdebug][:directives][:overload_var_dump]         = 1
default[:xdebug][:directives][:profiler_append]           = 0
default[:xdebug][:directives][:profiler_enable]           = 0
default[:xdebug][:directives][:profiler_enable_trigger]   = 0
default[:xdebug][:directives][:profiler_output_dir]       = '/tmp'
default[:xdebug][:directives][:profiler_output_name]      = 'cachegrind.out.%p'
default[:xdebug][:directives][:remote_autostart]          = 0
default[:xdebug][:directives][:remote_connect_back]       = 0
default[:xdebug][:directives][:remote_cookie_expire_time] = 3600
default[:xdebug][:directives][:remote_enable]             = 0
default[:xdebug][:directives][:remote_handler]            = 'dbgp'
default[:xdebug][:directives][:remote_host]               = 'localhost'
default[:xdebug][:directives][:remote_log]                = ''
default[:xdebug][:directives][:remote_mode]               = 'req'
default[:xdebug][:directives][:remote_port]               = 9000
default[:xdebug][:directives][:scream]                    = 0
default[:xdebug][:directives][:show_exception_trace]      = 0
default[:xdebug][:directives][:show_local_vars]           = 0
default[:xdebug][:directives][:show_mem_delta]            = 0
default[:xdebug][:directives][:trace_enable_trigger]      = 0
default[:xdebug][:directives][:trace_format]              = 0
default[:xdebug][:directives][:trace_options]             = 0
default[:xdebug][:directives][:trace_output_dir]          = '/tmp'
default[:xdebug][:directives][:trace_output_name]         = 'trace.%c'
default[:xdebug][:directives][:var_display_max_children]  = 128
default[:xdebug][:directives][:var_display_max_data]      = 512
default[:xdebug][:directives][:var_display_max_depth]     = 3
