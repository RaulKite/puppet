class general {
	package {
		"vim":
		ensure => present
	}

	package {
		"curl":
		ensure => present
	}

	package { "build-essential":
               ensure => present
         }

	package { "ntp":
		ensure => "purged"
	}

	package { "tzdata":
        	ensure => installed
	}

	file { "/etc/localtime":
        	require => Package["tzdata"],
	        source => "file:///usr/share/zoneinfo/Europe/Madrid"
    	}

	package {
		"ntpdate":
		ensure => present
	}
	
	exec { "DateTime Configure":
 	   	command => "ntpdate hora.um.es",
    		path    => "/usr/sbin/"
	}
}
