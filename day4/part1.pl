use v5.10;
use strict;
use warnings;

my @passports;
my $current_passport = 0;
my @required_fields = ("byr","iyr","eyr","hgt","hcl","ecl","pid");

while (<>) {
    chomp;
    if ($_ eq "") {
        $current_passport++;
        next;
    }
    my @fields = split / /, $_;
    foreach (@fields) {
        my ($key, $value) = split /:/, $_;
        $passports[$current_passport]->{$key} = $value;
    }
}

my $valid_count = 0;
for my $passport (@passports) {
    my $valid = 1;
    map {$valid = 0 if (!defined  $passport->{$_})} @required_fields;
    $valid_count+= 1 if ($valid);
}

say $valid_count;