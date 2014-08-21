#!/usr/bin/perl

$_ = 'a real \\ back';
if(/\\/){
	print " OK $_\n";
}

$_ = "Here is the text";
@a = m/\b[^A-Z]+\b/g;
print "@a\n";

$s = "Here is the text";

$wife{"Jacob"} = ("Leah","Rachel","Bilhah","Zilpah");

print "$wife{Jacob}\n";

$wife{"Jacob"} = ["Leah","Rachel","Bilhah","Zilpah"];

print "$wife{Jacob}\n";

$kide_of_wife{"Jacob"} = {
	"Leah" => ["Reuben","Simeon","Levi","Judah","Issachar","Zebulun"],
	"Rachel" => ["Joseph","Benjamin"],
	"Bilhap" => ["Dan","Naphtali"],
	"Zilpah" => ["Gad","Asher"]
};

print $kide_of_wife{"Jocob"}{"Leah"}[0];
