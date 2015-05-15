#!/usr/bin/perl

our $PROGRAM_NAME = "waiter";
print "$PROGRAM_NAME\n";
{
	our $PROGRAM_NAME = "server";
	print "$PROGRAM_NAME\n";
}

print "$PROGRAM_NAME\n";

sub print_label()
{
	print "="x20;
	print "\n";
}
&print_label();

local $PROGRAM_NAME = "waiter";
{
	local $PROGRAM_NAME = "server";
	print "$PROGRAM_NAME\n";
	local $test = "test";
}
print "$PROGRAM_NAME\n";
print "$test\n";

&print_label();
$_ = "Bilbo Baggins's birthday is September 22";
/(.*)'s birthday is (.*)/;
print "Person: $1\n";
print "Date: $2\n";


&print_label();
$str = "passwd=xyzzy verbose=9 score=0";
%test_hash = $str=~ /(\w+)=(\w+)/g;

print "$str\n";
print $test_hash{"passwd"};

foreach $key (keys(%test_hash)){
	print "$key => $test_hash{$key}\n";
}

&print_label();
@oldhues = ('bluebird','bluegrass','bluefish','the blues');
for(@newhues = @oldhues) {
	s/blue/red/;
}
print "@newhues\n";