#!/usr/bin/perl

use integer;

$value = 257;

while($value){
	push @digits, (0 .. 9, a .. f)[$value & 15];
	$value /= 16;
}

while(@digits){
	print pop @digits;
}

print "\n";

@array = ("one", "two");
splice(@array,2,0,"three");
print join(", ", @array)."\n";

@array = ("one","two");
@array2 = ("three","four");
splice(@array,2,0,@array2);

print join(", ", @array)."\n";

@array = ("one", "two");
@array2 = ("two","three", "four");
splice(@array,2,1, @array2);
print join(", ", @array)."\n";


@a1 = (1,2,3,4,5,6);
@a2 = reverse @a1;

print join(", ", @a2)."\n";

@array = (1 .. 6);
@array[2 .. 4] = reverse @array[2 .. 4];
print join(", ", @array)."\n";

@array = (6,5,4,3,2,1);

sub myfunction {
	return (shift(@_) <=> shift(@_));
}

print join(", ", sort {myfunction($a,$b)}  @array)."\n";

@a = (0,1,2,3);
if(exists($a[4])){
	print "Element has been initialized.\n";
} else {
	print "Element has not been initialized.\n";
}

@a = (0,1,2,3,4);
print "Deleting \$a[4].\n";
delete $a[4];

if(exists($a[4])){
	print "Element is initialized.\n";
} else {
	print "Element is not initialized.\n";
}
