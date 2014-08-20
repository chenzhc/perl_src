#!/usr/bin/perl
# reference1.pl
#use warnings;
#use strict;

$number = 42;
$number_ref = \$number;
$$number_ref = 6;
print "$number \n";
