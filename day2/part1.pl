#!/usr/bin/perl

use strict;
use warnings;

my $filename = 'input';
open(FH, '<', $filename) or die $!;

my @passwords = <FH>;
close(FH);

my $valid_passwords = 0;
for (@passwords) {
    if ($_ =~ /(\d+)-(\d+)\W(\w):\W(\w+)/) {
        my $min_matches =  $1;
        my $max_matches =  $2;
        my $matches = () = $4 =~ /$3/g;
        $valid_passwords++ if ($min_matches <= $matches && $matches <= $max_matches);
    } else {
        print "[ERROR] password REGEX did not match\n";
    }
}

print $valid_passwords;