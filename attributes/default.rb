

default['keboola-connection-es-proxy']['password'] = ''

default['apache']['default_modules'] = %w[
  dir env mime negotiation setenvif
  status alias auth_basic authn_core authn_file authz_core authz_groupfile
  authz_host authz_user autoindex dir env mime negotiation setenvif logio log_config unixd socache_shmcb filter
  proxy proxy_http
]
