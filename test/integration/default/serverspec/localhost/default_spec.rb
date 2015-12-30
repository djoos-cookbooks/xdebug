require 'spec_helper'

describe 'xdebug::default' do

  describe command('pecl list') do
    its(:stdout) { should match /xdebug/ }
  end

  describe command('php -i') do
    its(:stdout) { should match /xdebug support => enabled/ }
    its(:stdout) { should match /xdebug.max_nesting_level => 256/ }
    its(:stdout) { should match /xdebug.remote_cookie_expire_time => 3600/ }
    its(:stdout) { should match /xdebug.remote_port => 9000/ }
    its(:stdout) { should match /xdebug.var_display_max_children => 128/ }
    its(:stdout) { should match /xdebug.var_display_max_data => 512/ }
  end

  describe file('/etc/php5/mods-available/xdebug.ini') do
    it { should exist }
    it { should be_file }
  end
end
