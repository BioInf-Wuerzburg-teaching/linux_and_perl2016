package fasta_kram;
use strict;
use warnings;
sub fasta_parser
{
    my $file=$_[0];
    my $sequence;
    my $id;
    my @elements;
    my %fasta;

    open(IN,$file) or die;

    while(<IN>)
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
    $fasta{$elements[0]} = {species=>$elements[1],
			    sequence=>$sequence};


}

close IN or die;
return %fasta;
}
sub print_fasta;
1;
