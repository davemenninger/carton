include_recipe 'carton'

directory '/srv/www' do
  recursive true
  owner 'vagrant'
  group 'vagrant'
end

cookbook_file '/srv/www/foo.psgi' do
  source 'foo.psgi'
  owner 'vagrant'
  group 'vagrant'
  mode '0644'
end

cookbook_file '/srv/www/cpanfile' do
  source 'cpanfile'
  owner 'vagrant'
  group 'vagrant'
  mode '0644'
end

carton_app 'hello-world' do
  perlbrew '5.18.4'
  command 'starman -p 5000 foo.psgi'
  cwd '/srv/www'
  user 'vagrant'
  group 'vagrant'
end

carton_app 'hello-world' do
  action :start
end
