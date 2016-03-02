# Before 'make install' is performed this script should be runnable with
# 'make test'. After 'make install' it should work as 'perl Robot.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;
use warnings;

use Test::More tests => 3;
BEGIN { use_ok('Robot') };

#########################

can_ok('Robot', 'new');

my $Robot = new_ok('Robot');