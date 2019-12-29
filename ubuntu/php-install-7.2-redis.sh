#!/bin/bash
before() {
  extension_dir=`php7.2 -r "echo ini_get('extension_dir');"`
  if [[ -z $extension_dir ]]; then
    echo -e "\033[31m No extension directory configuration found, please check if php7.2 is installed \033[0m"
    return 0;
  fi
  if [[ -d $extension_dir/redis ]]; then return 0;
  else return 1; fi
}

setup() {
  extension_dir=`php7.2 -r "echo ini_get('extension_dir');"`
  wget http://pecl.php.net/get/redis-5.1.0.tgz -O redis.tgz
  tar -xvf redis.tgz
  cd `find . -name redis-*`

  phpize && \
  ./configure --with-php-config=php-config && \
  make && make install && \
  mkdir $extension_dir/redis && \
  mv modules/redis.so $extension_dir/redis/redis.so && \
  echo '' >> /etc/php/7.2/fpm/php.ini && \
  echo 'extension=redis/redis' >> /etc/php/7.2/fpm/php.ini && \
  echo '' >> /etc/php/7.2/cli/php.ini && \
  echo 'extension=redis/redis' >> /etc/php/7.2/cli/php.ini

  cd ..
  rm -rf redis.tgz redis-* package.xml
}

# 安装php7.2的redis模块