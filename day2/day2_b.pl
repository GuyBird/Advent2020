#!/usr/bin/perl

use strict;
use warnings;

my $filename = 'day2_input';
open(FH, '<', $filename) or die $!;

my @passwords = <FH>;
close(FH);

my $valid_passwords = 0;
for (@passwords) {
    if ($_ =~ /(\d+)-(\d+)\W(\w):\W(\w+)/) {
        my $first_char = substr $4, $1 -1, 1;
        my $second_char = substr $4, $2 -1, 1;
        $valid_passwords++ if $second_char eq $3 xor $first_char eq $3;
    } else {
        print "[ERROR] password REGEX did not match\n";
    }
}

print $valid_passwords;