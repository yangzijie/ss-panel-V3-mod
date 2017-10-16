git clone https://github.com/max2max/ss-panel-v3-mod.git tmp<br />
mv tmp/.* ./<br />
mv tmp/* ./<br />
rm -rf tmp && git reset --hard<br />

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
php xcat setTelegram<br />
php xcat initQQWry<br />
php xcat initdownload<br />

香港 1 - Shadowsocks<br />
<br />
git checkout spay<br />
source spay.sql<br />

crontab -e<br />

30 22 * * * /opt/php-7.1.7/bin/php /home/www/test.org/xcat sendDiaryMail<br />
0 0 * * * /opt/php-7.1.7/bin/php /home/www/test.org/xcat dailyjob<br />
*/1 * * * * /opt/php-7.1.7/bin/php /home/www/test.org/xcat checkjob<br />

##开了vpn的加这个<br />
*/1 * * * * /opt/php-7.1.7/bin/php /home/www/test.org/xcat synclogin<br />
*/1 * * * * /opt/php-7.1.7/bin/php /home/www/test.org/xcat syncnas<br />

git pull origin<br />
git reset --hard origin/new_master

models创建函数（建模）<br />
controller将其加工分析后，传递给web页面<br />
截至当前：<br />
u 上传；d 下载<br />
截至昨天dailyjob的重置的时间<br />
last_day_t 当时的总流量（上传加下载）<br />
user表u、d，node表bandwidth都是由后端ssr实时更新
