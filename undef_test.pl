#!/usr/bin/perl

$variable = 5;

undef $variable;

if(defined $variable){
	print "\$variable is defined.\n";
} else {
	print "\$variable is not defined.\n";
}

*MAXFILES = \100;

print "$MAXFILES\n";

#$MAXFILES = 101;
#

#while(<>){
#	print;
#}

if($bottom){
	$result = $top/$bottom;
} else {
	$result = 0;
}

print "$result \n";

#print returnvalue($result);
