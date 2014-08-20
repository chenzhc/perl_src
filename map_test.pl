#!/usr/bin/perl
#

print join(", ", (map lc, A,B,C));
print "\n";

print join(", ", (map chr, 65,66,67))."\n";

print join(", ", (map {2*$_} 1, 2, 3))."\n";

print (map "The current number is: $_\n", (1,2,3));


print join(", ", (map {my $value=$_; $value+=1} 1, 2, 3))."\n";

print join(", ", (grep {$_>15} (11,12,13,14,15,16,17,18)))."\n";

print join(", ", grep(!/x/, a, b, x, d))."\n";

print join(" ", (grep {!/^\w{4}$/} (qw(Here are some four letter words.))))."\n";

@array1 = (1, 1, 1, 1);
@array2 = grep {$_ *= 2} @array1;
print @array1[1]."\n";
