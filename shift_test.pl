#!/usr/bin/perl

@array = ("one", "two","three");
$variable = shift(@array);

print "$variable\n";

use integer;

$value = 257;

while($value){
	unshift @digits, (0 .. 9, a .. f)[$value & 15];
	$value /= 16;
}

print @digits;
print "\n";

@array = (1,2,3);
print "\@array has " . ($#array +1) ." elements.\n";

$variable = @array;

print "\@array has $variable elements.\n";

use integer;
$value = 257;

@a1 = (1,2,3);
@a2 = (4,5,6);
@a3 = (@a1, @a2);
print "$a3[5]\n";
print join (", ", @a3)."\n";

push (@a1, @a2);
print join (", ", @a1)."\n";

@a1 = (1 .. 6);
@a2 = @a1[0 .. 3];
print join (", ", @a2)."\n";

@a2 = @a1[1,3];
print join (", ", @a2)."\n";

@array = (1 .. 6);
@array[2 .. 4] = reverse @array[2 .. 4];
print join (", ", @array)."\n";


