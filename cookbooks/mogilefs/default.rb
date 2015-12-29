git "/usr/local/mogilefs" do
  repository "https://github.com/pepabo/p5-bundle-mogilefs.git"
end

group "mogile" do
  gid 501
end

user "mogile" do
  uid         501
  gid         501
  system_user true
  create_home true
  home        "/"
  shell       "/bin/bash"
end

directory "/etc/mogilefs" do
  owner "root"
  group "root"
end

template "/etc/mogilefs/mogilefsd.conf" do
  mode  "644"
  owner "root"
  group "root"
end

package "mariadb-devel"
execute "install mogilefs" do
  command "PATH=/opt/perl-latest/bin:$PATH sh ./install.sh -n"
  cwd     "/usr/local/mogilefs"
end

