use strict;
use warnings;
use lib "./lib/";
use Fasta;

my $file= "rosalind_rna.txt";

my $parser= Fasta->new();

$parser->filename($file);

my $dna_Ts_replaced = $parser->dna2rna();
print $dna_Ts_replaced;
