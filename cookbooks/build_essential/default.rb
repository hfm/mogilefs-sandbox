%w(
  gcc
  git
  libxml2-devel
  openssl-devel
  expat-devel
  sqlite-devel
  patch
).each {|pkg| package pkg}
