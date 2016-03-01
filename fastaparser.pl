use warnings;
use strict; #mit my nur reingucken
use Data::Dumper;

sub fasta_parser
{
  my $sequence;
  my $id;
  my @elements;
  my %fasta;
  my $input=fanta.fasta;

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
