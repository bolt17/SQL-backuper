#!/usr/bin/perl -w
use POSIX qw(strftime);

$date= strftime "%w", localtime(time);

$back_dir="/var/backups";

@db=`/usr/bin/mysql -u root --password="erjnvkbs337" -N -e "show databases"`;
foreach $db (@db) {
    chomp $db;
    system("/usr/bin/mysqldump --add-drop-table -u root --password=ROOT-PASSWORD $db > $back_dir/$db.$date.sql");
    system("/bin/tar czf $back_dir/$db.$date.sql.tar.gz $back_dir/$db.$date.sql");
    system("/bin/rm $back_dir/$db.$date.sql");
}
