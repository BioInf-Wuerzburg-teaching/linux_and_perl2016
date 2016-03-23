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
    my $self=shift;
    my @IDs=@{$self->get_id};                   # der return aus get_id wird dereferenziert in @IDs abgelegt
    my $index=0;
    my %contents;                               # hash wird in while schleife mit IDs als key und GC-Content als value befüllt
    while($index<@IDs){                         # läuft bis alle IDs berechnet und abgelegt wurden
	my %bases=%{$self->basecount($IDs[$index])};# zieht die basecounts der aktuellen ID in ein hash
       	my $GCsum= $bases{G}+$bases{C};
	my $allsum= $bases{A}+$bases{T}+$GCsum;
	my $GC= $GCsum/=$allsum;
	$GC*=100;
	$contents{$IDs[$index]}=$GC;            # legt GC-Content mit aktueller ID als key ab
	$index++;
	}
    my @Winner=(0,0);                           # in diesem array sollen ID und Content der "Winner"-ID abgelegt werden
    my $high=1;                          # speichert den momentan höchsten GC-value
    foreach my $key (keys%contents){
	if ($contents{$key} > $high){            # vergleicht ob der GC-value des aktuellen Keys höher ist als der momentan Höchste
	    @Winner[0]=$key;
	    @Winner[1]=$contents{$key};
	    $high=$contents{$key};
	}
    }
    return \@Winner;
}



