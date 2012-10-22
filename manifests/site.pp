Exec {
path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
}

include apache2
include tika
include mysql
include passenger

