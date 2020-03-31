#/bin/bash
wget https://github.com/Anankke/SSPanel-Uim/archive/2019.08.zip -O ss.zip

ssdir='SSPanel-Uim-2019.08'
unar ss.zip && rm -rf ss.zip && cd $ssdir;

composer install
./vendor/bin/upgrade-carbon
cp .config.example.php .config.php;
