#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

my $target = 2020;

my $filename = 'input';
open(FH, '<', $filename) or die $!;

my @numbers = <FH>;
close(FH);


my $highest_tested = 0;
for my $test_number (@numbers) {
    $highest_tested++;
    for my $second_number_index ($highest_tested .. scalar @numbers - 1) {
        if ($test_number +  $numbers[$second_number_index] < $target ) {
            for my $third_number_index ($second_number_index .. scalar @numbers - 1) {
                if ($test_number + $numbers[$second_number_index] + $numbers[$third_number_index] == $target) {
                    my $answer = $test_number * $numbers[$second_number_index] * $numbers[$third_number_index];
                    print $answer; 
                }
            }
        }
    }
}