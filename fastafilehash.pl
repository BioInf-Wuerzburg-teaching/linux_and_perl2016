use warnings;
use strict; #mit my nur reingucken
use Data::Dumper;

my $file='fanta.fasta'; #my ist mächtig wichtig!
my $sequence;
my $id;
my @elements;
my %fasta;

open(IN,$file) or die;

while(<IN>)
{
	chomp;
	my $zeile =$_;
	#chomp $zeile;
	
	if($zeile=~/>/) #dannHeaderalsoKey
	{
		@elements=split(/ /,$zeile);
           
                $sequence="";
           
	}
	else #musseswohlsequenceseinalso schreibesequence
	{
		$sequence=$sequence.$_;
	}
	$fasta{$elements[0]} = {species=>$elements[1], #generiert referenz auf anon hash
                                sequence=>$sequence};
#	print "@elements\n";
#	print "$sequence\n";

}

close IN or die;
print Dumper(\%fasta);