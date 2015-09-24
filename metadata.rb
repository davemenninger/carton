name 'carton'
maintainer 'Dave Menninger'
maintainer_email 'dave.menninger@gmail.com'
license 'Apache 2.0'
version '0.1.2'
description 'Installs/Configures carton and provides a LWRP'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
recipe 'carton::default', 'Installs carton LWRP dependencies'
supports 'debian'
supports 'ubuntu'
depends 'perlbrew', '>= 0.1.1'
depends 'runit', '1.6.0' # Until #142 fixed: https://github.com/hw-cookbooks/runit/issues/142
