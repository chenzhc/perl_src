#!/usr/bin/perl

print sprintf "%lx",16;

print "\n";

print hex 0x1AB;
print "\n";

print sprintf "%.3f", 3.1415926;
print "\n";

$variable1 = "hello ";
$variable2 = "there\n";

#print $variable1 + $variable2;

print $variable1 . $variable2;

print "\N{WHITE SMILING FACE} \n";

$x = 100;
print $x;
print "\n";

$number = 0 + "100";
print $number;
print "\n";

$!=1;
print "$!\n";
print "Error number " , 0 + $!, " occurred.\n";
