package Robot::Robodog;
=head1 Robodog

Dieses Programm baut noch extrem coolere Robodog. Diese verfuegen ueber alle Funktionen eines normalen Robots, sowie ueber eine Rute. Sie sind in der Lage diese Rute zu bewegen.
WUFF

=cut
use strict;
use warnings;

use parent qw(Robot);

=head1 new()

Diese Subroutine erschafft einen neuen Robodog.
    $var=Robot::Robodog::new();
Der Robodog wird auf Position 0|0 erchaffen. Seine Arme, sowie seine Rute sind nach unten gerichtet.

=cut
sub new
{
    my $class=shift;
    $class=ref($class)||$class;
    my $self=$class->SUPER::new();
    $self->{tail}='low';
    return $self;
}
=head1 move()

Diese Subroutine bewegt den Robodog im Koordinatensystem.
    $robodog->move($x,$y);
Der Robodog bewegt sich im Vergleich zum normalen Robot doppelt so schnell.

=cut
sub move
{
    my $self=shift;
    $self->SUPER::move($_[0]*2,$_[1]*2);
    return $self->pos();
}
=head1 wag() 

Subroutine, um die Position des Schwanzes des Roboterhundes nach oben zu aendern
    $robodog->wag()
Hebt die Rute an.

=cut 
sub wag
{my $self=shift;
 $self->{tail}='up';
}
=head1 AUTOR

RoboWUFF

=cut
1;
