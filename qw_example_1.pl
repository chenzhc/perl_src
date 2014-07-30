#!/usr/bin/perl

($fred,$barney) = qw< filnstone rubble slate granite >;
($wilma, $dina) = qw[filnstone];

print "$fred, $barney \n";
print "$wilma, $dina \n";

@array = qw(pebbles dino fred barney betty);
#@removed = splice(@array,2);
#@removed = splice(@array,1,2);
@removed = splice(@array,1,2,qw(wilma));
print "@array\n";
print "@removed\n";