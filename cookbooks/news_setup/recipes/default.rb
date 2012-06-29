require_recipe "apt"
require_recipe "git"
require_recipe "php::default"
require_recipe "php::module_sqlite3"
require_recipe "nginx::default"

service "php5-fpm" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

template "#{node[:nginx][:dir]}/sites-available/app-server.conf" do
  source "app-server.conf.erb"
  owner "root"
  group "root"
  mode "0644"
  notifies :restart, resources("service[nginx]"), :delayed
  notifies :restart, resources("service[php5-fpm]"), :delayed
end

template "#{node[:nginx][:dir]}/fastcgi_params" do
  source "fastcgi_params.erb"
  owner "root"
  group "root"
  mode "0644"
  notifies :restart, resources("service[nginx]"), :delayed
  notifies :restart, resources("service[php5-fpm]"), :delayed
end

execute "enable symfony site" do
  command "sudo ln -s #{node[:nginx][:dir]}/sites-available/app-server.conf #{node[:nginx][:dir]}/sites-enabled/app-server"
  not_if do
    File.symlink?("#{node[:nginx][:dir]}/sites-enabled/app-server")
  end
  notifies :restart, resources("service[nginx]"), :delayed
end

execute "disable default site" do
  command "sudo rm #{node[:nginx][:dir]}/sites-enabled/default"
  only_if do
    File.symlink?("#{node[:nginx][:dir]}/sites-enabled/default")
  end
  notifies :restart, resources("service[nginx]"), :delayed
end

execute "Download Composer" do
  cwd "/vagrant"
  user "vagrant"
  command "wget http://getcomposer.org/composer.phar"
  not_if do
    File.exists?("/vagrant/composer.phar")
  end
end

execute "Install Vendors" do
  cwd "/vagrant"
  user "vagrant"
  command "php composer.phar install"
end
