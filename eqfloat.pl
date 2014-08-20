#!/usr/bin/perl
#

sub eqfloat4 
{
	return sprintf("%.4f", shift) eq sprintf("%.4f", shift);
}

if(eqfloat4 1.23455, 1.23456) {
	print "Numbers are equal to four decimal places.\n";
}

$v1 = "hi there";
$v2 = "password";
$v3 = $v1 ^ $v2;
print "Encrypted: $v3\n";

@a = (1 .. 10);

foreach (@a) { 
	$_ *= 2;
}
print join(", ", @a)."\n";

sub print_lable
{
	print "="x20;
	print "\n";
}
&print_lable();

@a = (1 .. 10);
map {$_ *= 2} (@a);
print join(", ", @a)."\n";
&print_lable();

print join(", ", (map { my $value=$_; $value *=2 } (1 .. 10)))."\n";
&print_lable();

@a = (1 .. 10);

foreach (@a) {
	if ($_ > 5) {
		push @b, $_;
	}
}
print join(", ", @b)."\n";
&print_lable();

@a = (1 .. 10);
@b = grep {$_ > 5} @a;
print join(", ", @b)."\n";
&print_lable();

print join(", ", (grep {!/^\w{4}$/} (qw(Here are some four letter words.))))."\n";
&print_lable();

print "Current number: $_.\n" foreach (1 .. 5);
&print_lable();

@a = (1 .. 10);

do {
	$v = shift @a;
	print "Current number: $v\n";
} while ($v < 5);
&print_lable();

while($loop_index <= 10) {
	print "Hello\n";
	next if $loop_index > 5;
	print "there\n";
} continue {
	$loop_index++;
}
&print_lable();

OUTER: for($outer=0; $outer<10; $outer++){
	$result = 0;
	INNER: for($inner=0; $inner<10; $inner++){
		$result += $inner * $outer;
		next OUTER if $inner == $outer;
		print "$result\n";
	}
}
&print_lable();
