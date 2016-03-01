use warnings;
use strict;
package read_fasta;

sub read_fasta
{
    my @elements;
    my %fasta;
    my $seq="";
    my $datei = $_[0];
    open (IN, $datei) or die;
    while(<IN>)
    {
	chomp;
	my $zeile = $_;
	if($zeile =~/>/)
	{
	    @elements = split(/ /,$zeile);
	    $seq = "";
	}
	else
	{
	    $seq = $seq.$_;
	}
	$fasta{$elements[0]} = {species=>$elements[1],
				seq=>$seq};
    }
    close IN;
    return %fasta;
}
1;

