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
  not_if  "grep -q Finishing /root/.cpanm/latest-build/build.log"
end

execute "setup mogilefs" do
  command %W(
    ./env mogdbsetup
    --dbrootuser=#{node[:mariadb][:root]}
    --dbrootpass=#{node[:mariadb][:pass]}
    --dbuser=#{node[:mogilefsd][:db_user]}
    --dbpass=#{node[:mogilefsd][:db_pass]}
    --yes
  ).shelljoin
  cwd     "/usr/local/mogilefs"
  not_if  "mysql -u#{node[:mogilefsd][:db_user]} -p#{node[:mogilefsd][:db_pass]} -e 'SHOW CREATE DATABASE mogilefs'"
end
