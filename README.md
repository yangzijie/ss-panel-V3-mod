git clone -b new_master https://github.com/max2max/ss-panel-v3-mod.git tmp && mv tmp/.git . && rm -rf tmp && git reset --hard


chown -R root:root *
chmod -R 755 *
chown -R www:www storage

php composer.phar install

cp config/.config.php.example config/.config.php

vim config/.config.php


$System_Config['db_driver'] = 'mysql';
$System_Config['db_host'] = 'localhost';
$System_Config['db_database'] = '';
$System_Config['db_username'] = '';
$System_Config['db_password'] = '';
$System_Config['db_charset'] = 'utf8';
$System_Config['db_collation'] = 'utf8_general_ci';
$System_Config['db_prefix'] = '';


source glzjin_all.sql;
flush privileges;

php xcat createAdmin
php xcat resetTraffic
php xcat sendDiaryMail

香港 1 - Shadowsocks

git checkout spay
source spay.sql

crontab -e

30 22 * * * /opt/php-7.1.7/bin/php /home/www/test.org/xcat sendDiaryMail
0 0 * * * /opt/php-7.1.7/bin/php /home/www/test.org/xcat dailyjob
*/1 * * * * /opt/php-7.1.7/bin/php /home/www/test.org/xcat checkjob

##开了vpn的加这个
*/1 * * * * /opt/php-7.1.7/bin/php /home/www/ccavs.org/xcat synclogin
*/1 * * * * /opt/php-7.1.7/bin/php /home/www/ccavs.org/xcat syncnas
