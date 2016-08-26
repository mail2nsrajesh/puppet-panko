# == Class: panko::keystone::auth
#
# Configures panko user, service and endpoint in Keystone.
#
# === Parameters
#
# [*password*]
#   (required) Password for panko user.
#
# [*auth_name*]
#   Username for panko service. Defaults to 'panko'.
#
# [*email*]
#   Email for panko user. Defaults to 'panko@localhost'.
#
# [*tenant*]
#   Tenant for panko user. Defaults to 'services'.
#
# [*configure_endpoint*]
#   Should panko endpoint be configured? Defaults to 'true'.
#
# [*configure_user*]
#   (Optional) Should the service user be configured?
#   Defaults to 'true'.
#
# [*configure_user_role*]
#   (Optional) Should the admin role be configured for the service user?
#   Defaults to 'true'.
#
# [*service_type*]
#   Type of service. Defaults to 'key-manager'.
#
# [*region*]
#   Region for endpoint. Defaults to 'RegionOne'.
#
# [*service_name*]
#   (optional) Name of the service.
#   Defaults to the value of 'panko'.
#
# [*service_description*]
#   (optional) Description of the service.
#   Default to 'OpenStack Event Service'
#
# [*public_url*]
#   (optional) The endpoint's public url. (Defaults to 'http://127.0.0.1:8779')
#   This url should *not* contain any trailing '/'.
#
# [*admin_url*]
#   (optional) The endpoint's admin url. (Defaults to 'http://127.0.0.1:8779')
#   This url should *not* contain any trailing '/'.
#
# [*internal_url*]
#   (optional) The endpoint's internal url. (Defaults to 'http://127.0.0.1:8779')
#
# === Examples:
#
#  class { 'panko::keystone::auth':
#    public_url   => 'https://10.0.0.10:8779',
#    internal_url => 'https://10.0.0.11:8779',
#    admin_url    => 'https://10.0.0.11:8779',
#  }
#

class panko::keystone::auth (
  $password,
  $auth_name           = 'panko',
  $email               = 'panko@localhost',
  $tenant              = 'services',
  $configure_endpoint  = true,
  $configure_user      = true,
  $configure_user_role = true,
  $service_name        = 'panko',
  $service_description = 'OpenStack Event Service',
  $service_type        = 'event',
  $region              = 'RegionOne',
  $public_url          = 'http://127.0.0.1:8779',
  $admin_url           = 'http://127.0.0.1:8779',
  $internal_url        = 'http://127.0.0.1:8779',
) {


  keystone::resource::service_identity { 'panko':
    configure_user      => $configure_user,
    configure_user_role => $configure_user_role,
    configure_endpoint  => $configure_endpoint,
    service_name        => $service_name,
    service_type        => $service_type,
    service_description => $service_description,
    region              => $region,
    auth_name           => $auth_name,
    password            => $password,
    email               => $email,
    tenant              => $tenant,
    public_url          => $public_url,
    internal_url        => $internal_url,
    admin_url           => $admin_url,
  }

}
