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

}


