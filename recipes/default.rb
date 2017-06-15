
include_recipe "keboola-common"
include_recipe "keboola-php56"
include_recipe "keboola-apache2"

htpasswd "/etc/httpd/.htpasswd" do
  user "keboola"
  password "#{node['keboola-connection-es-proxy']['password']}"
  type "sha1"
end

web_app "#{node['fqdn']}" do
  template "proxy.conf.erb"
  server_name node['fqdn']
  server_aliases [node['hostname'], 'connection-es-proxy.keboola.com']
  enable true
end

web_app "#{node['fqdn']}" do
  template "aws-es-proxy.conf.erb"
  server_name 'connection-aws-es-proxy.keboola.com'
  server_aliases ['connection-aws-es-proxy.keboola.com']
  enable true
end
