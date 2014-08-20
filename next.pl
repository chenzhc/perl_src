#!/usr/bin/perl
# next.pl
use warnings;

@array = ("one", "two","three", "four");

foreach $iterator (@array) {
	if($iterator eq "three") {
		next;
	}
	print "The value of the iterator is now $iterator \n";
}
