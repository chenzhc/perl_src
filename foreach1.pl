#!/usr/bin/perl
#  foreach1.pl
use warnings;

@array = ("one","two","three","four");
foreach $iterator (@array) {
	print "The value of the iterator is now $iterator \n";
}
