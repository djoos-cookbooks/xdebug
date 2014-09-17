require 'spec_helper'

describe 'xdebug::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }
end
