# == Defined type: mackerel_agent::mkr_plugin
#
define mackerel_agent::mkr_plugin {

  include ::mackerel_agent

  if !defined(Package['mkr']) {
    fail('Please install mkr')
  }

  exec { "mkr plugin install ${name}":
    command => "mkr plugin install ${name}",
    user    => 'root',
    path    => ['/usr/bin'],
    creates => "/opt/mackerel-agent/plugins/bin/${name}",
    require => Package['mkr']
  }

}
