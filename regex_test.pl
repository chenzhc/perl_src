#!/usr/bin/perl

$_ = 'a real \\ back';
if(/\\/){
	print " OK $_";
}