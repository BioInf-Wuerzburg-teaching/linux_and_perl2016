# Before 'make install' is performed this script should be runnable with
# 'make test'. After 'make install' it should work as 'perl Robot.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;
use warnings;

use Test::More;

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

ok($Robot->{links} ne undef, "Test Undef");

my$expect=$Robot->{links};
$Robot->links;
is($Robot->{links},$expect , "Test Links");

can_ok('Robot', 'rechts');

my $pos_rechts=$Robot->rechts();
is($pos_rechts, 'unten');

can_ok('Robot', 'links_switch');
$Robot->links_switch;
is($Robot->{links}, "oben", "Test Switch Links");
$Robot->links_switch;
is($Robot->{links}, "unten", "Test Switch Links2");
done_testing();