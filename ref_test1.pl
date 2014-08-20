#!/usr/bin/perl

my @array1 = (1,2,3);
my @array2 = (4,5,6,7);

sub Addarrays
{
	my ($array1, $array2) = @_;
	$len2 = @array2;
	for($i=0; $i<$len2; $i++){
		$array1->[$i] += $array2->[$i];
	}
}

&Addarrays(\@array1, \@array2);
print "@array1 \n";