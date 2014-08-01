#!/usr/bin/perl

($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) =  localtime(time);
$hms_str = "$hour$min$sec";
print "$hms_str\n";