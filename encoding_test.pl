﻿#!/usr/bin/perl

use Encode;
#use strict;

my $str = "china----中文";

my $TEST_LOG_FILE;
open $TEST_LOG_FILE,'>>:encoding(utf-8)','../test.log'
	or die "can't open file: $!";
	
$str =decode("utf-8", $str);

print $TEST_LOG_FILE $str."\n";

close $TEST_LOG_FILE;

open $TEST_LOG_FILE,'<:encoding(utf-8)', '../test.log'
	or die "can't open file: $!";

while(<$TEST_LOG_FILE>){
	print  encode("gbk",$_);
}

close $TEST_LOG_FILE;
