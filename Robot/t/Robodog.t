use strict;
use warnings;



use Test::More;
BEGIN{ use_ok('Robot::Robodog') };


can_ok('Robot::Robodog', 'new');

my $Robodog = new_ok('Robot::Robodog');

done_testing();