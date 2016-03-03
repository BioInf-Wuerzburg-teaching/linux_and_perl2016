package Robot::Robodog;
use strict;
use warnings;

use parent qw(Robot);


sub new
{
    my $class=shift;
    $class=ref($class)||$class;
    my $self=$class->SUPER::new();
    $self->{tail}='low';
    return $self;
}


1;
