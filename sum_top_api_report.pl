#!/usr/bin/perl
use 5.010;
use Encode;
use Benchmark;
use DateTime;

if(@ARGV !=2){
	print "Usage: sum_top_api_report.pl  infile_name out_filename\n";
	exit ;
}

my $dt = DateTime->now; 
my $hour   = $dt->hour;
my $minute = $dt->minute;
my $second = $dt->second; 
my $hms_str = $dt->hms;
$hms_str =~ s/://g;
print "$hms_str\n";

my $LOG_FILE = $ARGV[0];
my $OUT_CSV_FILE_NAME = $ARGV[1]."_".$hms_str.".csv";
my $API_REPORT_FILE;
open LOG_FILE,'<:encoding(utf-8)', $LOG_FILE
	or die "can't open file: $!";

open $API_REPORT_FILE,'>:encoding(utf-8)',$OUT_CSV_FILE_NAME 
	or die "can't write file: $!";
	
my $exit_flag = 0;

my  @list = Encode->encodings();
#print "@list\n";



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

my $cursor_flag = 1;
my $api_count_num = 0;

while (<LOG_FILE>) {
	 if($_ =~ /$regex_api/){		
		#print "$&\n";
		my @line_splite_arr = split(/\s+/,$_);
		my @items = split(/=/,$&);
		if($_ =~/ERROR/){
			next;
		}
		#&print_arr(@line_splite_arr);
		my $api_name = $items[1];		
		my $report_str = $api_count_hash{$api_name};	
		my $consume = $line_splite_arr[-2];
		if(!defined($consume)){
			$consume = 0;
		} elsif($consume>10000 or $consume<0){
			next;
		}
		
		my $mini_time = $consume;
		my $max_time = $consume;
		if(!defined($report_str)){
			$api_count_num = 0;
		}else {
			@report_line_arr = split(",",$report_str);
			$api_name = $report_line_arr[0];
			$api_count_num = $report_line_arr[1];
			$mini_time = $report_line_arr[2];
			$max_time = $report_line_arr[3];
			
			if($mini_time>$consume){
				$mini_time = $consume;
			}
			if($consume>$max_time){
				$max_time = $consume;
			}
		}	
		$api_count_num++;
		
		$report_str = join(",",$api_name,$api_count_num,$mini_time,$max_time);
		#print "$report_str\n";
		
		$api_count_hash{$api_name}= $report_str;
		
		if($cursor_flag==1){
			print "|\b";
			$cursor_flag =2;
		}else {
			print "-\b";
			$cursor_flag =1;
		}
		$result++;
	 }
	 if($result eq 20){
		last;
	 }
}
print "count result: $result \n";
close LOG_FILE;
	
print $API_REPORT_FILE "API_NAME, SUM, mini_time, max_time \n";
while ( ($key, $value) = each(%api_count_hash)){
	print $API_REPORT_FILE "$value \n";
}

close $API_REPORT_FILE;

print "end read file.\n";
