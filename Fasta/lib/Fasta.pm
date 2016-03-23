package Fasta;

use 5.010001;
use strict;
use warnings;

our @ISA = qw();

our $VERSION = '0.1';



sub new{
    my $class=shift;
    my $self={file=>'',};
    $class=ref($class)||$class;
    bless $self, $class;
    return $self;
}


sub filename{
    my $self=shift;
    if(@_){
	$self->{file}=shift;
	$self->_open();
    }
    return $self->{file};
}


sub _open{
    my $self=shift;
    open(my $fh, $self->filename()) or die "$!";
    $self->{fh}=$fh;
}

sub get_seq{
    my $self=shift;
    my $ID=shift;
    if(exists $self->{reads}->{$ID}){
	return $self->{reads}->{$ID};    
    }
    else{
	return undef;
    }
}

sub read{
    my $self=shift;
    my $sequence;
    my $id;
    my @elements;
    my %fasta;
    my $fh=$self->{fh};
    while(<$fh>)
    {
	chomp;
	my $zeile =$_;
    
	if($zeile=~/>/)
	{
	    @elements=split(/ /,$zeile);
	    
	    $sequence="";
	    
	}
	else
	{
	    $sequence=$sequence.$_;
	}
	$self->{reads}->{$elements[0]} = $sequence;
	
	
    }

}

sub get_id{
    my $self=shift;
    my @keys=keys %{$self->{reads}};
    return \@keys;
}

sub basecount{
    my $self=shift;
    my $ID=shift;
    my %bases;
    my $seq=$self->get_seq($ID);
    my $A= $seq=~ tr/'A'/'A'/;
    my $C= $seq=~ tr/'C'/'C'/;
    my $T= $seq=~ tr/'T'/'T'/;
    my $G= $seq=~ tr/'G'/'G'/;
    $bases{A}=$A;
    $bases{C}=$C;
    $bases{T}=$T;
    $bases{G}=$G;
    return \%bases;
}

sub get_counts{
    my $self=shift;
    my $ID=shift;
    my $hash=$self->basecount($ID);
    my %hash=%{$hash};
    foreach my $key(sort keys%hash){
	print "$key ";
    }
    print "\n";
    foreach my $key (sort keys%hash){
	print "$hash{$key} ";
    }
}

sub translate{
    my $self=shift;
    my $ID=shift;
    my $seq=$self->get_seq($ID);
    return $seq=~ tr /'T'/'U'/r;
}

sub reverse_complement{
    my $self=shift;
    my $ID=shift;
    my $seq=$self->get_seq($ID);
    $seq= reverse $seq;
    $seq=~ tr /GCTA/CGAT/;
    return $seq;
}

sub GC{
    my @Winner=(0,0);
    return \@Winner;
}



sub rna_translation{

}


# Preloaded methods go here.

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Fasta - Perl extension for blah blah blah

=head1 SYNOPSIS

  use Fasta;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for Fasta, created by h2xs. It looks like the
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

Biokurs, E<lt>biokurs@E<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2016 by Biokurs

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.20.2 or,
at your option, any later version of Perl 5 you may have available.


=cut
