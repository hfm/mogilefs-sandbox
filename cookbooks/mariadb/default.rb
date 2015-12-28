package "mariadb-server"
service "mariadb" do
  action [:enable, :start]
end
