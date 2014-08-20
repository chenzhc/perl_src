#!/usr/bin/perl
# last.pl
use warnings;

@array = ("one","two","three","four");
foreach $iterator (@array){	
	if($iterator eq "three"){
		last;
	}
	print "The value of the iterator is now $iterator \n";
}
