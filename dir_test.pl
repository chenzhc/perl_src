#!/usr/bin/perl

#dir test 

my $my_dir = "D:/DDL";

my $DIR_HANDLER;
opendir  $DIR_HANDLER, $my_dir
	or die "can't open dir :$!";

foreach $file (readdir $DIR_HANDLER){
	next if $file =~ /^\./;
	print "$file\n";
}

closedir $DIR_HANDLER;

