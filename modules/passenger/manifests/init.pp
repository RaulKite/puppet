class passenger {  

  package {
    ["apache2-prefork-dev", "libcurl4-openssl-dev", "libapr1-dev", "libaprutil1-dev"]:
    ensure => installed,
    before => Exec["/usr/local/rvm/bin/gem install passenger -v=3.0.11"]
  }



  exec {
    "/usr/local/rvm/bin/gem install passenger -v=3.0.11":
      user    =>  root,
      group   =>  root,
      alias   =>  "install_passenger",
      before  =>  Exec["passenger_apache_module"],
      unless  =>  "ls /usr/local/rvm/gems/ruby-1.9.2-p320/gems/passenger-3.0.11/"
  }

  exec {
    "/usr/local/rvm/bin/ruby /usr/local/rvm/gems/ruby-1.9.2-p320/gems/passenger-3.0.11/bin/passenger-install-apache2-module --auto":
      user    =>  root,
      group   =>  root,
      path    =>  "/bin:/usr/bin:/usr/local/apache2/bin/",
      alias   =>  "passenger_apache_module",
      unless  =>  "ls /usr/local/rvm/gems/ruby-1.9.2-p320/gems/\
                    passenger-3.0.11/ext/apache2/mod_passenger.so"
  }

  file {
    "/etc/apache2/conf.d/passenger.conf":
      mode    => 644,
      owner   => root,
      group   => root,
      alias   => "passenger_conf",
      notify => Service["apache2"],
      source => "puppet:///modules/passenger/passenger.conf"
  } 
}

