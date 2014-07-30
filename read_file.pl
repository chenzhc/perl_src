#!/usr/bin/perl
use Benchmark;

my $LOG_FILE = '../wwplugin_resin_log.2014_07_21';

my @EXT_LIST = map {qr/$_/} qw {
	c.y.p.g.rds.service.RdsService
	c.h.w.c.interceptor.LogInterceptor
	c.h.w.common.aspect.ConsumeAspect
	c.y.p.gateway.top.utils.TopUtils
	c.y.p.g.t.service.CrmMemberService
	c.h.w.common.aspect.ConsumeAspect
};


my $result = 0;
my $startime = new Benchmark;

open LOG_FILE, $LOG_FILE;
my $exit_flag = 0;

# print array item 
sub print_arr{
	foreach my $item (@_)
	{
		print "$item\n";
	}
}

while (<LOG_FILE>) {
	
	foreach my $ext (@EXT_LIST) 
	{
		#$result++ if $_ =~ /$ext/;
		 if($_ =~ /$ext/){
			my @items = split(/\s+/,$_);
			print "@items\n";
			&print_arr(@items);
			#print $_."\n";
			$result++;
			$exit_flag=1;
		 }
	}
	
	if($exit_flag){
		last;
	}
}

$date = localtime;
print "$date\n";

# my $dt = DateTime->from_epoch(epoch=>time);
# print "$dt\n";

close LOG_FILE;
print "count result: $result \n";

my $sum_count = $result * 4;
print "sum count: $sum_count \n";

printf "** %s\n\n", timestr(timediff(new Benchmark, $startime));
print "end read file.\n";
