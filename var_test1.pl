#!/usr/bin/perl

$text = "Hello";

print "Perl says: $text!\n";
print 'Perl says: $text!\n';
print "\n";

$text = "un";
print "Don't be ${text}happy.\n";

$uptime = `uptime`;
print $uptime;
print "\n";

$a = "Hello" ;
$b = "there";
$c = "$a $b\n";
print $c;
