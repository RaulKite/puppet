node "bambi" {
	include general
	include bambi_app
	class {'nginx': }
	nginx::resource::vhost { 'ccalculo.um.es':
		ensure   => present,
		www_root => '/home/www/bambi',
	}
	include mysql
	include sphinx
}
