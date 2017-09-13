git clone -b new_master https://github.com/max2max/ss-panel-v3-mod.git tmp && mv tmp/.git . && rm -rf tmp && git reset --hard

chown -R root:root *<br />
chmod -R 755 *<br />
chown -R www:www storage<br />

php composer.phar install<br />

cp config/.config.php.example config/.config.php<br />

vim config/.config.php<br />


$System_Config['db_driver'] = 'mysql';<br />
$System_Config['db_host'] = 'localhost';<br />
$System_Config['db_database'] = '';<br />
$System_Config['db_username'] = '';<br />
$System_Config['db_password'] = '';<br />
$System_Config['db_charset'] = 'utf8';<br />
$System_Config['db_collation'] = 'utf8_general_ci';<br />
$System_Config['db_prefix'] = '';<br />


source glzjin_all.sql;<br />
flush privileges;<br />

php xcat createAdmin<br />
php xcat resetTraffic<br />
php xcat sendDiaryMail<br />

香港 1 - Shadowsocks<br />
<br />
git checkout spay<br />
source spay.sql<br />

crontab -e<br />

30 22 * * * /opt/php-7.1.7/bin/php /home/www/test.org/xcat sendDiaryMail<br />
0 0 * * * /opt/php-7.1.7/bin/php /home/www/test.org/xcat dailyjob<br />
*/1 * * * * /opt/php-7.1.7/bin/php /home/www/test.org/xcat checkjob<br />

##开了vpn的加这个<br />
*/1 * * * * /opt/php-7.1.7/bin/php /home/www/ccavs.org/xcat synclogin<br />
*/1 * * * * /opt/php-7.1.7/bin/php /home/www/ccavs.org/xcat syncnas<br />
