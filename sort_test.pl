#!/usr/bin/perl
# sort_test.pl

print sort ("c", "b", "a");
print "\n";

print sort {$a cmp $b} ("c","b","a");
print "\n";

print sort {$b cmp $a} ("c","b","a");
print "\n";

print sort {$a <=> $b} (3,2,1);
print "\n";

sub myfunction 
{
	return (shift(@_) <=> shift(@_));
}
print sort {myfunction($a,$b)} (3,2,1);
print "\n";

print reverse (1,2,3);
print "\n";

print (2,4,6);
print "\n";

print scalar (2,4,6);
print "\n";
