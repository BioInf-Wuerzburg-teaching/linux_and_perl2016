use warnings;
use strict;

#BEGIN FASTA ROUTINE MODUL
package fpr;

#SUBROUTINE
sub fasta_parser
{
	my $input=$_[0];
	my $sequence;
	my $id;
	my @elements;
	my %fasta;
	open(IN,$input) or die;

while(<IN>)
{
	chomp;
	my $zeile =$_;
	#chomp $zeile; #chomp nimmt leerzeichen \n weg
	
	if($zeile=~/>/) #dannHeaderalsoKey #tilde spezifiziert anfang der zeile
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
	#print "@elements\n";
	#print "$sequence\n";

}

close IN or die;
return %fasta;

}




#END FASTA ROUTINE MODUL
1;