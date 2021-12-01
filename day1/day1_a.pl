#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

my $target = 2020;

my $filename = 'day1_input';
open(FH, '<', $filename) or die $!;

my @numbers = <FH>;
close(FH);

my $highest_tested = 0;
for my $test_number (@numbers) {
    $highest_tested++;
    for my $second_number_index ($highest_tested .. scalar @numbers - 1) {
        if ($test_number +  $numbers[$second_number_index] == $target ) {
            my $answer = $test_number * $numbers[$second_number_index];
            print $answer;
        }
    }
}