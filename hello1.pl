#!/usr/bin/perl
# hello1.pl
use warnings;

$n = 1;
{
	print "Hello $n \n";
	last if (++$n > 3); redo;
}
