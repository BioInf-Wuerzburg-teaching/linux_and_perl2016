use strict;
use warnings;
use lib "./lib/";
use Fasta;

my $file= "rosalind_hamm2.txt";

my $parser= Fasta->new();

$parser->filename($file);


my $num_mismatch=$parser->put_zeile_into_array();
print "$num_mismatch\n";


#my $string1 = $beidezeilen[0];
#my $string2 = $beidezeilen[1];
#my @string1=split('', $string1);
#my @string2=split('', $string2);
#
#my $num_mismatch = 0;
#my $len = length($string1);
#for (my $i=0; $i<$len; $i++){
#    ++$num_mismatch if substr($string1, $i, 1) ne substr($string2, $i, 1);
#}
#print $num_mismatch;

