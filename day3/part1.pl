use strict;
use warnings;

my @map;
my $x_velocity = 3;

while (<>) {
    if ($_ =~ /([#\.]+)/) {
        my @row = split //, $1;
        push @map, \@row;   
    } else {
        die "Error: input regex didn't match";
    }
}

my $x_coord = 0;
my $x_wrap = scalar @{$map[0]};
my $tree_count = 0;

for (0 ..  scalar @map - 1) {
    $tree_count++ if ($map[$_]->[$x_coord] eq '#');
    $x_coord += $x_velocity;
    $x_coord -= $x_wrap if ($x_coord >= $x_wrap);
}

print "Answer: $tree_count";