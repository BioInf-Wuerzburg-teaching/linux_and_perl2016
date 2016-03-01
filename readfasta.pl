use warnings;
use strict;

my @elements;
my %fasta;
my $seq="";
my $datei = "fastatest.fasta";
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
    #print "@elements\n";
    #print "$seq\n";
}
close IN;

foreach my $bla (keys %fasta)
{
    print "$bla\n";
    print "$fasta{$bla}->{species}\n";
    print "$fasta{$bla}->{seq}\n \n";
}

