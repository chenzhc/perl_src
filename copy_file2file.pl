#!/usr/bin/perl

my $LOG_FILE;
my $log_file_name = '../../wwplugin_resin_log.2014_07_21';

my $OUT_LOG_FILE;
my $out_log_file_name = 'wwplugin_resin_log.2014_07_21';

open $LOG_FILE, '<:encoding(UTF-8)',$log_file_name
	or die "can't open $log_file_name: $!";

open $OUT_LOG_FILE,'>>:encoding(UTF-8)', $out_log_file_name
	or die "can't open $out_log_file_name: $!";

	
my $index = 0;

while(<$LOG_FILE>){
	print $OUT_LOG_FILE $_;
	$index ++;
	if($index >1000){
		last ;
	}
}
	
close $LOG_FILE;
close $OUT_LOG_FILE;