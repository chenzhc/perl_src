#!/usr/bin/perl

my @array = (1+2,3-4,5*6, 7/8);

sort @array;

foreach $item (sort @array){
	print $item ."\n";
}


@days = 1..7;

print @days;
print "\n";

$x = 0b1100_0000;
print $x;
print "\n";

$fred[0] = "abc";
$fred[2] = "diddley";
$fred[1] = "whatsis";

print $fred[$#fred];
print "\n";
$number = 2.71828;
print $fred[$number-1] ."\n";

$blank = $fred[142_857];

if(!defined($blank)){
	print "\$blank is undef\n";
}
$blanc = $mel;
if(!defined($blank)){
	print "\$blanc is undef\n";
}
print $blanc."\n";

$rocks[0] = "bedrock";
$rocks[1] = "slate";
$rocks[2] = "lava";
$rocks[3] = "crushed rock";
$rocks[99] = "schist";

$end = $#rocks;
$number_of_rocks = $end+1;
$rocks[$#rocks] = "hard rock";
print $end ."\n";
print $number_of_rocks."\n";
print $rocks[$#rocks]."\n";

print $rocks[-1]."\n";
$dead_rock = $rocks[-100];
print $dead_rock."\n";
print $rocks[-200]."\n";

@numbers = (1,2,3);
print @numbers."\n";

@numbers2 = (1,2,3,);
print @numbers2."\n";

@numbers3 = ("fred", 4.5);
print @numbers3."\n";

@numbers4 = ();
print @numbers4."\n";

@numbers5 = (1..100);
print @numbers5."\n";
print $numbers5."\n";

sub print_arr {
	print "******* print_arr *****\n";

	my($item) = shift @_;
	foreach(@_){
		print $_.",";
	}
	print "\n";
}

&print_arr(@numbers5);


@rocks = qw{ flintstone slate rubble };
print "quartz @rocks limestone\n";

print "Three rocks are: @rocks.\n";
print "There's nothing in the parens (@empty) here.\n";

$email = "fred\@bedrock.edu";
print "$email.\n";
$email = 'fred@bedrock.edu';
print "$email.\n";

@fred = qw(hello dolly);
$y=2;
$x = "This is $fred[1]'s place";
print "$x.\n";
$x = "This is $fred[$y-1]'s place";
print "$x.\n";

@fred = qw( eating rocks is wrong);
$fred = "right";
print "this is $fred[3]\n";
print "this is ${fred}[3]\n";
print "this is $fred"."[3]\n";
print "this is $fred\[3]\n";

foreach $rock (qw/ bedrock slate lava /) 
{
	print "One rock is $rock.\n";
}

@rocks = qw/ bedrocks slate lava /;
foreach $rock(@rocks){
	$rock = "\t$rock";
	$rock.="\n";
}
print "The rocks are:\n",@rocks;

foreach (1..10) 
{
	print "I can count to $_!\n";
}

$_ = "Yabba dabba doo\n";
print;

@fred = 6..10;
@barney = reverse(@fred);
print "@barney"."\n";

@rocks = qw/ bedrock slate rubble granite /;
@sorted = sort(@rocks);
print "@sorted\n";
@back = reverse sort @rocks;
print "@back\n";
@rocks = sort @rocks;
print "@rocks\n";
@numbers = sort 97..102;
print "@numbers\n";

@people = qw( fred barney betty );
@sorted = sort @people;
print "@sorted\n";
$number = 42 + @people;
print "$number\n";

@list = @people;
$n = @people;
print "@list\n";
print "$n\n";

@backwards = reverse qw/ yabba dabba doo /;
print "@backwards\n";
$backwards = reverse qw/ yabba dabba doo /;
print "$backwards\n";

@fred = 6 * 7;
@barney = "hello" . ' ' . "world";
print "@fred\n";
print "@barney\n";

@wilma = undef;
print "@wilma\n";

@rocks = qw( talc quartz jade obsidian );
print "How many rocks do you have?\n";
print "I have ", @rocks, " rocks!\n";
print "I have ", scalar @rocks, " rocks!\n";
print "I have @rocks rocks!\n";
