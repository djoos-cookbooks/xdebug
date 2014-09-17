name 'xdebug'
maintainer 'Escape Studios'
maintainer_email 'dev@escapestudios.com'
license 'MIT'
description 'Installs/Configures xdebug'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.0.0'

%w( debian ubuntu redhat centos fedora scientific amazon windows smartos ).each do |os|
  supports os
end

depends 'build-essential'
depends 'php'

recipe 'xdebug', 'Installs/configures xdebug.'
