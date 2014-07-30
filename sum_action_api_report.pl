#!/usr/bin/perl
use 5.010;
use Encode;
use Benchmark;
use DateTime;

if(@ARGV !=2){
	print "Usage: sum_action_api_report.pl  infile_name out_filename\n";
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

my $dt = DateTime->now; 
my $hms_str = $dt->hms;
$hms_str =~ s/://g;
print "$hms_str\n";

# print array item 
sub print_arr{
	foreach my $item (@_)
	{
		#$item = Encode::encode("utf-8",Encode::decode("utf-8", $item));
		#print decode('utf-8',encode("utf-8",$item))."\n";
		#$str = Encode::encode("utf8",Encode::decode("utf8", $item));		
		print encode('utf-8',$item)."\n";
		#print "$item\n";
		#print "$item\n";
	}
}

#my $regex_api = 'c\.[\w|\.]*\s+-';
#my $regex_api = '(api=\w*[\w|\.]*)|(action:\s+[\w|\.]*)';
my $regex_api = 'action:\s+[\w|\.]*\s+methodName=\w*';
my $result = 0;

my %api_count_hash = ();
my $cour_flag = 1;
my $api_count_num = 0;

while (<LOG_FILE>) {
	 if($_ =~ /$regex_api/){
		#print "$&\n";		
		my @items = split(/\s+/,$&);
		my @line_splite_arr = split(/\s+/,$_);
		if($_ =~/ERROR/){
			next;
		}
		#&print_arr(@items);
		my $api_name = $items[1];
		my $api_method_name = $items[2];
		
		my @mythoed_arr = split(/=/,$api_method_name);
		#&print_arr(@mythoed_arr);
		$api_name = $api_name.".".$mythoed_arr[1];	
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
		
		if($cour_flag==1){
			print "|\b";
			$cour_flag =2;
		}else {
			print "-\b";
			$cour_flag =1;
		}
		$result++;
	 }
	 # if($result eq 20){
		 # last;
	 # }
}
print "count result: $result \n";
close LOG_FILE;
print "end read file.\n";
	
print $API_REPORT_FILE "API_NAME, SUM, mini_time, max_time \n";
while ( ($key, $value) = each(%api_count_hash)){
	print $API_REPORT_FILE "$value \n";
}

close $API_REPORT_FILE;
print "end write report!\n";

