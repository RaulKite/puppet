class bambi_app {
  file {
    ["/home/www/", "/home/www/bambi/", "/home/www/bambi/shared/", "/home/www/bambi/shared/config/"]:
      ensure  =>  directory,
      owner   =>  vagrant,
      group   =>  vagrant,
      mode    =>  775
  }

  file {
    "/home/www/bambi/shared/config/database.yml":
      ensure  =>  present, 
      owner   =>  vagrant,
      group   =>  vagrant,
      mode    =>  600,
      source  =>  "puppet:///modules/bambi_app/database.yml"     
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
    "bambi_db":
      unless => "mysql -uroot -proot bambi_production",
      command => "mysql -uroot -proot -e 'create database bambi_production'",
      require => Exec["mysql_password"]
  }


}


