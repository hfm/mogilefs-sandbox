package "firewalld"
service "firewalld.service" do
  action [:enable, :start]
end
