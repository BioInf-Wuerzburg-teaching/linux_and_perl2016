use warnings;
use strict;
#use Test::More;

package Roboter_module;

sub new{
    my $self = { "links" => "unten",
		  "rechts" => "unten",
		  "pos" => [0,0]};
    bless $self, "Roboter_module";
    return $self;
    
}

sub arm_change{
    my $self = shift;
    my $arm = shift;
    my $wechsel = shift;
    if($self->{$arm} eq $wechsel){
	print "$arm ist bereits $wechsel\n";
    }
    else {
	$self->{$arm} = $wechsel;
    }
    
}


sub move {
    my $self = shift;
    my ($x, $y) = @_;
    $self->{"pos"} = [$x,$y];
}

1;
    
    
