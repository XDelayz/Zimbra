#!/usr/bin/perl
# Определение ID COS (класса обслуживания)
my $cosid = `su - zimbra -c 'zmprov gc Default |grep zimbraId:'`;
$cosid =~ s/zimbraId:\s*|\s*$//g;
while (<>) {
chomp;
# Изменить на реальные поля, которые вы используете в файле CSV
my ($email, $password) = split(/\:/, $_, 2);
my ($uid, $domain) = split(/@/, $email, 2);
print qq{ca $uid\@$domain $password\n};
print qq{ma $uid\@$domain zimbraCOSid "$cosid"\n};
print qq{ma $uid\@$domain cn "$uid"\n};
print qq{ma $uid\@$domain zimbraPasswordMustChange FALSE\n};
print qq{\n};
}


# создаем файл import.csv с пользователями и паролями в виде test@example.com:6_qcJA-g2s6v

# выполнить команду: perl csv2zmprov.pl < import.csv > /tmp/commands.zmp

# команда su zimbra

# последняя команда читает из файла commands.zmp пользователей и пароли: zmprov -f /tmp/commands.zmp
