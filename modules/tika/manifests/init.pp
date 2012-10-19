class tika {
  file {
    ["/home/www/", "/home/www/tika/", "/home/www/tika/shared/", "/home/www/tika/shared/config/"]:
      ensure => directory,
      owner => vagrant,
      group => vagrant,
      mode => 775
  }
}


