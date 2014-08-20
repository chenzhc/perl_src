#!/usr/bin/perl
# factorial.pl
use warnings;

# read the vlaue of the number $input from the standard input
$input =<>;

# call the subroutine with $input as its argument
factorial($input);

# The subroutine
sub factorial {
	$step = 1;
	$result = 1;
	while($step <= $input) {
		$result = $result * $step;
		$step ++;		# this is equivalent to '$step = $step + 1';
	}

	# if $input is zero then $result is also zero
	if($input == 0){
		$result = 0;
	}
	return $result;
}

print "The result is $result \n";
