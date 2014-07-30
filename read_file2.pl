#!/usr/bin/perl

my $rocks_file;
open $rocks_file,'<','test.log'
	or die "can't open file:$!";

while(<$rocks_file>){
	print $_;
}

close $rocks_file;

print "PATH is $ENV{PATH}\n";

