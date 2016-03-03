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

sub move
{
    my $self=shift;
    $self->SUPER::move($_[0]*2,$_[1]*2);
    return $self->pos();
}

1;
