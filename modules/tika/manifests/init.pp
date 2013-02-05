class tika {
  file {
    ["/home/www/", "/home/www/tika/", "/home/www/tika/shared/", "/home/www/tika/shared/config/"]:
      ensure  =>  directory,
      owner   =>  vagrant,
      group   =>  vagrant,
      mode    =>  775
  }

  file {
    "/home/www/tika/shared/config/database.yml":
      ensure  =>  present, 
      owner   =>  vagrant,
      group   =>  vagrant,
      mode    =>  600,
      source  =>  "puppet:///modules/tika/database.yml"     
  } 
  
  package {
    "bundler":
      provider => gem
  }

  exec {
    "mysql_password":
      unless => "mysqladmin -uroot -proot status",
      command => "mysqladmin -uroot password root",
      require => Service[mysql];
    "tika_db":
      unless => "mysql -uroot -proot tika_production",
      command => "mysql -uroot -proot -e 'create database tika_production'",
      require => Exec["mysql_password"]
  }


}


