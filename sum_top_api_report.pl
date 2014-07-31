#!/usr/bin/perl
use 5.010;
use Encode;
use Benchmark;

if(@ARGV !=2){
	print "Usage: sum_top_api_report.pl  log_dir_name  report_filename\n";
	exit ;
}

sub currentTime{
	($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) =  localtime(time);
}

&currentTime();
$hms_str = "$hour$min$sec";
print "start time: $hour:$min:$sec\n";

# print array item 
sub print_arr{
	foreach my $item (@_)
	{
		print encode('gbk',$item)."\n";
	}
}

my  @list = Encode->encodings();
#print "@list\n";
		
my $log_dir = $ARGV[0];
my $LOG_DIR_HAND ;

my $OUT_CSV_FILE_NAME = $ARGV[1]."_taobao_api_report_".$hms_str.".csv";
my $API_REPORT_FILE;
open $API_REPORT_FILE,'>:encoding(utf-8)',$OUT_CSV_FILE_NAME 
	or die "can't write file: $!";

opendir $LOG_DIR_HAND, $log_dir
	or die "can't open log dir: $!";

my %api_count_hash = ();

my $regex_api = 'api=\w*[\w|\.]*';
my $result = 0;
my %api_count_hash = ();
my $cursor_flag = 1;
my $api_count_num = 0;

foreach $log_file (readdir $LOG_DIR_HAND){
	next if $log_file =~ /^\./;
	print "process $log_file ...";
	my $log_file_path = "$log_dir/$log_file";
	my $LOG_FILE_HAND;
	
	open $LOG_FILE_HAND,'<:encoding(utf-8)', $log_file_path
		or die "can't open file: $!";		
	while (<$LOG_FILE_HAND>) {
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
		 # if($result eq 20){
			# last;
		 # }
	}
	print "\n";
	&currentTime();
	print "count result: $result , time: $hour:$min:$sec\n";
	close $LOG_FILE_HAND;	
}
	
print $API_REPORT_FILE "API_NAME, SUM, mini_time, max_time \n";
while ( ($key, $value) = each(%api_count_hash)){
	print $API_REPORT_FILE "$value \n";
}

close $API_REPORT_FILE;
print "end read file.\n";

&currentTime();
print "end time: $hour:$min:$sec\n";
