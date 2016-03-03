use strict;
use warnings;



use Test::More;
BEGIN{ use_ok('Robot::Robodog') };


can_ok('Robot::Robodog', 'new');

my $Robodog = new_ok('Robot::Robodog');


#move
my $x_neu = 1;
my $y_neu = 1;
my @pos_neu = $Robodog->move($x_neu,$y_neu);
is($pos_neu [0],2, "x-coordinate=2");
is($pos_neu [1],2, "y-coordinate=2");

can_ok('Robot::Robodog', 'wag');

$Robodog->wag();
is($Robodog->{tail}, 'up');

done_testing();