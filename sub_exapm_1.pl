#!/usr/bin/perl

use utf8; 
use Encode 'from_to';

if(!open LOG, '>>:encoding(UTF-8)', 'test.log'){
	die "can't open file : $!";
}

sub marine{
	$n +=1;
	print LOG "Hello, sailor number $n!\n";
}

&marine;
&marine();

#print for Encode->encodings(':all');

$test = "中文";
from_to($test, 'gb2312', 'UTF-8');

#$test = encode("utf8",decode("utf8",$test));

print LOG "abc\n";
print LOG "abc\n";
print LOG encode("gb2312",decode("UTF-8",$test))."\n";

close LOG;


my $TEST_LOG_FILE;

open $TEST_LOG_FILE, '<:encoding(UTF-8)', "test.log"
	or die "can't open $TEST_LOG_FILE: $!";

while(<$TEST_LOG_FILE>){
	$_=encode("utf-8",$_);
	print substr(decode("UTF-8",$_),1);
}
	
close $TEST_LOG_FILE;
	