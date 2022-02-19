use strict;
use warnings;

my @map;
my @x_velocities = (1,3,5,7, 0.5);

while (<>) {
    if ($_ =~ /([#\.]+)/) {
        my @row = split //, $1;
        push @map, \@row;   
    } else {
        die "Error: input regex didn't match";
    }
}

my $x_wrap = scalar @{$map[0]};
my %tree_count;

foreach my $x_velocity (@x_velocities) {
    my $x_coord = 0;
    for (0 ..  scalar @map - 1) {
        unless ($x_coord =~ /\d+\.5/) {
            $tree_count{$x_velocity}++ if ($map[$_]->[$x_coord] eq '#');
        }
        $x_coord += $x_velocity;
        $x_coord -= $x_wrap if ($x_coord >= $x_wrap);
    }
}

my $final_count = 1;
map {$final_count *= $tree_count{$_}} (keys %tree_count);
print "Answer: $final_count";