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
	return $self->{reads}->{$ID};    # sequenz noch nicht unter dem key abgelegt
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

sub count_base{
    my $self=shift;
    my $ID=shift;
    my $seq = $self->get_seq($ID);
    my $countA = ($seq =~ tr/A//);
    my $countC = ($seq =~ tr/C//);
    my $countG = ($seq =~ tr/G//);
    my $countT = ($seq =~ tr/TU//);

    my $counts = [$countA, $countC, $countG, $countT,];
    return $counts;
};

sub transcribe{
    my $self = shift;
    my $ID = shift;
    my $seq = $self->get_seq($ID);
    $seq =~ s/T/U/g;
    return $seq;
};

sub rev_comp{
    my $self = shift;
    my $ID = shift;
    my $seq =$self->get_seq($ID);
    $seq =~ tr/ATGC/TACG/;
    $seq = reverse $seq;
    return $seq;
   
};

sub GC_cont {
    my $self = shift;
    my $IDs = $self->get_id();
    my @IDsarr = @{$IDs};
    my $anz = $#IDsarr;
    my %GC_counts;
    for(my $i=0; $i<=$anz; $i++){
	my $counts = $self->count_base($IDsarr[$i]);
	my $GC = $counts->[1] + $counts->[2]; # G and C in Array
	my $all = $counts->[0] + $counts->[1] + $counts->[2] + $counts->[3];
	my $cont = ($GC/$all)*100;
	$GC_counts{$cont} = $IDsarr[$i];
	
    }
   
    keys %GC_counts;
    my ($largest_key, $largest_val) = each %GC_counts;
    while (my ($key, $val) = each %GC_counts){
	if ($key > $largest_key){
	    $largest_val = $val;
	    $largest_key = $key;
	}
    }
    my $rounded = sprintf("%.6f", $largest_key);
    return [$GC_counts{$largest_key}, $rounded];
    
};

sub translate{
    my $self = shift;
    my $ID = shift;
    my $seq = $self->get_seq($ID);
    my %codons = (
	"GGA" => "G", "GGG" => "G", "GGC" => "G", "GGU" => "G",
	"GCA" => "A", "GCC" => "A", "GCG" => "A", "GCU" => "A",
	"GUA" => "V", "GUC" => "V", "GUG" => "V", "GUU" => "V",
	"CCA" => "P", "CCC" => "P", "CCG" => "P", "CCU" => "P",
	"UCA" => "S", "UCC" => "S", "UCG" => "S", "UCU" => "S",
	"CUA" => "L", "CUC" => "L", "CUG" => "L", "CUU" => "L",
	"CGA" => "R", "CGC" => "R", "CGG" => "R", "CGU" => "R",
	"ACA" => "T", "ACC" => "T", "ACG" => "T", "ACU" => "T",
	"AUA" => "I", "AUC" => "I", "AUU" => "I", "AUG" => "M",
	"UAA" => "|", "UAG" => "|", "UGA" => "|", "CAU" => "H",
	"AAA" => "K", "AAG" => "K", "UAC" => "Y", "UAU" => "Y",
	"AGC" => "S", "AGU" => "S", "UGC" => "C", "UGU" => "C",
	"UUA" => "L", "UUG" => "L", "CAA" => "Q", "CAG" => "Q",
	"AGA" => "R", "AGG" => "R", "AAC" => "N", "AAU" => "N",
	"UUC" => "F", "UUU" => "F", "GAC" => "D", "GAU" => "D",
	"GAA" => "E", "GAG" => "E", "UGG" => "W", "CAC" => "H",
	);
    
    my $prot ="";
    for(my $i=0; $i<length($seq)-2; $i+=3){
	my $trip = substr($seq,$i,3);
	$prot .= $codons{$trip};
    }
    return $prot;
};

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
