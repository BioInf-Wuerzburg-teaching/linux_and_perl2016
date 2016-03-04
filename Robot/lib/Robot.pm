package Robot;
=head1 Robot

Dieses  Programm baut extrem coole Roboter, die ueber die Faehigkeit verfuegen sich und ihre Arme zu bewegen.Zudem sind sie in der Lage ihre eigene Position, sowie die Position ihrer Arme zurueckzugeben.

=cut
use 5.010001;
use strict;
use warnings;

our @ISA = qw();

our $VERSION = '0.1';

=head1 new()

Diese Subroutine baut einen extrem coolen Roboter
    $var=Robot::new();
Der Roboter wird auf der Position 0|0 erschaffen und verfuegt ueber zwei Arme, die beide nach unten gerichtet sind.

=cut
sub new
{
    my $class=shift;
    $class=ref($class)||$class;
    my $robot={
	x=>0,
	y=>0,
	links=>"",
	rechts=>"",    
    };
    bless $robot, $class;
    $robot->_switch('links');
    $robot->_switch('rechts');
    return $robot;
}
=head1 move()

Diese Subroutine bewegt den Roboter auf die Koordinaten x,y.
    $robot->move($x,$y);

=cut
sub move
{
    my $self = shift;
    $self->{x}=$_[0];
    $self->{y}=$_[1];
    return $self->pos();
}
=head1 pos()

Diese Subroutine laesst den Roboter seine aktuelle Position im Koordinatensystem ausgeben.
    $robot->pos();

=cut
sub pos
{
    my $self = shift;
    my @pos = ($self->{x},$self->{y});
    return @pos;
    
}
=head1 links()

Diese Subroutine laesst den Roboter die Position seines linken Armes ausgeben.
    $robot->links();

=cut
sub links
{
    my $self=shift;
    return $self->{links};
}
=head1 rechts()

Diese Subroutine laesst den Roboter die Position seines rechten Armes ausgeben.
    $robot->rechts();

=cut
sub rechts
{
    my $robot=$_[0];
    my $pos_rechts=$robot->{'rechts'};
    return $pos_rechts;
}

sub _switch
{ 
    my $self=shift;
    my $part=shift;
    if($self->{$part} eq "unten")
    {
	$self->{$part}="oben";
    }
    else
    {
	$self->{$part}="unten";
    }
}
=head1 links_switch()

Diese Subroutine laesst den Roboter die Position seines linken Armes wechseln.
    $robot->links_switch();

=cut
sub links_switch
{
    my $self=shift;
    $self->_switch('links');
}
=head1 rechts_switch()

Diese Subroutine  laesst den Roboter seinen rechten Arm nach oben nehmen.
    $robot->rechts_switch();

=cut
sub rechts_switch
{
    my $self=shift;
    $self->_switch('rechts');
}
=head1 AUTOR

Linux_und_Perl-Gefangene 2016

=cut
1;
__END__

