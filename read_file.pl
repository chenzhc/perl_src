#!/usr/bin/perl
use Benchmark;

<<<<<<< HEAD
my $LOG_FILE = 'E:/wwplugin_resin_log.2014_07_21';
=======
my $LOG_FILE = '/home/user/wwplugin_resin_log.2014_07_21';
>>>>>>> c60bfda87aa63e83ced56c1df1d95c1c4f06a83f

my @EXT_LIST = map {qr/$_/} qw {
	c.y.p.g.rds.service.RdsService
};

my $result = 0;
my $startime = new Benchmark;

open LOG_FILE, $LOG_FILE;
my $exit_flag = 0;

while (<LOG_FILE>) {
	# if($exit_flag){
		# last;
	# }
	
	foreach my $ext (@EXT_LIST) 
	{
		#$result++ if $_ =~ /$ext/;
		if($_ =~ /$ext/){
			#print $_."\n";
			$result++;
			#$exit_flag=1;
		}
	}
}

close LOG_FILE;
print "count result: $result \n";

my $sum_count = $result * 4;
print "sum count: $sum_count \n";

printf "** %s\n\n", timestr(timediff(new Benchmark, $startime));
print "end read file.\n";
