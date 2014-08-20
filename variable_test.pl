#!/usr/bin/perl
# variable_test.pl

$x = 10;
first();

sub first 
{
	local ($x) = "zen";
	second();
}

sub second()
{
	print "$x\n";
}
