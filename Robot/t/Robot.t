# Before 'make install' is performed this script should be runnable with
# 'make test'. After 'make install' it should work as 'perl Robot.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;
use warnings;

use Test::More tests => 8;
BEGIN { use_ok('Robot') };

#########################

can_ok('Robot', 'new');
my $Robot = new_ok('Robot');



#move
can_ok("Robot", "move");
can_ok("Robot", "pos");
my @pos=$Robot->pos();
is($pos[0],0, "x-coordinate=0");
is($pos[1],0, "y-coordinate=0");


can_ok('Robot','links');

