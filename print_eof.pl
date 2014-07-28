#!/usr/bin/perl

print <<EOF;
	The price is $Price.
EOF

print <<"EOF";
The price is $Price.
EOF

print <<'EOF';
All things (e.g. a camel's journey through
A needle's eye) are possible, it's true.
But picture how the camel feels, squeezed out
In one long bloody thread, from tail to snout.
					-- C.S. Lewis
EOF

print << x 10;
The camels are coming! Hurrah! Hurrah!

print <<"" x 10;
The Camels are coming! Hurrah! Hurrah!

print <<`EOC`;
echo hi there
echo hi there
EOC

print <<'odd'
2345
odd
    +10000;
