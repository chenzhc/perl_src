#!/usr/bin/perl
# block.pl
use warnings;

{
	print "This is a first level block. \n";
	{
		print "		This is a second level block. \n";
	}
}
