name             "locales"
maintainer       "Vitaly Shishlyannikov"
maintainer_email "vitaly@dragolabs.org"
license          "Apache 2.0"
description      "Installs/Configures locales on deb systems"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.2"

%w{ ubuntu debian }.each do |os|
  supports os
end
