#!/usr/bin/perl
use Getopt::Std;

print join(" ", @ARGV)."\n";

getopt('pMN');
print "-p switch: $opt_p, -M switch: $opt_M, -N switch: $opt_N \n";
