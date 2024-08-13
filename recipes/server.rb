#
# Cookbook:: apache
# Recipe:: server
#
# Copyright:: 2019, The Authors, All Rights Reserved.
#package 'httpd'

package 'Install Apache' do
  case node[:platform]
  when 'redhat', 'centos'
    package_name 'httpd'
  when 'ubuntu', 'debian'
    package_name 'apache2'
  end
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
end

service 'httpd' do
  case node[:platform]
  when 'redhat', 'centos'
    service_name 'httpd'
  when 'ubuntu', 'debian'
    service_name 'apache2'
  end
  
  action [:enable, :start]
end