#!/usr/bin/perl

$_ = 'a real \\ back';
if(/\\/){
	print " OK $_\n";
}

$_ = "Here is the text";
@a = m/\b[^A-Z]+\b/g;
print "@a\n";

$s = "Here is the text";
