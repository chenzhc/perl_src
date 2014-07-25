#!/usr/bin/perl

my @array = (1+2,3-4,5*6, 7/8);

sort @array;

foreach $item (sort @array){
	print $item ."\n";
}