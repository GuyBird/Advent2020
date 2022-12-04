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
    map {$valid = 0 if (!defined $passport->{$_})} @required_fields;
    next if (!$valid);

    $valid_count+= 1 if (valid_password_fields($passport));
}

say $valid_count;


sub valid_password_fields {
    my ($passport) = @_;

    return 0 if ($passport->{"byr"} !~ /^\d{4}$/ or ($passport->{"byr"} < 1920 or $passport->{"byr"} > 2002));
    return 0 if ($passport->{"iyr"} !~ /^\d{4}$/ or ($passport->{"iyr"} < 2010 or $passport->{"iyr"} > 2020));
    return 0 if ($passport->{"eyr"} !~ /^\d{4}$/ or ($passport->{"eyr"} < 2020 or $passport->{"eyr"} > 2030));
    return 0 if (!valid_height($passport->{"hgt"}));
    return 0 if ($passport->{"hcl"} !~ /^\#[a-f0-9]{6}$/);
    return 0 if ($passport->{"ecl"} !~ /^amb|blu|brn|gry|grn|hzl|oth$/);
    return 0 if ($passport->{"pid"} !~ /^\d{9}$/);

    return 1;
}

sub valid_height {
    my ($height) = @_;

    if ($height =~ /^(\d+)(\w+)$/) {
        return 1 if ($2 eq "cm" and $1 >= 150 and $1 <= 193);
        return 1 if ($2 eq "in" and $1 >= 59 and $1 <= 76);
    }
    return 0;
}