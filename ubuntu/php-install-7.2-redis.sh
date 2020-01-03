#!/bin/bash
before() {
  if [[ ! `type php7.2` ]]; then echo 'No php7.2 installed'; return 0 fi
  if [[ `php7.2 -m | grep 'redis'` ]]; then
    return 0
  else
    `dirname $1`/eoogo.sh redis-install # 自动安装redis服务
    return 1
  fi
}

setup() {
  extension_dir=`php7.2 -r "echo ini_get('extension_dir');"`
  wget http://pecl.php.net/get/redis-5.1.0.tgz -O redis.tgz
  tar -xvf redis.tgz
  cd `find . -name redis-*`

  phpize && \
  ./configure --with-php-config=php-config && \
  make && make install && \
  echo '' >> /etc/php/7.2/fpm/php.ini && \
  echo 'extension=redis' >> /etc/php/7.2/fpm/php.ini && \
  echo '' >> /etc/php/7.2/cli/php.ini && \
  echo 'extension=redis' >> /etc/php/7.2/cli/php.ini

  cd ..
  rm -rf redis.tgz redis-* package.xml

  service php7.2 restart # 重启php服务
}

# 安装php7.2的redis模块