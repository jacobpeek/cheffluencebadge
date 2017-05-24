package 'apache' do
  package_name 'httpd'
end

service 'httpd' do
  action [:enable, :start]
end

file '/var/www/html/index.html' do
  content 'I am here world, Jacob!'
  mode '0755'
  owner 'root'
  group 'apache'
end

file '/etc/motd' do
  content 'Welcome ALL'
end

execute 'command-test' do
  command 'echo   $(date) >> /etc/motd'
  only_if { ::File.exists?('/etc/motd') } # Ruby Code
  # not_if 'test -r /etc/motd'
end