sub rna_translation{
    my $self=shift;
    my $ID=shift;
    my $rnaseq= $self->translate($ID);
    my @rnaseq= $rnaseq =~ /.../sg;
    my $index=0;
    while($index<@rnaseq){
	if ($rnaseq[$index] eq 'UUU'){
	    $rnaseq[$index]="F";
	}
	elsif ($rnaseq[$index] eq 'UUC'){
	    $rnaseq[$index]="F";
	}
	elsif ($rnaseq[$index] eq 'UUA'){
	    $rnaseq[$index]="L";
	}
	elsif ($rnaseq[$index] eq 'UUG'){
	    $rnaseq[$index]="L";
	}
	elsif ($rnaseq[$index] eq 'UCU'){
	    $rnaseq[$index]="S";
	}
	elsif ($rnaseq[$index] eq 'UCC'){
	    $rnaseq[$index]="S";
	}
	elsif ($rnaseq[$index] eq 'UCA'){
	    $rnaseq[$index]="S";
	}
	elsif ($rnaseq[$index] eq 'UCG'){
	    $rnaseq[$index]="S";
	}
	elsif ($rnaseq[$index] eq 'UAU'){
	    $rnaseq[$index]="Y";
	}
	elsif ($rnaseq[$index] eq 'UAC'){
	    $rnaseq[$index]="Y";
	}
	elsif ($rnaseq[$index] eq 'UAA'){
	    $rnaseq[$index]="stop";
	}
	elsif ($rnaseq[$index] eq 'UAG'){
	    $rnaseq[$index]="stop";
	}
	elsif ($rnaseq[$index] eq 'UGU'){
	    $rnaseq[$index]="C";
	}
	elsif ($rnaseq[$index] eq 'UGC'){
	    $rnaseq[$index]="C";
	}
	elsif ($rnaseq[$index] eq 'UGA'){
	    $rnaseq[$index]="stop";
	}
	elsif ($rnaseq[$index] eq 'UGG'){
	    $rnaseq[$index]="W";
	}
	elsif ($rnaseq[$index] eq 'CUU'){
	    $rnaseq[$index]="L";
	}
	elsif ($rnaseq[$index] eq 'CUC'){
	    $rnaseq[$index]="L";
	}
	elsif ($rnaseq[$index] eq 'CUA'){
	    $rnaseq[$index]="L";
	}
	elsif ($rnaseq[$index] eq 'CUG'){
	    $rnaseq[$index]="L";
	}
	elsif ($rnaseq[$index] eq 'CCU'){
	    $rnaseq[$index]="P";
	}
	elsif ($rnaseq[$index] eq 'CCC'){
	    $rnaseq[$index]="P";
	}
	elsif ($rnaseq[$index] eq 'CCA'){
	    $rnaseq[$index]="P";
	}
	elsif ($rnaseq[$index] eq 'CCG'){
	    $rnaseq[$index]="P";
	}
	elsif ($rnaseq[$index] eq 'CAU'){
	    $rnaseq[$index]="H";
	}
	elsif ($rnaseq[$index] eq 'CAC'){
	    $rnaseq[$index]="H";
	}
	elsif ($rnaseq[$index] eq 'CAA'){
	    $rnaseq[$index]="Q";
	}
	elsif ($rnaseq[$index] eq 'CAG'){
	    $rnaseq[$index]="Q";
	}
	elsif ($rnaseq[$index] eq 'CGU'){
	    $rnaseq[$index]="R";
	}
	elsif ($rnaseq[$index] eq 'CGC'){
	    $rnaseq[$index]="R";
	}
	elsif ($rnaseq[$index] eq 'CGA'){
	    $rnaseq[$index]="R";
	}
	elsif ($rnaseq[$index] eq 'CGG'){
	    $rnaseq[$index]="R";
	}
	elsif ($rnaseq[$index] eq 'AUU'){
	    $rnaseq[$index]="I";
	}
	elsif ($rnaseq[$index] eq 'AUC'){
	    $rnaseq[$index]="I";
	}
	elsif ($rnaseq[$index] eq 'AUA'){
	    $rnaseq[$index]="I";
	}
	elsif ($rnaseq[$index] eq 'AUG'){
	    $rnaseq[$index]="M";
	}
	elsif ($rnaseq[$index] eq 'ACU'){
	    $rnaseq[$index]="T";
	}
	elsif ($rnaseq[$index] eq 'ACC'){
	    $rnaseq[$index]="T";
	}
	elsif ($rnaseq[$index] eq 'ACA'){
	    $rnaseq[$index]="T";
	}
	elsif ($rnaseq[$index] eq 'ACG'){
	    $rnaseq[$index]="T";
	}
	elsif ($rnaseq[$index] eq 'AAU'){
	    $rnaseq[$index]="N";
	}
	elsif ($rnaseq[$index] eq 'AAC'){
	    $rnaseq[$index]="N";
	}
	elsif ($rnaseq[$index] eq 'AAA'){
	    $rnaseq[$index]="K";
	}
	elsif ($rnaseq[$index] eq 'AAG'){
	    $rnaseq[$index]="K";
	}
	elsif ($rnaseq[$index] eq 'AGU'){
	    $rnaseq[$index]="S";
	}
	elsif ($rnaseq[$index] eq 'AGC'){
	    $rnaseq[$index]="S";
	}
	elsif ($rnaseq[$index] eq 'AGA'){
	    $rnaseq[$index]="R";
	}
	elsif ($rnaseq[$index] eq 'AGG'){
	    $rnaseq[$index]="R";
	}
	elsif ($rnaseq[$index] eq 'GUU'){
	    $rnaseq[$index]="V";
	}
	elsif ($rnaseq[$index] eq 'GUC'){
	    $rnaseq[$index]="V";
	}
	elsif ($rnaseq[$index] eq 'GUA'){
	    $rnaseq[$index]="V";
	}
	elsif ($rnaseq[$index] eq 'GUG'){
	    $rnaseq[$index]="V";
	}
	elsif ($rnaseq[$index] eq 'GCU'){
	    $rnaseq[$index]="A";
	}
	elsif ($rnaseq[$index] eq 'GCC'){
	    $rnaseq[$index]="A";
	}
	elsif ($rnaseq[$index] eq 'GCA'){
	    $rnaseq[$index]="A";
	}
	elsif ($rnaseq[$index] eq 'GCG'){
	    $rnaseq[$index]="A";
	}
	elsif ($rnaseq[$index] eq 'GAU'){
	    $rnaseq[$index]="D";
	}
	elsif ($rnaseq[$index] eq 'GAC'){
	    $rnaseq[$index]="D";
	}
	elsif ($rnaseq[$index] eq 'GAA'){
	    $rnaseq[$index]="E";
	}
	elsif ($rnaseq[$index] eq 'GAG'){
	    $rnaseq[$index]="E";
	}
	elsif ($rnaseq[$index] eq 'GGU'){
	    $rnaseq[$index]="G";
	}
	elsif ($rnaseq[$index] eq 'GGC'){
	    $rnaseq[$index]="G";
	}
	elsif ($rnaseq[$index] eq 'GGA'){
	    $rnaseq[$index]="G";
	}
	elsif ($rnaseq[$index] eq 'GGG'){
	    $rnaseq[$index]="G";
	}
	else{
	    print "String fehlehrhaft oder zu Ende";
	}
	$index++;
    }
    $index=0;
    my $proteinseq="";
    while($index<@rnaseq){
	$proteinseq=$proteinseq.$rnaseq[$index];
	$index++;
    }
    return $proteinseq;
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
