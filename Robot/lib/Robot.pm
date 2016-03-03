package Robot;

use 5.010001;
use strict;
use warnings;

our @ISA = qw();

our $VERSION = '0.1';


sub new
{
    my $robot={
	x=>0,
	y=>0,
	links=>"unten",
	rechts=>"unten",    
    };
    bless $robot, 'Robot';
    return $robot;
}

sub move
{
    my $self = shift;
}
sub pos
{
    my $self = shift;
    my @pos = ($self->{x},$self->{y});
    return @pos;
    
}

sub links
{
    my $self=shift;
    return $self->{links};
}
sub rechts
{
    my $robot=$_[0];
    my $pos_rechts=$robot->{'rechts'};
    return $pos_rechts;
}


sub links_switch{
    my $self=shift;
    if($self->{links} eq "unten")
    {
	$self->{links}="oben";
    }
    else
    {
	$self->{links}="unten";
    }
}



sub rechts_switch
{
}
1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Robot - Perl extension for blah blah blah

=head1 SYNOPSIS

  use Robot;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for Robot, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.


=head1 SEE ALSO

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

A. U. Thor, E<lt>biokurs@E<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2016 by A. U. Thor

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.18.2 or,
at your option, any later version of Perl 5 you may have available.


=cut
