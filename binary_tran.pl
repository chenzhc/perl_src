#!/usr/bin/perl

$decimal = 4;
$binary = unpack("B32", pack("N", $decimal));

print $binary;
print "\n";

$newDecimal =  unpack("N", pack("B32", $binary));
print $newDecimal;
print "\n";
