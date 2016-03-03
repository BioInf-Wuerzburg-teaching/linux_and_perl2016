package Robot::Robodog;
use strict;
use warnings;

use parent qw(Robot);
#use Robot;
#our @ISA=qw(Robot);

sub new
{
    my $self={};
    bless $self, 'Robot::Robodog';
    $self= $self->SUPER::new();
    $self->{tail}='low';
    return $self;
}


1;
