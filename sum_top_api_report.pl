#!/usr/bin/perl
use 5.010;
use Encode;
use Benchmark;
use DateTime;

my $LOG_FILE = 'e:/wwplugin_resin_log.2014_07_21';

open LOG_FILE,'<:encoding(utf-8)', $LOG_FILE
	or die "can't open file: $!";
	
my $exit_flag = 0;

my  @list = Encode->encodings();
#print "@list\n";

my $dt = DateTime->now; 
my $hour   = $dt->hour;
my $minute = $dt->minute;
my $second = $dt->second; 
my $hms_str = $dt->hms;
$hms_str =~ s/://g;
print "$hms_str\n";

# print array item 
sub print_arr{
	foreach my $item (@_)
	{	
		print encode('utf-8',$item)."\n";
	}
}

#my $regex_api = 'c\.[\w|\.]*\s+-';
#my $regex_api = '(api=\w*[\w|\.]*)|(action:\s+[\w|\.]*)';
#my $regex_api = 'action:\s+[\w|\.]*\s+methodName=\w*';
my $regex_api = 'api=\w*[\w|\.]*';
my $result = 0;


my %api_count_hash = ();

my $cour_flag = 1;

while (<LOG_FILE>) {
	 if($_ =~ /$regex_api/){
		#print "$&\n";
		my @items = split(/=/,$&);
		#&print_arr(@items);
		my $api_name = $items[1];
		my $api_count_num = $api_count_hash{$api_name};
		$api_count_num ++;
		$api_count_hash{$api_name}=$api_count_num;
		
		if($cour_flag==1){
			print "|\b";
			$cour_flag =2;
		}else {
			print "-\b";
			$cour_flag =1;
		}
		$result++;
	 }
	 # if($result eq 2){
		# last;
	 # }
}
print "count result: $result \n";
close LOG_FILE;

my $API_REPORT_FILE;
open $API_REPORT_FILE,'>:encoding(utf-8)',"../wwplugin_top_api_report_".$hms_str.".csv"
	or die "can't write file: $!";
	
print $API_REPORT_FILE "API_NAME, SUM \n";
while ( ($key, $value) = each(%api_count_hash)){
	print $API_REPORT_FILE "$key, $value\n";
}

close $API_REPORT_FILE;

print "end read file.\n";
