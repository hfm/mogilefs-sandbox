%w(7500/tcp 7501/tcp).each do |port|
  execute "firewalld for cmogstored" do
    command  "firewall-cmd --zone=public --add-port #{port} --permanent"
    not_if   "firewall-cmd --zone=public --query-port #{port} --permanent"
    notifies :run, "execute[firewall-cmd --reload]"
  end
end

execute "firewall-cmd --reload" do
  action :nothing
end
