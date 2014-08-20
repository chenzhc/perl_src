#!/usr/bin/perl
# loop_test.pl

@array = ("one", "two", "three");

for($loop_index=0; $loop_index<=$#array; $loop_index++)
{
	print $array[$loop_index]." ";
}

print "\n";

@array = (1,2,3,4,5);
foreach $element (@array) {
	print "$element \n";
}

print "***********\n";
@array = (1,2,3,4,5);
@array2 = (6,7,8,9,10);
foreach $element (@array, @array2)
{
	print "$element \n";
}

@array = ("one", "two", "three");
print "Here is the array: ", @array, ".\n";

@array = ("one","two","three");
print "Here is the array: @array .\n";

$, = ",";
print "Here is the array: ", @array, ".\n";

@array = (1 .. 10);
print join(", ", @array)."\n";

@array = ("one", "two", "three");
foreach $element (@array) 
{
	print "Current element = $element \n";
}

@array = ("one", "two");
splice(@array, 2, 0, "three");
print join(", ", @array)."\n";

@array = ("one","two");
@array2 = ("three","four");
splice(@array,2,0,@array2);
print join(", ",@array)."\n";

@array = ("one", "two");
@array2 = ("two","three","four");
splice(@array,2,1,@array2);
print join(", ", @array)."\n";

@a1 = (1 .. 6);
@a2 = reverse @a1;
print join(", ", @a2)."\n";

@array = (1 .. 6);
@array[2 .. 4] = reverse @array[2 .. 4];
print join(", ", @array)."\n";

@array = (6,5,4,3,2,1);
print join(", ", @array)."\n";
sub myfunction
{
	return (shift(@_) <=> shift(@_));
}
print join (", ", sort { myfunction($a, $b)} @array)."\n";

@a = (0 .. 3);
if(exists($a[4]))
{
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

$hash{fruit} = apple;
$hash{sandwich} = hamburger;
$hash{drink} = bubbly;

while(($key, $value) = each(%hash)){
	print "$key = > $value\n";
}

delete($hash{'fruit'});

if(exists($hash{"fruit"})){
	print "Key exists.\n";
} else {
	print "Key does not exist.\n";
}

print map "$_ => $hash{$_}\n", keys %hash;

print "@{[%hash]}\n";

while(($key, $value) = each %hash){
	print "$key: $value\n";
}

foreach $key (sort keys %hash) {
	print "$key = > $hash{$key}\n";
}

$hash{fruit} = apple;
$hash{sandwich} = hamburger;
$hash{drink} = bublly;

%reversed = reverse %hash;

foreach $key (sort keys %reversed) {
	print "$key => $reversed{$key}\n";
}

print "=========================\n";
foreach $key (sort keys %hash) {
	print "$key => $hash{$key}\n";
}

foreach $key (sort {myfunction($a, $b)} keys %hash) {
	print "$key => $hash{$key}\n";
}

print "="x20;
print "\n";

foreach $value (sort values %hash) {
	print "$value\n";
}

sub print_label
{
	print "="x20;
	print "\n";
}
&print_label();

$h1{fruit} = apple;
$h1{sandwich} = hamburger;
$h1{drink} = bubbly;

$h2{cake} = chocolate;
$h2{pie} = blueberry;
$h2{'ice cream'} = pecam;

%h3 = (%h1, %h2);
print "$h3{'ice cream'}\n";
&print_label();

($variable1, $variable2, @array) = (1,2,3,4,5,6,7,8);
print "$variable1\n";
print "$variable2\n";
print "@array\n";
&print_label();

keys(%employees) = 40_000;
$employees{'Fred'} = 'fired';
$employees{'Tom'} = 'promoted';

while(($name, $action) = each %employees) {
	print "Dear $name, you have been $action!\n";
}
&print_label();

$data = "Here's the data.";
@data = (1,2,3);

*alsodata = *data;

print "$alsodata\n";
print "@alsodata\n";
&print_label();

*alsodata2 = \$data;
print "$alsodata2\n";
print "@alsodata2\n";
&print_label();

$variable = 5;
print "${*variable{SCALAR}}\n";
&print_label();

$hash{fruit} = apple;
$hash{sandwich} = hamburger;
$hash{drink} = bubbly;

$hashref = \%hash;
print "$hashref->{sandwich}\n";
&print_label();

$line = ".Hello!";
if($line =~ m/^\./) {
	print "You shouldn't start a sentence with a period!\n";
}
&print_label();

use integer;

print 16 /3;
print "\n";
&print_label();

print '-' x 30;
print "\n";
&print_label();

print 2 << 10;
print "\n";
print 2048 >> 3;
print "\n";
print 24 & 15;
print "\n";
print sqrt 4;
print "\n";
&print_label();

while(<>) {
	if($_ > 100){
		print "Too big!\n";
		last;
	}
}
&print_label();

print "Please enter letters from k to m\n";
while(<>){
	chop;
	if($_ lt 'k' or $_ gt 'm') {
		print "Please enter letters from k to m\n";
	} else {
		print "Thank you - let's have another!\n";
		last;
	}
}
&print_label();
