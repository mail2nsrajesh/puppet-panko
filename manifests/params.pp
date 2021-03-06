# Parameters for puppet-panko
#
class panko::params {
  include ::openstacklib::defaults

  case $::osfamily {
    'RedHat': {
      $common_package_name      = 'openstack-panko-common'
      $api_package_name         = 'openstack-panko-api'
      $api_service_name         = 'openstack-panko-api'
      $panko_wsgi_script_path   = '/var/www/cgi-bin/panko'
      $panko_wsgi_script_source = '/usr/lib/python2.7/site-packages/panko/api/app.wsgi'
    }
    'Debian': {
      $common_package_name      = 'panko-common'
      $api_package_name         = 'panko-api'
      $api_service_name         = 'panko-api'
      $panko_wsgi_script_path   = '/usr/lib/cgi-bin/panko'
      $panko_wsgi_script_source = '/usr/share/panko-common/app.wsgi'
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily} operatingsystem")
    }

  } # Case $::osfamily
}
