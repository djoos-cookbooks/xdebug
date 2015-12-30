require 'spec_helper'

describe 'xdebug::default' do

  let(:shellout) { double('shellout') }
  let(:pecllist) { double('pecllist') }

  before do
    allow(Mixlib::ShellOut).to receive(:new).and_return(shellout)
    allow(shellout).to receive(:run_command).and_return(pecllist)
    allow(pecllist).to receive(:stdout).and_return('xdebug')
    allow(File).to receive(:exist?).and_call_original
    allow(File).to receive(:exist?).with('/usr/sbin/php5enmod').and_return(true)
  end

  context 'latest is required' do

    let(:chef_run) do
      ChefSpec::SoloRunner.new do |node|
        node.set['xdebug']['version'] = 'latest'
        node.set['xdebug']['config_file'] = '/etc/php5/mods-available/xdebug.ini'
        node.set['xdebug']['web_server']['service_name'] = ''
        node.set['xdebug']['execute_php5enmod'] = true
        node.set['xdebug']['stand_along'] = true
      end.converge(described_recipe)
    end

    %w( apt build-essential php ).each do |recipe|
      it "includes #{recipe}" do
        expect(chef_run).to include_recipe(recipe)
      end
    end

    it 'upgrade xdebug pear package to latest' do
      expect(chef_run).to upgrade_php_pear('xdebug')
    end

    it 'install latest xdebug pear package' do
      allow(pecllist).to receive(:stdout).and_return('')
      expect(chef_run).to install_php_pear('xdebug')
    end

    it 'creates config file' do
      expect(chef_run).to create_template('/etc/php5/mods-available/xdebug.ini').with(source: 'xdebug.ini.erb', owner: 'root', group: 'root', mode: 0644)
    end

    it 'execute php5enmod' do
      expect(chef_run).to run_execute('/usr/sbin/php5enmod xdebug')
    end
  end

  context 'not latest older version is required' do

    let(:chef_run) do
      ChefSpec::SoloRunner.new do |node|
        node.set['xdebug']['version'] = '2.3.3'
        node.set['xdebug']['config_file'] = '/etc/php5/mods-available/xdebug.ini'
        node.set['xdebug']['web_server']['service_name'] = ''
      end.converge(described_recipe)
    end

    it 'install xdebug pear package 2.3.3 in case xdebug was installed' do
      allow(pecllist).to receive(:stdout).and_return('xdebug')
      expect(chef_run).to install_php_pear('xdebug').with(version: '2.3.3')
    end

    it 'install xdebug pear package 2.3.3 in case xdebug was not installed' do
      allow(pecllist).to receive(:stdout).and_return('')
      expect(chef_run).to install_php_pear('xdebug').with(version: '2.3.3')
    end
  end
end
