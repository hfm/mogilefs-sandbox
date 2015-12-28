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

remote_file "/etc/mogstored.conf"
