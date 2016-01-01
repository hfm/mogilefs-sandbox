package "sysstat"

remote_file "/usr/local/bin/cmogstored" do
  source "files/cmogstored.centos7"
  mode   "0755"
  owner  "root"
  group  "root"
end

group "mogile" do
  gid 501
end

user "mogile" do
  uid 501
  gid 501
  system_user true
end

directory "/var/mogdata" do
  owner "mogile"
  group "mogile"
end

1.upto(3) do |i|
  directory "/var/mogdata/dev#{i}" do
    owner "mogile"
    group "mogile"
  end
end

directory "/etc/mogilefs/"
template "/etc/mogilefs/mogstored.conf"

directory "/usr/local/lib/systemd/system" do
  mode  "755"
  owner "root"
  group "root"
end

template "/usr/local/lib/systemd/system/cmogstored.socket" do
  mode  "644"
  owner "root"
  group "root"
end

template "/usr/local/lib/systemd/system/cmogstored@.service" do
  mode  "644"
  owner "root"
  group "root"
end

service "firewalld.service" do
  action [:disable, :stop]
end

service "cmogstored.socket" do
  action [:enable, :start]
end

service "cmogstored@1.service" do
  action [:enable, :start]
end
