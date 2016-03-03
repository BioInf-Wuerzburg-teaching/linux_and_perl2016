use strict;
use warnings;

use Test::More;
BEGIN{ use_ok('Robot::Robodog') };


can_ok('Robot::Robodog', 'new');



done_testing();