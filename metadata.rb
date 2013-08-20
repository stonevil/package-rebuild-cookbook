name             'package-rebuild'
maintainer       'Myroslav Rys'
maintainer_email 'stonevil@gmail.com'
license          'All rights reserved'
description      'Template cookbook for Rebuild Debian and RedHat (in progress) packages'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.3.0'

%w{ ubuntu debian }.each do |os|
  supports os
end

depends 'build-essential'
depends 'apt'
depends 'packages-update'
