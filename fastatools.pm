use warnings;
use strict; #mit my nur reingucken
use Data::Dumper;

package fastatools;
sub fasta_parser
{
  my $sequence;
  my $id;
  my @elements;
  my %fasta;
  my $input=$_[0];

  open(IN,$input) or die;

  while(<IN>)
  {
	chomp;
	my $zeile =$_;
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

  }

  close IN or die;
  return %fasta;

}

1;
