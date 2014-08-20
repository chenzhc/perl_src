#!/usr/bin/perl
# switch2.pl

%hash = ();
$hash{run} = "Running\n";
$hash{stop} = "Stopped\n";
$hash{connect} = "Connected\n";
$hash{find} = "Found\n";

print "Enter command: ";

while(<>){
	chomp;
	if($_ eq 'q'){
		exit;
	} elsif (exists($hash{$_})){
		print $hash{$_};
	} else {
		print "No match.\n";
	}

	print "Enter command: ";
}
