#!/usr/bin/perl
# eval_test.pl

eval "print \"Hello\n\"";

eval { print "Hello ";
	print "there\n" };


$x = 1;
$y = 0;
eval { $result = $x/$y};
print "eval says: $@" if $@;

