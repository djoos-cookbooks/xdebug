require 'chefspec'
require 'chefspec/berkshelf'

ChefSpec::Coverage.start! do
  add_filter(%r{build-essential})
 end

RSpec.configure do |config|
  config.platform = 'ubuntu'
  config.version = '14.04'
end