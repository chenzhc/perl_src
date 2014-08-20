#!/usr/bin/perl
# foreach2.pl
use	warnings;

@array = ("One", "two", "three", "four");
foreach (@array){
	print "the value of the iterator is now $_ \n";
}
