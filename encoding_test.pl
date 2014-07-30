#!/usr/bin/perl

use Encode;
#use strict;

my $str = "china----中文";

my $TEST_LOG_FILE;
open $TEST_LOG_FILE,'>>:encoding(utf-8):crlf','test.log'
	or die "can't open file: $!";
	
$str = Encode::encode("utf-8",Encode::decode("utf-8", $str));
print   $str;

print $TEST_LOG_FILE $str."\n";

close $TEST_LOG_FILE;

open $TEST_LOG_FILE,'<:encoding(utf-8)', 'test.log'
	or die "can't open file: $!";

while(<$TEST_LOG_FILE>){
	print   Encode::encode("utf-8",$_);
}

close $TEST_LOG_FILE;
